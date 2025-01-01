const { result, random } = require('lodash');
var lodash = require('lodash/lodash.js');
const crypto = require('crypto');

Parse.Cloud.define("home", async (request) => {

  const Quiz = new Parse.Query('Quiz');
  Quiz.include('category')
  const QuizCategory = new Parse.Query('QuizCategory');
  const QuizResult = new Parse.Query('QuizResult');
  try {

    const currentDate = new Date();
    const oneWeekAgo = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000);

    const firstQuiz = await Quiz.first();

    //add a filter to pick top quiz
    const randomTopPickQuiz = {
      '_id': firstQuiz.id,
      'title': firstQuiz.get('title'),
      'description': firstQuiz.get('description'),
      'category': { 'title': firstQuiz.get('category').get('title'), '_id': firstQuiz.get('category').id, 'createdAt': firstQuiz.get('category').get('createdAt').toJSON(), 'updatedAt': firstQuiz.get('category').get('updatedAt').toJSON(), 'quizCount': 0 },
      'createdAt': firstQuiz.get('createdAt').toJSON(),
      'updatedAt': firstQuiz.get('updatedAt').toJSON(),
      'v': firstQuiz.get('v')
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
    } : null;
    // console.log(weekTopRankJSON)


    //most played quiz
    // const Quiz = new Parse.Query('Quiz');
    // Quiz.include("category")
    const allQuizzes = await Quiz.find();
    console.log(allQuizzes);
    const allQuizzes_1 = await allQuizzes.map((e) => {

      return {
        "id": e.id,
        'title': e.get('title'),
        'description': e.get('description'),
        'category': { 'title': e.get('category').get('title'), '_id': e.get('category').id, 'createdAt': e.get('category').get('createdAt').toJSON(), 'updatedAt': e.get('category').get('updatedAt').toJSON() },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON(),
        'standard': e.get('standard'),
        'level': e.get('level')
      }
    });
    const randomQuizzes = lodash.sampleSize(allQuizzes_1, 5); // Get 5 random quizzes
    // const randomMostPlayedQuiz = lodash.sample(allQuizzes_1); // Get a random most played quiz
    
    const MostPlayedQuizQuery = new Parse.Query('MostPlayedQuiz');
    MostPlayedQuizQuery.include('most_played_quiz');
    MostPlayedQuizQuery.include('most_played_quiz.category');
    MostPlayedQuizQuery.include('user');
    const e = await MostPlayedQuizQuery.first();
    var mostPlayedQuizResult ={};
    if(e){
    mostPlayedQuizResult = {
        "id": e.get('most_played_quiz').id,
        'title': e.get('most_played_quiz').get('title'),
        'description': e.get('most_played_quiz').get('description'),
        'category': {'title': e.get('most_played_quiz').get('category').get('title'),
                     '_id': e.get('most_played_quiz').get('category').id,
                     'createdAt': e.get('most_played_quiz').get('category').get('createdAt').toJSON(),
                     'updatedAt': e.get('most_played_quiz').get('category').get('updatedAt').toJSON() 
                    },
        'createdAt': e.get('most_played_quiz').get('createdAt').toJSON(),
        'updatedAt': e.get('most_played_quiz').get('updatedAt').toJSON(),
        'standard': e.get('most_played_quiz').get('standard'),
        'level': e.get('most_played_quiz').get('level')
    }
  }
  
    return {
      code: 200, status: true, message: '',
      quizzes: randomQuizzes,
      most_played_quiz: mostPlayedQuizResult,
      top_pic_quiz: randomTopPickQuiz,
      week_top_rank: weekTopRankJSON,
      quiz_categories: quizCategoriesWithCounts
    };
  }
  catch (err) {
    throw new Error(err);
  }
}
);


