const { result } = require('lodash');
var lodash = require('lodash/lodash.js');

Parse.Cloud.define("home", async (request) => {
  //most played quiz
  const Quiz = new Parse.Query('Quiz');
  Quiz.include("category")
  try {
    const allQuizzes = await Quiz.find();
    console.log(allQuizzes);
    const allQuizzes_1 = await allQuizzes.map((e) => {

      return {
        "_id": e.id,
        'title': e.get('title'),
        'description': e.get('description'),
        'category': { 'title': e.get('category').get('title'), '_id': e.get('category').id, 'createdAt': e.get('category').get('createdAt').toJSON(), 'updatedAt': e.get('category').get('updatedAt').toJSON() },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    const randomQuizzes = lodash.sampleSize(allQuizzes_1, 5); // Get 5 random quizzes
    const randomMostPlayedQuiz = lodash.sample(allQuizzes_1); // Get a random most played quiz

    return {
      code: 200, status: true, message: '',
      quizzes: randomQuizzes,
      most_played_quiz: randomMostPlayedQuiz
    };
  }
  catch (err) {
    throw new Error(err);
  }
}
);


Parse.Cloud.define("feed", async (request) => {

  var skip = request.params.skip;
  if (!skip) {
    skip = 0;
  }


  const Feed = new Parse.Query('Feed');
  Feed.include("post")
  Feed.include("post.school")
  Feed.descending("updatedAt");
  Feed.skip(skip);
  Feed.limit(2);

  try {
    const allFeedPosts = await Feed.find();

    const results = await Promise.all(allFeedPosts.map(async (e) => {
      //get coments

      const PostObj = new Parse.Object("Posts");
      PostObj.id = e.get("post").id
      const commentsQuery = new Parse.Query("Comments");

      commentsQuery.equalTo("post", PostObj);
      commentsQuery.include("user");
      const comments = await commentsQuery.find();

      commentsResult = comments.map((comment) => {
        return {
          id: comment.id,
          comment: comment.get('comment'),
          user: {
            id: comment.get('user').id,
            firstname: comment.get('user').get('firstname'),
            lastname: comment.get('user').get('lastname'),
            profilePic: comment.get('user').get('profilePic'),
            userName: comment.get('user').get('username')
          },
          createdAt: comment.get('createdAt').toJSON(),
          updatedAt: comment.get('updatedAt').toJSON(),
        }
      });


      return {
        "id": e.id,
        'photoUrl': e.get('post').get('imageUrl'),
        'caption': e.get('post').get('caption'),
        'school': {
          id: e.get('post').get('school').id,
          schoolName: e.get('post').get('school').get("name"),
          city: e.get('post').get('school').get('city'),
          // profilePic: e.get('post').get('school')
          profilePic: ''
        },
        'comments': commentsResult,
        'likes': e.get('likes'),
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    }));
    return {
      code: 200, status: true, message: '',
      posts: results
    };

  }
  catch (err) {
    throw new Error(err);
  }
}
);

Parse.Cloud.define("discover", async (request) => {

  const Quiz = new Parse.Query('Quiz');
  Quiz.include('category')
  const QuizCategory = new Parse.Query('QuizCategory');
  const QuizResult = new Parse.Query('QuizResult');
  try {

    const currentDate = new Date();
    const oneWeekAgo = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000);

    const allQuizzes = await Quiz.first();

    //add a filter to pick top quiz
    const randomTopPickQuiz = {
      '_id': allQuizzes.id,
      'title': allQuizzes.get('title'),
      'description': allQuizzes.get('description'),
      'category': { 'title': allQuizzes.get('category').get('title'), '_id': allQuizzes.get('category').id, 'createdAt': allQuizzes.get('category').get('createdAt').toJSON(), 'updatedAt': allQuizzes.get('category').get('updatedAt').toJSON(), 'quizCount': 0 },
      'createdAt': allQuizzes.get('createdAt').toJSON(),
      'updatedAt': allQuizzes.get('updatedAt').toJSON(),
      'v': allQuizzes.get('v')
    }


    const allQuizCategories = await QuizCategory.find();

    const quizCategoriesWithCounts = await Promise.all(
      allQuizCategories.map(async (category) => {
        // const quizCount = await Quiz.countDocuments({ category: category._id });
        // console.log(category.id)
        const searchQuiz = new Parse.Object("QuizCategory");
        searchQuiz.id = category.id
        const QuizCount = new Parse.Query('Quiz');
        QuizCount.equalTo('category', searchQuiz)
        const quizCount = await QuizCount.count();
        return {
          _id: category.id ?? 'randomId',
          title: category.get('title'),
          createdAt: category.get('createdAt').toJSON(),
          updatedAt: category.get('updatedAt').toJSON(),
          quizCount: quizCount,
        };
      })
    );

    QuizResult.greaterThanOrEqualTo('updatedAt', oneWeekAgo);
    QuizResult.include("user");
    QuizResult.lessThan('updatedAt', currentDate);
    QuizResult.descending("points");

    const weekTopRank = await QuizResult.first();
    const weekTopRankJSON = weekTopRank != undefined ? {
      'quizWon': weekTopRank.get('quizWon'),
      '_id': weekTopRank.id,
      'user': {
        '_id': weekTopRank.get('user').id,
        'firstname': weekTopRank.get('user').get('firstname'),
        'lastname': weekTopRank.get('user').get('lastname'),
        'email': weekTopRank.get('user').get('email') ?? 'dummy_email@gmail.com',
        'mobile': weekTopRank.get('user').get('mobile'),
        'about': weekTopRank.get('user').get('about'),
        'role': weekTopRank.get('user').get('role'),
        'isMobileNumberVerified': weekTopRank.get('user').get('isMobileNumberVerified'),
        'isEmailVerified': weekTopRank.get('user').get('isEmailVerified'),
        'isBlocked': weekTopRank.get('user').get('isBlocked'),
        'createdAt': weekTopRank.get('user').get('createdAt').toJSON(),
        'updatedAt': weekTopRank.get('user').get('updatedAt').toJSON(),
        // 'v':.get('userparseUserDetail.get('v'),
        'profilePic': weekTopRank.get('user').get('profilePic'),
      },
      'points': weekTopRank.get('points'),
      'quizPlayed': weekTopRank.get('quizPlayed'),
      'createdAt': weekTopRank.get('createdAt').toJSON(),
      'updatedAt': weekTopRank.get('updatedAt').toJSON(),
    } : {};
    // console.log(weekTopRankJSON)

    return {
      code: 200, status: true, message: '',
      top_pic_quiz: randomTopPickQuiz,
      week_top_rank: weekTopRankJSON,
      quiz_categories: quizCategoriesWithCounts
    };
  }
  catch (err) {
    throw new Error(err);
  }
});


Parse.Cloud.define("profile", async (request) => {

  let userId = request.params._id || 'xaXPNAZr3h';

  try {
    const User = new Parse.Query("_User");
    User.equalTo("objectId", userId);
    const parseUserDetail = await User.first();

    const userDetail = {
      '_id': userId,
      'firstname': parseUserDetail.get('firstname'),
      'lastname': parseUserDetail.get('lastname'),
      'email': parseUserDetail.get('email') ?? 'dummy_email@gmail.com',
      'mobile': parseUserDetail.get('mobile'),
      'about': parseUserDetail.get('about'),
      'role': parseUserDetail.get('role'),
      'isMobileNumberVerified': parseUserDetail.get('isMobileNumberVerified'),
      'isEmailVerified': parseUserDetail.get('isEmailVerified'),
      'isBlocked': parseUserDetail.get('isBlocked'),
      'createdAt': parseUserDetail.get('createdAt').toJSON(),
      'updatedAt': parseUserDetail.get('updatedAt').toJSON(),
      // 'v':parseUserDetail.get('v'),
      'profilePic': parseUserDetail.get('profilePic'),
    }
    // console.log(userDetail)
    const CurrentUser = new Parse.Object("_User");
    CurrentUser.id = userId;

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.equalTo('user', CurrentUser);
    const stats = await QuizResult.first();
    // console.log(stats);
    const Quiz = new Parse.Query("Quiz");
    let rank = null;
    let successRate = 0;
    let averagePointsPerQuiz = 0;
    // const totalQuizzesAvailable = await Quiz.countDocuments();
    const totalQuizzesAvailable = await Quiz.count();
    let quizParticipationRate = 0;
    let statsResult = null;

    if (stats) {
      successRate = (stats.get('quizWon') / stats.get('quizPlayed')) * 100;
      averagePointsPerQuiz = stats.get('points') / stats.get('quizPlayed');
      quizParticipationRate = (stats.get('quizPlayed') / totalQuizzesAvailable) * 100;

      const userPoints = stats.get('points');

      const QuizResult_2 = new Parse.Query('QuizResult');
      QuizResult_2.greaterThan("points", userPoints);
      const higherRankUsers = await QuizResult_2.count();

      rank = higherRankUsers + 1;

      statsResult = {
        'quiz_won': stats.get('quizWon'),
        '_id': stats.id ?? "randomId",
        'points': stats.get('points'),
        'total_quiz_played': stats.get('quizPlayed'),
        'rank': rank,
        'success_rate': successRate,
        'average_points_per_quiz': averagePointsPerQuiz,
        'quiz_participation_rate': quizParticipationRate,
        'createdAt': stats.get('createdAt').toJSON(),
        'updatedAt': stats.get('updatedAt').toJSON()

      };
    }

    return {
      code: 200, status: true, message: 'Profile details fetched successfully',
      user_detail: userDetail,
      // badge: {},
      stats: statsResult,
    };
  }
  catch (err) {
    throw new Error(err);
  }
});


Parse.Cloud.define("leaderboard", async (request) => {
  try {
    const currentDate = new Date();
    const oneWeekAgo = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000);

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.include("user");
    QuizResult.greaterThanOrEqualTo('updatedAt', oneWeekAgo);
    QuizResult.lessThan('updatedAt', currentDate);
    QuizResult.descending("points");
    // QuizResult.limit(10);



    const weeklyLeaderboard = await QuizResult.find();

    const weeklyLeaderboardResult = weeklyLeaderboard.map((e) => {
      return {
        quizWon: e.get('quizWon'),
        _id: e.id,
        points: e.get('points'),
        quizPlayed: e.get('quizPlayed'),
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
        user: {
          '_id': e.get('user').id,
          'firstname': e.get('user').get('firstname'),
          lastname: e.get('user').get('lastname'),
          profilePic: e.get('user').get('profilePic')

        }
      };
    });

    // // const allTimeLeaderboard = await QuizResult_2.find().sort({ points: -1 })
    // //   .populate('user', 'firstname lastname profilePic'); // Populate user details with specified fields

    const QuizResult_2 = new Parse.Query("QuizResult");
    QuizResult_2.include("user");
    QuizResult_2.descending("points");


    const allTimeLeaderboard = await QuizResult_2.find();
    const allTimeLeaderboardResult = allTimeLeaderboard.map((e) => {
      return {
        quizWon: e.get('quizWon'),
        _id: e.id,
        points: e.get('points'),
        quizPlayed: e.get('quizPlayed'),
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
        user: {
          '_id': e.get('user').id,
          'firstname': e.get('user').get('firstname'),
          lastname: e.get('user').get('lastname'),
          profilePic: e.get('user').get('profilePic')

        }
      };
    })
    // console.log(allTimeLeaderboardResult);
    if (allTimeLeaderboardResult.length > 0) {
      return {
        code: 200, status: true, message: '',
        all_time_leaderboard: allTimeLeaderboardResult,
        weekly_leaderboard: weeklyLeaderboardResult
      };
    } else {
      return { code: 404, status: false, message: 'No data found' };
    }
  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('questions', async (request) => {

  const quizId = request.params.quizId;
  try {
    if (!quizId)
      return ({ code: 400, status: false, message: 'Invalid quiz_id format' });

    const Quiz = new Parse.Query("Quiz");
    Quiz.include("category");
    Quiz.equalTo("objectId", quizId);
    const quiz = await Quiz.first();


    if (!quiz)
      return (({ code: 400, status: false, message: 'Invalid quiz_id format' }));

    quizResult = {
      _id: quiz.id,
      title: quiz.get('title'),
      'category': { 'title': quiz.get('category').get('title'), '_id': quiz.get('category').id, 'createdAt': quiz.get('category').get('createdAt').toJSON(), 'updatedAt': quiz.get('category').get('updatedAt').toJSON() },
      createdAt: quiz.get('createdAt').toJSON(),
      updatedAt: quiz.get('updatedAt').toJSON(),
    }

    const Question = new Parse.Query('Question');
    const QuizObj = new Parse.Object("Quiz");
    Question.include("quiz");
    QuizObj.id = quizId;

    Question.equalTo("quiz", QuizObj);

    const questionsResult = await Question.find();
    // console.log(questionsResult);
    const questions = questionsResult.map((e) => {
      return {
        _id: e.id,
        question: e.get('question'),
        options: e.get('options'),
        correctOptionIndex: 0, //quizResult.get('correctOptionIndex') ,
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
      }
    });

    if (questions) {
      return ({ code: 200, status: true, message: '', 'quiz': quizResult, "questions": questions });
    } else {
      return ({ code: 404, status: false, message: 'Quiz not found' });
    }
  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('submit-quiz-result', async (request) => {

  const quizId = request.params.quizId;
  try {
    if (!quizId)
      return ({ code: 400, status: false, message: 'Invalid quiz_id format' });

    const Quiz = new Parse.Query("Quiz");
    Quiz.include("category");
    Quiz.equalTo("objectId", quizId);
    const quiz = await Quiz.first();


    if (!quiz)
      return (({ code: 400, status: false, message: 'Invalid quiz_id format' }));

    quizResult = {
      _id: quiz.id,
      title: quiz.get('title'),
      'category': { 'title': quiz.get('category').get('title'), '_id': quiz.get('category').id, 'createdAt': quiz.get('category').get('createdAt').toJSON(), 'updatedAt': quiz.get('category').get('updatedAt').toJSON() },
      createdAt: quiz.get('createdAt').toJSON(),
      updatedAt: quiz.get('updatedAt').toJSON(),
    }

    const Question = new Parse.Query('Question');
    const QuizObj = new Parse.Object("Quiz");
    Question.include("quiz");
    QuizObj.id = quizId;

    Question.equalTo("quiz", QuizObj);

    const questionsResult = await Question.find();
    // console.log(questionsResult);
    const questions = questionsResult.map((e) => {
      return {
        _id: e.id,
        question: e.get('question'),
        options: e.get('options'),
        correctOptionIndex: 0, //quizResult.get('correctOptionIndex') ,
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
      }
    });

    if (questions) {
      return ({ code: 200, status: true, message: '', 'quiz': quizResult, "questions": questions });
    } else {
      return ({ code: 404, status: false, message: 'Quiz not found' });
    }
  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('schoolLeaderboard', async (request) => {

  const SchoolLeaderboard = new Parse.Query('SchoolLeaderboard');
  SchoolLeaderboard.include("school");
  SchoolLeaderboard.include("bestQuiz");

  try {
    const schoolLeaderboard = await SchoolLeaderboard.find();
    const results = schoolLeaderboard.map((e) => {
      return {

        "id": e.id,
        'school': {
          id: e.get('school').id,
          schoolName: e.get('school').get("name"),
          city: e.get('school').get('city'),
          profilePic: ''
        },
        'points': e.get("points"),
        'quizPlayed': e.get('quizPlayed'),
        'quizWon': e.get('quizWon'),
        'studentParticipated': e.get('studentParticipated'),

        'bestQuiz': {
          id: e.get('bestQuiz').id,
          quizName: e.get('bestQuiz').get("title"),
          quizCategory: e.get('bestQuiz').get("category").get('title'),
          quizLevel: e.get('bestQuiz').get("level")
        },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    return {
      "code": 200,
      "status": true,
      "message": "success",
      "schoolLeaderboard": results
    }


  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('schooldiscover', async (request) => {

  //most liked post by school

  const PostFeed = new Parse.Query("Posts");
  PostFeed.descending("likes");
  PostFeed.include('school')



  // const SchoolLeaderboard = new Parse.Query('SchoolLeaderboard');
  // SchoolLeaderboard.include("school");
  // SchoolLeaderboard.include("bestQuiz");
  // SchoolLeaderboard.include("bestQuiz.category")


  try {
    // const schoolLeaderboard = await SchoolLeaderboard.find();
    // const leaderboardResults = schoolLeaderboard.map((e) => {
    //   return {
    //     "code": 200,
    //     "status": "success",
    //     "message": "",
    //     "id": e.id,
    //     'school': {
    //       id: e.get('school').id,
    //       schoolName: e.get('school').get("name"),
    //       city: e.get('school').get('city'),
    //       profilePic: ''
    //     },
    //     'points': e.get("points"),
    //     'quizPlayed': e.get('quizPlayed'),
    //     'quizWon': e.get('quizWon'),
    //     'studentParticipated': e.get('studentParticipated'),

    //     'bestQuiz': {
    //       id: e.get('bestQuiz').id,
    //       quizName: e.get('bestQuiz').get("title"),
    //       quizCategory: e.get('bestQuiz').get("category").get('title'),
    //       quizLevel: e.get('bestQuiz').get("level")
    //     },
    //     'createdAt': e.get('createdAt').toJSON(),
    //     'updatedAt': e.get('updatedAt').toJSON()
    //   }
    // });
    //most liked post by school
    const mostLikedPostBySchool = await PostFeed.first();
    const mostLikedResult = {
      'id': mostLikedPostBySchool.id,
      caption: mostLikedPostBySchool.get('caption'),
      title: mostLikedPostBySchool.get('title'),
      imageUrl: mostLikedPostBySchool.get('imageUrl'),
      'school': {
        id: mostLikedPostBySchool.get('school').id,
        schoolName: mostLikedPostBySchool.get('school').get("name"),
        city: mostLikedPostBySchool.get('school').get('city'),
        profilePic: ''
      },
      'createdAt': mostLikedPostBySchool.get('createdAt').toJSON(),
      'updatedAt': mostLikedPostBySchool.get('updatedAt').toJSON()
    }

    //recent activity by school
    const RecentPostFeed = new Parse.Query("Posts");
    RecentPostFeed.descending("createdAt");
    RecentPostFeed.include('school')
    RecentPostFeed.limit(10);
    const recentActivity = await RecentPostFeed.find();
    const recentActivityResults = recentActivity.map((e) => {
      return {
        'id': e.id,
        caption: e.get('caption'),
        title: e.get('title'),
        imageUrl: e.get('imageUrl'),
        'school': {
          id: e.get('school').id,
          schoolName: e.get('school').get("name"),
          city: e.get('school').get('city'),
          profilePic: ''
        },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    return {
      "code": 200,
      "status": true,
      "message": "success",
      // "schoolLeaderboard": leaderboardResults,
      "mostLiked": mostLikedResult,
      "recentActivity": recentActivityResults
    };


  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('searchInput', async (request) => {

  //most liked post by school

  const searchValue = request.params.searchValue;

  const Search = new Parse.Query("Search");
  Search.startsWith("value", searchValue);

  try {
    const search = await Search.find();

    const searchResult = search.map((e) => {
      return {
        'id': e.id,
        value: e.get('value'),
        displayValue: e.get('displayValue'),
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON()
      }
    });
    return {
      "code": 200,
      "status": true,
      "message": "success",
      "searchResults": searchResult
    };


  }
  catch (err) {
    throw new Error(err);
  }
});

Parse.Cloud.define('signup', async (request) => {
  const { username, password, email, firstname, lastname } = request.params;
  if (!username || !password || !email) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username, password, and email are required.");
  }
  try {
    const user = new Parse.User();
    user.set("username", username);
    user.set("password", password);
    user.set("firstname", firstname);
    user.set("lastname", lastname);
    user.set("email", email);
    await user.signUp();
    console.log(user);


    const loginUser = new Parse.User();
    loginUser.set("username", username);
    loginUser.set("password", password);
    const loggedInUser = await loginUser.logIn();
    console.log(loggedInUser);
    const sessionToken = loggedInUser.getSessionToken();


    return {
      code: 200,
      status: true,
      message: "success",
      result: {
        token: sessionToken,
        firstname: loggedInUser.get("firstname") ?? "First",
        lastname: loggedInUser.get("lastname") ?? "Last",
        email: loggedInUser.get("email") ?? '',
        mobile: loggedInUser.get("mobile") ?? "",
        _id: loggedInUser.id,
        createdAt: loggedInUser.get("createdAt").toJSON(),
        updatedAt: loggedInUser.get("updatedAt").toJSON(),
      }
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OTHER_CAUSE, error.message);
    // return 
    // {
    //   code: 200,
    //   status: true,
    //   message: "failed",
    // }
  }
});

Parse.Cloud.define('login', async (request) => {


  const { username, password } = request.params;


  console.log('username', username);
  console.log('password', password);


  if (!username || !password) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username and password are required.");
  }
  try {
    const user = new Parse.User();
    user.set("username", username);
    user.set("password", password);
    const loggedInUser = await user.logIn();
    const sessionToken = loggedInUser.getSessionToken();
    return {
      code: 200,
      status: true,
      message: "success",
      result: {
        token: sessionToken,
        firstname: loggedInUser.get("firstname") ?? "First",
        lastname: loggedInUser.get("lastname") ?? "Last",
        email: loggedInUser.get("email") ?? '',
        mobile: loggedInUser.get("mobile") ?? "",
        _id: loggedInUser.id,
        about: loggedInUser.get('about') ?? "May be i need to be more interesting",
        profile_pic: loggedInUser.get("profilePic"),
        createdAt: loggedInUser.get("createdAt").toJSON(),
        updatedAt: loggedInUser.get("updatedAt").toJSON(),
      }
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Invalid username or password.");
  }
});

// Parse.Cloud.define('getSessionToken', async (request) => {
//   const { username, password } = request.params;
//   if (!username || !password) {
//     throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username and password are required.");
//   }
//   try {
//     const user = new Parse.User();
//     user.set("username", username);
//     user.set("password", password);
//     const loggedInUser = await user.logIn();
//     const sessionToken = loggedInUser.getSessionToken();
//     return { sessionToken: sessionToken };
//   } catch (error) {
//     throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Invalid username or password.");
//   }
// });

Parse.Cloud.define('getSchool', async (request) => {
  const { schoolId } = request.params;

  //implement logic in case shcool id is null
  if (!schoolId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "schoolId");
  }
  try {
    const School = new Parse.Query("Schools");
    School.equalTo("objectId", schoolId);
    const school = await School.first();

    return {
      code: 200,
      status: true,
      message: "success",
      school:
      {
        _id: school.id,
        name: school.get('name'),
        achivements: school.get('achievements').map((e)=>{
          return{
            "achivement_text":e['achivement_text'],
		        "achivement_image":e['achivement_image']
          }
        }),
        city: school.get('city'),
        district: school.get('district'),
        state: school.get('state'),
        footerImageUrl: school.get('some_other_events_image'),
        coursesOffered: school.get('courses_offered').map((e) => {
          return {
            courseName: e['course_name'],
            successPct: e['success_pct'],
            totalStudents: e['total_students_enrolled'],
          }
        }),
        type: school.get('type'),
        description: school.get('description'),
        headerImageUrl: school.get('final_image'),
        numOfStudents: school.get('number_of_students'),
        facultyRatio: school.get('faculty_ratio'),
        attributes: school.get('attributes'),
      }
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});
