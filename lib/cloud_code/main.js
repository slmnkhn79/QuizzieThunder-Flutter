var lodash = require('lodash/lodash.js');

// Parse.Cloud.define("getDistinctValues", async (request) => {
//   const fieldName = request.params.fieldName;
//   const className = request.params.className;
//   const skip = request.params.fieldName;
//   const limit = request.params.className;

//   if (!fieldName || !className) {
//     throw new Error("Missing required parameter(s): fieldName, className");
//   }

//   const query = new Parse.Query(className);
//   query.select(fieldName);
//   query.limit(10000); // Adjust limit based on your requirements

//   try {
//     const results = await query.find();
//     const values = results.map(result => result.get(fieldName));
//     const distinctValues = [...new Set(values)]; // Get distinct values

//     return distinctValues;
//   } catch (error) {
//     throw new Error(`Error fetching distinct values: ${error.message}`);
//   }
// });

// Parse.Cloud.define("getDistinctCount", async (request) => {
//   const fieldName = request.params.fieldName;
//   const className = request.params.className;
//   const skip = request.params.fieldName;
//   const limit = request.params.className;

//   if (!fieldName || !className) {
//     throw new Error("Missing required parameter(s): fieldName, className");
//   }

//   const query = new Parse.Query(className);
//   query.select(fieldName);
//   query.limit(10000); // Adjust limit based on your requirements

//   try {
//     const results = await query.find();
//     const values = results.map(result => result.get(fieldName));
//     const distinctValues = ['', ...new Set(values)]; // Get distinct values

//     return distinctValues;
//   } catch (error) {
//     throw new Error(`Error fetching distinct values: ${error.message}`);
//   }
// });

// Parse.Cloud.define("getSchoolsDetails", async (request) => {
//   const state = request.params.state;
//   const city = request.params.city;
//   const district = request.params.district;

//   if (!state) {
//     throw new Error("Missing required parameter(s): fieldName, staet");
//   }
//   if (!city) {
//     throw new Error("Missing required parameter(s): fieldName, city");
//   }


//   const query = new Parse.Query('Schools');
//   query.equalTo("state", state);
//   query.equalTo("city", city);
//   if (district) {
//     query.equalTo("district", district);
//   }

//   query.limit(10000); // Adjust limit based on your requirements

//   try {
//     const results = await query.find();
//     //   const values = results.map(result => ({result.get(fieldName): result.}));
//     //   const distinctValues = [...new Set(values)]; // Get distinct values
//     return results;

//   } catch (error) {
//     throw new Error(`Error fetching distinct values: ${error.message}`);
//   }
// });

// Parse.Cloud.define("getQuizList", async (request) => {
//   const currentDate = new Date();

//   const current_quiz_query = new Parse.Query('QuizData');
//   current_quiz_query.lessThanOrEqualTo("start_date", currentDate);
//   current_quiz_query.greaterThanOrEqualTo("end_date", currentDate);
//   current_quiz_query.limit(100);

//   const past_quiz_query = new Parse.Query('QuizData');
//   past_quiz_query.lessThanOrEqualTo("end_date", currentDate);
//   past_quiz_query.limit(100);

//   const future_quiz_query = new Parse.Query('QuizData');
//   future_quiz_query.greaterThanOrEqualTo("start_date", currentDate);
//   future_quiz_query.limit(100);

//   try {
//     // const current_results = await current_quiz_query.find();
//     // const past_results = await past_quiz_query.find();
//     // const future_results = await future_quiz_query.find();

//     const [current_results, past_results, future_results] = await Promise.all([
//       current_quiz_query.find({ useMasterKey: true }),
//       past_quiz_query.find({ useMasterKey: true }),
//       future_quiz_query.find({ useMasterKey: true })
//     ]);

//     var result = { "current": current_results, "past": past_results, "upcoming": future_results };
//     // console.log(result);
//     return result;

//   } catch (error) {
//     throw new Error(`Error fetching  values: ${error.message}`);
//   }
// });

// Parse.Cloud.define("getEventsBySchoolsList", async (request) => {


//   const state = request.params.state;
//   const city = request.params.city;
//   const district = request.params.district;
//   const school = request.params.school;
//   const skip = request.params.skip;
//   const limit = request.params.limit;

//   const schoolsQuery = new Parse.Query('Schools');