Parse.Cloud.define("feed", async (request) => {

  var { skip, userId } = request.params;
  if (!skip) {
    skip = 0;
  }

  const User = Parse.User.extend();
  const Feed = new Parse.Query('Feed');
  Feed.include("post")
  Feed.include("post.school")
  Feed.descending("updatedAt");
  Feed.skip(skip);
  Feed.limit(5);

  try {
    const allFeedPosts = await Feed.find();

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const results = await Promise.all(allFeedPosts.map(async (e) => {
      //get coments

      const PostObj = new Parse.Object("Posts");
      PostObj.id = e.get("post").id

      const likeQuery = new Parse.Query("Like");

      likeQuery.equalTo("post", PostObj);
      likeQuery.equalTo("user", user);
      likeQuery.include("user");
      const likes = await likeQuery.first();



      return {
        "id": e.get("post").id,
        'photoUrl': e.get('post').get('imageUrl'),
        'caption': e.get('post').get('caption'),
        'title':e.get('post').get('title'),
        'school': {
          id: e.get('post').get('school').id,
          schoolName: e.get('post').get('school').get("name"),
          city: e.get('post').get('school').get('city'),
          // profilePic: e.get('post').get('school')
          profilePic: ''
        },
        isLiked: likes ? true : false,
        // 'comments': commentsResult,
        'likes': e.get('post').get('likes'),
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

  city = request.params.city;
  state = request.params.state;
  district = request.params.district;

  try {
    const School = new Parse.Query("Schools");
    if (city) {
      School.equalTo("city", city);
    }
    if (state) {
      School.equalTo("state", state);
    }
    if (district) {
      School.equalTo("district", district);
    }
    School.limit(100);

    const school = await School.find();
    schoolsList = school.map((school) => {
      return {
        _id: school.id,
        name: school.get('name'),
        city: school.get('city'),
        district: school.get('district'),
        state: school.get('state'),
        type: school.get('type'),
        description: school.get('description'),
        headerImageUrl: school.get('final_image'),
        numOfStudents: school.get('number_of_students'),
        facultyRatio: school.get('faculty_ratio'),
        cardImage: school.get('card_image_small') ?? "https://placehold.co/240x180.jpg"
      }
    });
    const TopSchool = new Parse.Query("Schools");

    if (city) {
      TopSchool.equalTo("city", city);
    }
    if (state) {
      TopSchool.equalTo("state", state);
    }
    if (district) {
      TopSchool.equalTo("district", district);
    }

    TopSchool.descending("createdAt");
    const topSchool = await TopSchool.first();
    topSchoolResult = {
      _id: topSchool.id,
      name: topSchool.get('name'),
      city: topSchool.get('city'),
      district: topSchool.get('district'),
      state: topSchool.get('state'),
      type: topSchool.get('type'),
      description: topSchool.get('description'),
      headerImageUrl: topSchool.get('final_image'),
      numOfStudents: topSchool.get('number_of_students'),
      facultyRatio: topSchool.get('faculty_ratio'),
      
    }

    return ({
      code: 200,
      status: true,
      message: "success",
      schools: schoolsList,
      topSchool: topSchoolResult

    });
    // console.log(weekTopRankJSON)
  }
  catch (err) {
    throw new Error(err);
  }
});


Parse.Cloud.define("profile", async (request) => {

  let userId = request.params._id;
  // let userId  = request.user.id;
    console.log(request.user);

  try {
    const User = new Parse.Query(Parse.User);
    User.include('standard');
    User.include('school');
    User.include('demographics');

    const parseUserDetail = await User.get(userId,{useMasterKey : true});

    const userDetail = {
      '_id': userId,
      'firstname': parseUserDetail.get('firstname'),
      'lastname': parseUserDetail.get('lastname'),
      'email': parseUserDetail.get('email') ?? 'dummy_email@gmail.com',
      'mobile': parseUserDetail.get('mobile') ?? '00-000-00000',
      'about': parseUserDetail.get('about') ?? "Please update your description",
      'role': parseUserDetail.get('role'),
      'isMobileNumberVerified': parseUserDetail.get('isMobileNumberVerified'),
      'isEmailVerified': parseUserDetail.get('isEmailVerified'),
      'isBlocked': parseUserDetail.get('isBlocked'),
      'createdAt': parseUserDetail.get('createdAt').toJSON(),
      'updatedAt': parseUserDetail.get('updatedAt').toJSON(),
      // 'v':parseUserDetail.get('v'),
      'profilePic': parseUserDetail.get('profilePic') ?? "https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/profile_pic.jpg",
      'points': parseUserDetail.get('points') ?? 0,
      'standard': parseUserDetail.get('standard').get('standard_name') ?? 'Standard not set',
      'school':{
        id: parseUserDetail.get('school').id,
        schoolName: parseUserDetail.get('school').get("name"),
      },
      description: parseUserDetail.get('about') ?? "Description not set",
      city: parseUserDetail.get('demographics').get('city') ?? "City/State not set",
      state: parseUserDetail.get('demographics').get('state') ?? "",
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

      const quizWonRelation = stats.relation('quizWonList');
      const quizWonQuery = quizWonRelation.query();
      const quizWon = await quizWonQuery.find();

      
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
        'updatedAt': stats.get('updatedAt').toJSON(),
        'quizWonList': quizWon.map((quiz) =>{
          return {
            id : quiz.id,
            quizName : quiz.get('title'),
            quizDescription : quiz.get('description'),
            quizPrizeDetails : quiz.get('level'),
            level : quiz.get('level'),
            standard : quiz.get('standard'),
          }
        })
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
           profilePic: e.get('school').get('logo') ?? 'https://academy-v1.s3.ap-northeast-1.amazonaws.com/generic/generix_logo_school.jpg'
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
    const PostFeed = new Parse.Query("Posts");
    PostFeed.descending("likes");
    PostFeed.include('school')

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
    // loginUser.set("password", password);
    loginUser.set("password",password);
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
  console.log('password', Buffer.from(password, 'base64').toString('utf-8'));


  if (!username || !password) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "Username and password are required.");
  }
  try {
    const user = new Parse.User();
    user.set("username", username);
    user.set("password", Buffer.from(password, 'base64').toString('utf-8'));
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
    // School.equalTo("objectId", schoolId);
    const school = await School.get(schoolId);

    return {
      code: 200,
      status: true,
      message: "success",
      school:
      {
        _id: school.id,
        name: school.get('name'),
        achivements: school.get('achievements').map((e) => {
          return {
            "achivement_text": e['achivement_text'],
            "achivement_image": e['achivement_image']
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
        photo1: school.get('photo1'),
        photo2: school.get('photo2'),
        photo3: school.get('photo3'),
        pullQuote1Top: school.get('text_artifacts')['pullQuote1Top'],
        pullQuote1Bottom: school.get('text_artifacts')['pullQuote1Bottom'],
        pullQuote2 :  school.get('text_artifacts')['pullQuote2'],
        historyInfo2 : school.get('text_artifacts')['historyInfo2'],
        constructionInfo1 : school.get('text_artifacts')['constructionInfo1'],
        callout2 : school.get('text_artifacts')['callout2'],
        constructionInfo2 : school.get('text_artifacts')['constructionInfo2'],
        locationInfo1 : school.get('text_artifacts')['locationInfo1'],
         locationInfo2 : school.get('text_artifacts')['locationInfo2'],
        startYear : school.get('text_artifacts')['startYear'],
        endYear : school.get('text_artifacts')['endYear'],
        videoCaption : school.get('text_artifacts')['videoCaption'],
        videoId : school.get('text_artifacts')['videoId'],
      }
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('quizByCatId', async (request) => {
  const { quizCatId } = request.params;

  //implement logic in case shcool id is null
  if (!quizCatId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "quizCatId");
  }
  try {



    const Quizzes = new Parse.Query("Quiz");

    const QuizCategory = new Parse.Object("QuizCategory");
    QuizCategory.id = quizCatId;
    Quizzes.equalTo("category", QuizCategory);

    Quizzes.include('category');
    Quizzes.descending('createdAt');
    Quizzes.limit(2000);

    const quizzes = await Quizzes.find();

    const quizList = quizzes.map((e) => {
      return {
        id: e.id,
        title: e.get('title'),
        description: e.get('description'),
        category:
        {
          id: e.get('category').id,
          title: e.get('category').get('title'),
          createdAt: e.get('category').get('createdAt').toJSON(),
          updatedAt: e.get('category').get('updatedAt').toJSON(),
        },
        standard: e.get('standard'),
        level: e.get('level'),
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
      }
    })

    return {
      code: 200,
      status: true,
      message: "success",
      quizzes: quizList
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});


Parse.Cloud.define('allQuiz', async (request) => {

  try {

    const Quizzes = new Parse.Query("Quiz");
    Quizzes.include('category');
    Quizzes.descending('createdAt');
    Quizzes.limit(2000);

    const quizzes = await Quizzes.find();

    const quizList = quizzes.map((e) => {
      return {
        id: e.id,
        title: e.get('title'),
        description: e.get('description'),
        category:
        {
          id: e.get('category').id,
          title: e.get('category').get('title'),
          createdAt: e.get('category').get('createdAt').toJSON(),
          updatedAt: e.get('category').get('updatedAt').toJSON(),
        },
        standard: e.get('standard'),
        level: e.get('level'),
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
      }
    })

    return {
      code: 200,
      status: true,
      message: "success",
      quizzes: quizList
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('getQuizQuestion', async (request) => {
  const { quizId } = request.params;

  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  try {
    const Quizzes = new Parse.Query("Quiz");
    Quizzes.include('category');
    Quizzes.equalTo('objectId', quizId);

    const quiz = await Quizzes.first();

    const Question = new Parse.Query("Question");
    const Quiz = new Parse.Object("Quiz");
    Quiz.id = quizId;
    Question.equalTo("quiz", Quiz);
    // Question.lessThanOrEqualTo('usedTimes', 3)
    Question.limit(1000);

    const question = await Question.find();

    const randomQuestion = lodash.sampleSize(question,
      quiz.get('total_question')
      // 10
    );
    const questionsResult = randomQuestion.map((e) => {
      return {

        _id: e.id,
         // Buffer.from(inputString).toString('base64');
        question : Buffer.from(e.get('question')).toString('base64'),
        options: e.get('options'),
        correctOptionIndex: -1,
        createdAt: e.get('createdAt').toJSON(),
        updatedAt: e.get('updatedAt').toJSON(),
      }
    });



    return {
      code: 200,
      status: true,
      message: "success",
      quiz: {
        _id: quiz.id,
        title: quiz.get('title'),
        description: quiz.get('description'),
        category: {
          _id: quiz.get('category').id,
          title: quiz.get('category').get('title'),
          createdAt: quiz.get('category').get('createdAt').toJSON(),
          updatedAt: quiz.get('category').get('updatedAt').toJSON(),
        },
        createdAt: quiz.get('createdAt').toJSON(),
        updatedAt: quiz.get('updatedAt').toJSON(),
        totalQuestions: quiz.get('total_question')
      },
      questions: questionsResult
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('submit-quiz-result', async (request) => {
  const { quizId, userId, ansMap } = request.params;


  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  if (!userId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no userId id found");
  }
  if (!ansMap) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no ansMap found");
  }

  try {
    //check if entry exists or not for a user
    const AnsweredQuery = new Parse.Query("Answered");

    const User = new Parse.Query(Parse.User);
    const user = await User.get(userId);

    const QuizObject = new Parse.Object("Quiz");
    QuizObject.id = quizId;

    AnsweredQuery.equalTo('quiz', QuizObject);
    AnsweredQuery.equalTo('user', user);
    const hasAnswered = await AnsweredQuery.first();
    console.log(hasAnswered);
    if (hasAnswered) {
      return {
        code: 200,
        status: true,
        message: "quiz already answered",
        data: ""
      }
    }
    else {
      const Answers = new Parse.Object("Answered");
      Answers.set("quiz", QuizObject);
      Answers.set("user", user);
      Answers.set("ans_map", ansMap);
      const result = await Answers.save();
      return {
        code: 200,
        status: true,
        message: "Saved Successfully",
        newQuizResult: {
          user: user.get('firstname') + " " + user.get('lastname'),
          points: user.get('points'),
          quizPlayed: 2,
          _id: result.id,
          createdAt: result.get('createdAt').toJSON(),
          updatedAt: result.get('updatedAt').toJSON()
        }
      };
    }
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});


Parse.Cloud.define('getQuizDetail', async (request) => {
  const { quizId, userId } = request.params;


  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  if (!userId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no userId id found");
  }

  try {
    //check if entry exists or not for a user
    const AnsweredQuery = new Parse.Query("Answered");

    const User = new Parse.Query(Parse.User);
    const user = await User.get(userId);

    const QuizObject = new Parse.Object("Quiz");
    QuizObject.id = quizId;

    AnsweredQuery.equalTo('quiz', QuizObject);
    AnsweredQuery.equalTo('user', user);
    const hasAnswered = await AnsweredQuery.first();

    const QuizQuery = new Parse.Query("Quiz");
    QuizQuery.include('category');
    QuizQuery.include('quiz_type')
    QuizQuery.include('prize')
    const quiz = await QuizQuery.get(quizId);

    if (quiz) {
      return {
        code: 200,
        status: true,
        message: hasAnswered ? "quiz already answered" : "",
        quizDetail: {
          id: quiz.id,
          quizName: quiz.get('title'),
          quizDescription: quiz.get('description'),
          numQuestions: quiz.get('total_question'),
          points: quiz.get('points') ?? 0,
          // isPlayed : hasAnswered ? true: false,
          isPlayed: hasAnswered != 'undefined' && hasAnswered ? true : false,
          standard: quiz.get("standard"),
          quizType: quiz.get('quiz_type').get("type_name_long"),
          categoryName: quiz.get('category').get('title'),
          timeLimit: quiz.get('time_limit'),
          level: quiz.get('level'),
          quizPrizeDetails: quiz.get('prize').get('prizes') ?? [],
        }
      }
    }
    else {
      return {
        code: 404,
        status: true,
        message: "quiz nto found",
        data: "please check quiz id"
      }
    }

  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('eventByDates', async (request) => {
  const { schoolId, eventDate } = request.params;
  const date = new Date(eventDate);
  try {
    const School = new Parse.Object('Schools');
    School.id = schoolId;

    startDate = new Date(date.getFullYear(), date.getMonth(), 1);
    endDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    const Events = new Parse.Query('EventsGallery');
    Events.greaterThanOrEqualTo('event_date', startDate);
    Events.lessThanOrEqualTo('event_date', endDate);
    Events.equalTo('school', School);
    const events = await Events.find();
    // console.log(events)


    return {
      code: 200,
      status: true,
      message: "",
      events: events.map((e) => {
        return {
          id: e.id,
          event_date: e.get('event_date').toJSON(),
          headerImageUrl: e.get('headerImageUrl'),
          createdAt: e.get('createdAt').toJSON(),
          updatedAt: e.get('updatedAt').toJSON()
        }
      })

    }

  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('eventById', async (request) => {
  const { eventId } = request.params;
  try {
    const Event = new Parse.Object("EventsGallery");
    Event.id = eventId;
    const EventsDetails = new Parse.Query('EventGalleryDetails');
    EventsDetails.equalTo('event', Event);
    EventsDetails.include('event')
    const allImages = await EventsDetails.find();
    console.log(allImages);


    return {
      code: 200,
      status: true,
      message: "",
      events_details: allImages.map((e) => {
        return {
          id: e.id,
          event_name: e.get("event").get('event_name') ?? "Generic Event name",
          image_url: e.get('image_url'),
          likes: e.get('likes'),
          createdAt: e.get('createdAt').toJSON(),
          updatedAt: e.get('updatedAt').toJSON()
        }
      })

    };

  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});


Parse.Cloud.define('postById', async (request) => {
  const { postId, userId } = request.params;
  try {
    const Post = new Parse.Query("Posts");
    Post.equalTo('objectId', postId)
    Post.include('school');
    Post.include('comments');
    const post = await Post.first();

    const User = Parse.User.extend();
    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });


    const likeQuery = new Parse.Query("Like");
    likeQuery.equalTo("post", post);
    likeQuery.equalTo("user", user);
    const likes = await likeQuery.first();

    // console.log(post);
    return {
      code: 200,
      status: true,
      message: "Succesful",
      "post": {
        id: post.id,
        title: post.get('title'),
        image_url: post.get('imageUrl'),
        caption: post.get('caption'),
        likes: post.get('likes'),
        school: {
          school_name: post.get('school').get('name'),
          logo: post.get('school').get('logo')
        },
        isLiked: likes ? true : false,
        createdAt: post.get('createdAt').toJSON(),
        updatedAt: post.get('updatedAt').toJSON()
      }
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define('commentByPostId', async (request) => {
  const { postId, skip, limit } = request.params;
  try {
    const Comment = Parse.Object.extend("Comments");

    const Post = new Parse.Query("Posts");
    Post.equalTo('objectId', postId)
    const post = await Post.first();


    const commentQuery = new Parse.Query(Comment);
    commentQuery.equalTo("post", post);
    commentQuery.include('user')
    commentQuery.addDescending('createdAt');
    commentQuery.skip(parseInt(skip));
    commentQuery.limit(parseInt(limit));
    const comments = await commentQuery.find();

    return {
      code: 200,
      status: true,
      message: "Succesful",
      "comments": comments.map((comment) => {
        return {
          id: comment.id,
          content: comment.get("content"),
          user: comment.get('user').get('username'),
          profilePic: comment.get('user').get('profilePic'),
          createdAt: comment.get('createdAt').toJSON(),
          updatedAt: comment.get('updatedAt').toJSON()
        }
      }),
    }
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
  }
});

Parse.Cloud.define("addCommentToPost", async (request) => {
  const { postId, content, userId } = request.params;

  if (!postId || !content || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Comment = Parse.Object.extend("Comments");
  const User = Parse.User.extend();

  try {
    // Fetch the post
    const postQuery = new Parse.Query(Post);
    const post = await postQuery.get(postId, { useMasterKey: true });

    // Fetch the user
    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    // Create a new comment
    const comment = new Comment();
    comment.set("content", content);
    comment.set("post", post);
    comment.set("user", user);

    // Save the comment
    await comment.save(null, { useMasterKey: true });

    const relation = post.relation("comments");
    relation.add(comment);

    // Optionally, increment comment count in Post (requires adding commentCount field to Post)
    if (post.has("commentCount")) {
      post.increment("commentCount");
    }
    await post.save(null, { useMasterKey: true });
    return {
      code: 200,
      status: true,
      message: "Comment added successfully!"
    };
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add comment to post");
  }
});

Parse.Cloud.define("likePostById", async (request) => {
  const { postId, userId } = request.params;

  if (!postId || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Like = Parse.Object.extend("Like");
  const User = Parse.User.extend();

  try {
    //check if user already do not have a like for the post
    const postQuery = new Parse.Query(Post);
    postQuery.include('school');
    const post = await postQuery.get(postId, { useMasterKey: true });

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const likeQuery = new Parse.Query(Like);
    likeQuery.equalTo('user', user);
    likeQuery.equalTo('post', post);

    const isLiked = await likeQuery.first();
    console.log(isLiked);
    if (isLiked) {
      // return {
      //   code: 300,
      //   status: true,
      //   message: "Already Liked",
      //   "user": user,
      //   "post": post
      // };
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: true,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
    else {

      // Create a new comment
      const like = new Like();
      like.set("user", user);
      like.set("post", post);

      // Save the comment
      await like.save(null, { useMasterKey: true });



      // Optionally, increment comment count in Post (requires adding commentCount field to Post)
      if (post.has("likes")) {
        post.increment("likes");
      }
      await post.save(null, { useMasterKey: true });
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: true,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add like to post");
  }
});


Parse.Cloud.define("dislikePostById", async (request) => {
  const { postId, userId } = request.params;

  if (!postId || !userId) {
    throw new Parse.Error(Parse.Error.INVALID_PARAMS, "Missing parameters");
  }

  const Post = Parse.Object.extend("Posts");
  const Like = Parse.Object.extend("Like");
  const User = Parse.User.extend();

  try {
    //check if user already do not have a like for the post
    const postQuery = new Parse.Query(Post);
    postQuery.include('school');
    const post = await postQuery.get(postId, { useMasterKey: true });

    const userQuery = new Parse.Query(User);
    const user = await userQuery.get(userId, { useMasterKey: true });

    const likeQuery = new Parse.Query(Like);
    likeQuery.equalTo('user', user);
    likeQuery.equalTo('post', post);

    const isLiked = await likeQuery.first();


    
    if (isLiked) {
      await isLiked.destroy({ useMasterKey: true });
      if (post.has("likes")) {
        post.decrement("likes");
      }
      await post.save(null, { useMasterKey: true });
      return {
        code: 200,
        status: true,
        message: "Succesful",
        "post": {
          id: post.id,
          title: post.get('title'),
          image_url: post.get('imageUrl'),
          caption: post.get('caption'),
          likes: post.get('likes'),
          school: {
            school_name: post.get('school').get('name'),
            logo: post.get('school').get('logo')
          },
          isLiked: false,
          createdAt: post.get('createdAt').toJSON(),
          updatedAt: post.get('updatedAt').toJSON()
        }
      };
    }
    else {
      return {
        code: 400,
        status: false,
        message: "Some error occurred, Like not found"
      }

    }

  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, "Failed to add like to post");
  }
});

Parse.Cloud.define("learnings", async (request) => {
  
const Books = new Parse.Object("Books");
const Internship = new Parse.Object("InternshipWorkshop");
const LearningPaths = new Parse.Object("LearningPaths");
const MentorVideos = new Parse.Object("MentorVideos");
const News = new Parse.Object("News");
const StudyPlan = new Parse.Object("StudyPlan");


try
{
  const booksQuery = new Parse.Query(Books);
  booksQuery.limit(5);

  const interQuery = new Parse.Query(Internship);
  interQuery.limit(5);

  const learningQuery = new Parse.Query(LearningPaths);
  learningQuery.limit(5);

  const mentorQuery = new Parse.Query(MentorVideos);
  mentorQuery.limit(5);

  const newsQuery = new Parse.Query(News);
  newsQuery.limit(5);

  const studyPlanQuery = new Parse.Query(StudyPlan);
  studyPlanQuery.limit(5);
  studyPlanQuery.includeAll();

  const books = await booksQuery.find();
  const internships = await interQuery.find();
  const learnings = await learningQuery.find();
  const mentorVideos = await mentorQuery.find();
  const news  = await newsQuery.find();
  const studyPlans = await studyPlanQuery.find();
  

  return {
    status: true,
    code : 200,
    message: "",
    data :{
    books:books.map((book)=>{
      return {
        id: book.id,
        book_name: book.get('book_name'),
        book_publisher: book.get('book_publisher'),
        book_type: book.get('book_type'),
        book_category: book.get('book_category'),
        pdf_link: book.get('book_pdf_link'),
      }
    }),
    internships: internships.map((intern)=>{
      id: intern.id
    }),
    learnings: learnings.map((learn)=>{
      return {
      id: learn.id,
      "path_name" : learn.get('path_name'),
      description: learn.get("description")
      }
    }),
    mentorVideos: mentorVideos.map((mentor)=>{
      return {
        id: mentor.id,
        video_link: mentor.get("video_link"),
        title: mentor.get('title'),
        duration: mentor.get('duration'),
        thumbnail: mentor.get('thumbnail'),
        video_type: mentor.get('video_type')
      }
    }),
    news: news.map((e)=>{
      return {
        id: e.id
      }
    }),
    studyPlan: studyPlans.map((plan)=>{
      return {
        id:plan.id,
        plan_name: plan.get('plan_name'),
        plan_description: plan.get('plan_description'),
        pdf_link: plan.get('pdf_link'),
        plan_attributes: plan.get('plan_attributes'),
        standard: plan.get('standard').get('standard_name'),
        standard_name: plan.get('standard').get('standard_code')
      }
    })
    }
  }

}
catch (err) 
{
 throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
}
  
});

Parse.Cloud.define("learningpaths", async (request) => {
  const LearningPaths = new Parse.Object("LearningPaths");
  try {
    const learningQuery = new Parse.Query(LearningPaths);
    const learningPaths = await learningQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      paths: learningPaths.map((path) => {
        return {
          id: path.id,
          pathName: path.get('path_name'),
          description: path.get('description')

        }
      })

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("learningPathById", async (request) => {

  const { learningPathById } = request.params;

  const LearningPaths = new Parse.Object("LearningPaths");
  try {
    const learningQuery = new Parse.Query(LearningPaths);
    const learningPath = await learningQuery.get(learningPathById);
    return {
      status: true,
      code: 200,
      message: "",
      paths: {
        id: learningPath.id,
        pathName: learningPath.get('path_name'),
        description: learningPath.get('description')
      }

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("studyplans", async (request) => {
  const StudyPlans = new Parse.Object("StudyPlan");
  try {
    const studyPlanQuery = new Parse.Query(StudyPlans);
    studyPlanQuery.include('standard');
    const studyPlans = await studyPlanQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      plans: studyPlans.map((plan) => {
        return {
          id: plan.id,
          planName: plan.get('plan_name'),
          planDescription: plan.get('plan_description'),
          createdAt: plan.get('createdAt').toJSON(),
          updatedAt: plan.get('updatedAt').toJSON(),
          pdfLink: plan.get('pdf_link'),
          planAttributes: plan.get('plan_attributes'),
          standard: 
            {
              id : plan.get('standard').id,
             standardName: plan.get('standard').get('standard_name'),
             standardcode: plan.get('standard').get('standard_code'),
              }
        }
      })

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("studyPlanById", async (request) => {
  const { studyPlanId } = request.params;
  const StudyPlans = new Parse.Object("StudyPlan");

  try {
    const studyPlanQuery = new Parse.Query(StudyPlans);
    studyPlanQuery.include('standard');
    const plan = await studyPlanQuery.get(studyPlanId);
    return {
      status: true,
      code: 200,
      message: "",
      plan: {
        id: plan.id,
        planName: plan.get('plan_name'),
          planDescription: plan.get('plan_description'),
        createdAt: plan.get('createdAt').toJSON(),
        updatedAt: plan.get('updatedAt').toJSON(),
        pdfLink: plan.get('pdf_link'),
        planAttributes: plan.get('plan_attributes'),
        standard: 
            {
              id : plan.get('standard').id,
             standardName: plan.get('standard').get('standard_name'),
             standardcode: plan.get('standard').get('standard_code'),
              }

      }
    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("allVideos", async (request) => {
  const MentorVideos = new Parse.Object("MentorVideos");
  try {
    const videosQuery = new Parse.Query(MentorVideos);
    const videos = await videosQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      videos: videos.map((video) => {
        return {
          id: video.id,
          thumbnail: video.get('thumbnail'),
          duration: video.get('duration'),
          videoLink: video.get('video_link'),
          createdAt: video.get('createdAt').toJSON(),
          updatedAt: video.get('updatedAt').toJSON(),
          title: video.get('title'),
          videoType: video.get('video_type'),
        }
      })

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("videoById", async (request) => {
  const { videoId } = request.params;
  const MentorVideos = new Parse.Object("MentorVideos");
  try {
    const videosQuery = new Parse.Query(MentorVideos);
    const video = await videosQuery.get(videoId);
    return {
      status: true,
      code: 200,
      message: "",
      video: {
          id: video.id,
          thumbnail: video.get('thumbnail'),
          duration: video.get('duration'),
          videoLink: video.get('video_link'),
          createdAt: video.get('createdAt').toJSON(),
          updatedAt: video.get('updatedAt').toJSON(),
          title: video.get('title'),
          videoType: video.get('video_type'),
        }

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("allBooks", async (request) => {
  const Books = new Parse.Object("Books");
  try {
    const booksQuery = new Parse.Query(Books);
    const books = await booksQuery.find();
    return {
      status: true,
      code: 200,
      message: "",
      books: books.map((book) => {
        return {
          id: book.id,
         updatedAt: book.get('updatedAt').toJSON(),
        createdAt: book.get('createdAt').toJSON(),
        bookName: book.get('book_name'),
        bookAuthor: book.get('book_author'),
        bookPublisher: book.get('book_publisher'),
        bookDate: book.get('book_date'),
        bookPdfLink: book.get('book_pdf_link'),
        searchKeywords: book.get('searchKeywords'),
        bookType: book.get('book_type'),
        bookCategory: book.get('book_category'),
        }
      })

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

Parse.Cloud.define("bookById", async (request) => {
  const { bookId } = request.params;
  const Books = new Parse.Object("Books");
  try {
    const booksQuery = new Parse.Query(Books);
    const book = await booksQuery.get(bookId);
    return {
      status: true,
      code: 200,
      message: "",
      book: {
        id: book.id,
        updatedAt: book.get('updatedAt').toJSON(),
        createdAt: book.get('createdAt').toJSON(),
        bookName: book.get('book_name'),
        bookAuthor: book.get('book_author'),
        bookPublisher: book.get('book_publisher'),
        bookDate: book.get('book_date'),
        bookPdfLink: book.get('book_pdf_link'),
        searchKeywords: book.get('searchKeywords'),
        bookType: book.get('book_type'),
        bookCategory: book.get('book_category'),
      }

    }

  } catch (err) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, err.toString());
  }
});

// Future<void> changePassword(String oldPassword, String newPassword) async
Parse.Cloud.define("changePassword", async (request) => {
  const user = request.user;
  const { oldPassword, newPassword, confirmPassword } = request.params;

  if (!user) {
    throw new Parse.Error(Parse.Error.SESSION_MISSING, "User must be logged in.");
  }

  // Validate old password by performing logging in operation
  try {
    console.log('username:-', request.user);
    console.log('username:-', request.user.getUsername());
    const user1 = new Parse.User();
    user1.set("username", user.getUsername());
    user1.set("password", oldPassword);
    const loggedInUser = await user1.logIn();
    if (!loggedInUser) {
      return res.json({ code: 404, status: false, message: 'Incorrect password!' });
    }

    // await user.logIn(user.getUsername(), oldPassword);
    console.log("oldPassword:-", oldPassword);
    console.log("confirmPassword:-", confirmPassword);
    console.log("newPassword:-", newPassword);
    // Set new password
    loggedInUser.setPassword(newPassword);
    const updatedUser  = await loggedInUser.save(null, { useMasterKey: true });
    if(updatedUser){
    return {
      code: 200,
      status: true,
      message: "Password changed successfully."
    }
  }
  else{
    return { code: 404, status: false, message: 'Failed to update password' }
  }
  } catch (error) {
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
  }
});

Parse.Cloud.define("getAllAvatars", async (request) => {

  // Validate old password by performing logging in operation
  const Avatars = new Parse.Object("Avatars");
  try {
      const avatarQuery = new Parse.Query(Avatars);
      const avatars  = await avatarQuery.find();
    if(avatars){
      return{
        code: 200, status: true, message: '', avatars : avatars.map((avatar) =>{
          return {  _id: avatar.id,
            'url' : avatar.get('url'),
            updatedAt: avatar.get('updatedAt').toJSON(),
            createdAt: avatar.get('createdAt').toJSON(),
                 }
        })
      }
    }
    return { code: 404, status: false, message: 'No avatar found' }
  } catch (error) {
    
    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
  }
});

Parse.Cloud.define("updateProfile", async (request) => {
  const { about, profile_pic } = request.params;

  const user = request.user;
  // Validate old password by performing logging in operation
  var savedUser = null;
  try {
    if (!user)
      return { code: 400, status: false, message: "No user available" }
    if (about  && about.trim().length > 0) {
      user.set('about', about.trim());
      savedUser = await user.save(null, { useMasterKey: true });
    }
    else {
      return { code: 200, status: true, message: "No change" };
    }
    
    if (savedUser) {
      return { code: 200, status: true, message: "Data saved succesfully" };
    }
    else {
      return { code: 400, status: false, message: "Some error occured" };
    }

  } catch (error) {

    throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error.toString());
  }
});

Parse.Cloud.define("requestPasswordReset", async (request) => {
  const email = request.params.email;

  if (!email) {
    throw new Parse.Error(Parse.Error.INVALID_EMAIL_ADDRESS, "No email address provided.");
  }
  const User = new Parse.User

  try {
    const User = new Parse.User();
    const userQuery = new Parse.Query(User);
    userQuery.equalTo('email', email);
    const user = await userQuery.first({ useMasterKey: true });
    if (user) {
      var result = await Parse.User.requestPasswordReset(email);
      if (result) {
        return{ code: 200, status: true, message: "Password reset request was sent successfully. Please check your email!" };
      }

    }
    else {
      return{ code: 400, status: false, message: "Email does not exists" };
    }

  } catch (error) {
    // throw new Parse.Error(error.code, error.message);
    return{ code: 400, status: false, message: error };
  }
});

Parse.Cloud.define('publicProfile', async (request) => {
  const publicUserId = request.params.userId;
  
  
  try{
    const User = new Parse.Query(Parse.User);
    User.include('school');

    const parseUserDetail = await User.get(userId,{useMasterKey : true});

    const userDetail = {
      '_id': userId,
      'firstname': parseUserDetail.get('firstname'),
      'lastname': parseUserDetail.get('lastname'),
      'email': parseUserDetail.get('email') ?? 'dummy_email@gmail.com',
      'mobile': parseUserDetail.get('mobile') ?? '00-000-00000',
      'about': parseUserDetail.get('about') ?? "Please update your description",
      'role': parseUserDetail.get('role'),
      'isMobileNumberVerified': parseUserDetail.get('isMobileNumberVerified'),
      'isEmailVerified': parseUserDetail.get('isEmailVerified'),
      'isBlocked': parseUserDetail.get('isBlocked'),
      'createdAt': parseUserDetail.get('createdAt').toJSON(),
      'updatedAt': parseUserDetail.get('updatedAt').toJSON(),
      // 'v':parseUserDetail.get('v'),
      'profilePic': parseUserDetail.get('profilePic') ?? "https://academy-v1.s3.ap-northeast-1.amazonaws.com/avatars/profile_pic.jpg",
      'points': parseUserDetail.get('points') ?? 0,
      'standard': parseUserDetail.get('standard'),
      'headerImage': parseUserDetail.get('header_image')
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

      const quizWonRelation = stats.relation('quizWonList');
      const quizWonQuery = quizWonRelation.query();
      const quizWon = await quizWonQuery.find();

      
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
        'updatedAt': stats.get('updatedAt').toJSON(),
        'quizWonList': quizWon.map((quiz) =>{
          return {
            id : quiz.id,
            quizName : quiz.get('title'),
            quizDescription : quiz.get('description'),
            quizPrizeDetails : quiz.get('level'),
            level : quiz.get('level'),
            standard : quiz.get('standard'),
          }
        })
      };
    }

    const StudentAttributes = new Parse.Query("StudentAttributes");
    StudentAttributes.equalTo('user', CurrentUser);
    const studentAttributes = await StudentAttributes.first();
    const studentAttributesResult = {
      'id': studentAttributes.id,
      'performance': studentAttributes.get('performance'),
      'keyInterest': studentAttributes.get('key_interest'),
      'keySkills': studentAttributes.get('key_skills'),
      'scores': studentAttributes.get('scores'),
      'createdAt': studentAttributes.get('createdAt').toJSON(),
      'updatedAt': studentAttributes.get('updatedAt').toJSON(),
    }

    return {
      code: 200, status: true, message: 'Profile details fetched successfully',
      user_detail: userDetail,
      // badge: {},
      stats: statsResult,
      otherAttributes: studentAttributesResult
    };
  }catch(error){
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return { code: 400, status: false, message: error, stats: null, otherAttributes: null };
  }
  
});