//   if (state && state != '') {
//     schoolsQuery.equalTo("state", state);
//   }
//   if (city && city != '') {
//     schoolsQuery.equalTo("city", city);
//   }
//   if (district && district != '') {
//     schoolsQuery.equalTo("district", district);
//   }
//   if (school && school != '') {
//     schoolsQuery.equalTo("school", school);
//   }



//   try {
//     const schoolResult = await schoolsQuery.find();
//     schoolsName = schoolResult.map((e) => e.id);
//     const eventListQuery = new Parse.Query('SchoolsGallery');
//     eventListQuery.containedIn('schoolPointer', );
//     eventListQuery.descending('event_date')
//     // if(skip && skip != ''){
//     //   eventListQuery.skip(parseskip);
//     // }
//     eventListQuery.skip(parseInt(skip));
//     eventListQuery.limit(11);
//     const eventList = await eventListQuery.find();
//     return eventList;

//   } catch (error) {
//     throw new Error(`Error fetching  values: ${error.message}`);
//   }
// });

// Parse.Cloud.define("getQuestionById", async (request) => {
//   const id = request.params.id;
//   if (!id) {
//     throw new Error("Missing required parameter(s): id");
//   }

//   const quesQuery = new Parse.Query('QuizData');

//   try {
//     if (id && id != '') {
//       const quesResult = await quesQuery.get(id);
//       const questionMap = {
//         "question_answer_map": quesResult.get('quiz_question_answer_map'),
//         "quiz_type": quesResult.get('quiz_type')

//       }
//       return questionMap;
//     }
//     else {
//       return { "error": "invalid id" };
//     }

//   } catch (error) {
//     throw new Error(`Error fetching  values: ${error.message}`);
//   }
// });

// //putSolutionByStudent
// Parse.Cloud.define("putSolutionByStudent", async (request) => {
//   const solutions = request.params.solution
//   const quiz_id = request.params.quiz_id;
//   if (!solutions) {
//     throw new Error("Missing required parameter(s): solutions");
//   }

//   if (!quiz_id) {
//     throw new Error("Missing required parameter(s): quiz_id");
//   }

//   // if (typeof solutions !== 'object') {
//   //   throw new Error("type not matching): solutions");
//   // }


//   const ParseObject = Parse.Object.extend('SolutionsSubmitted');
//   const parseObject = new ParseObject();

//   const PointerClass = Parse.Object.extend('QuizData');
//   const pointerObject = new PointerClass();
//   pointerObject.id = quiz_id;

//   try {
//     parseObject.set('quiz_id', pointerObject);
//     parseObject.set('solutionList', JSON.parse(solutions));
//     const savedObject = await parseObject.save();
//     return { 'objectId': savedObject.id }
//   }
//   catch (error) {
//     throw new Error(`Failed to save object: ${error.message}`);
//   }
// });


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
if(!skip)
{
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
            id:comment.id,
            comment:comment.get('comment'),
            user:{
              id:comment.get('user').id,
              firstname:comment.get('user').get('firstname'),
              lastname:comment.get('user').get('lastname'),
              profilePic: comment.get('user').get('profilePic'),
              userName: comment.get('user').get('username')
            },
            createdAt:comment.get('createdAt').toJSON(),
            updatedAt:comment.get('updatedAt').toJSON(),
          }
          });
          
          
          return {
            "id": e.id,
            'photoUrl': e.get('post').get('imageUrl'),
            'caption': e.get('post').get('caption'),
            'school':{
              id:e.get('post').get('school').id,
              schoolName : e.get('post').get('school').get("name") ,
              city : e.get('post').get('school').get('city'),
              // profilePic: e.get('post').get('school')
              profilePic:''
            },
            'comments': commentsResult,
            'likes': e.get('likes'),
            'createdAt':e.get('createdAt').toJSON(),
            'updatedAt':e.get('updatedAt').toJSON()
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
    const weekTopRankJSON = {
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
    }
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
      return(({ code: 400, status: false, message: 'Invalid quiz_id format' }));

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
      return({ code: 200, status: true, message: '', 'quiz': quizResult, "questions": questions });
    } else {
      return({ code: 404, status: false, message: 'Quiz not found' });
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
      return(({ code: 400, status: false, message: 'Invalid quiz_id format' }));

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
      return({ code: 200, status: true, message: '', 'quiz': quizResult, "questions": questions });
    } else {
      return({ code: 404, status: false, message: 'Quiz not found' });
    }
  }
  catch (err) {
    throw new Error(err);
  }
});