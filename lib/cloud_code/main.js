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
  try {
    const allQuizzes = await Quiz.find()
    const randomQuizzes = lodash.sampleSize(allQuizzes, 5); // Get 5 random quizzes
    const randomMostPlayedQuiz = lodash.sample(allQuizzes); // Get a random most played quiz

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

Parse.Cloud.define("discover", async (request) => {

  const Quiz = new Parse.Query('Quiz');
  const QuizCategory = new Parse.Query('QuizCategory');
  const QuizResult = new Parse.Query('QuizResult');
  try {

    const currentDate = new Date();
    const oneWeekAgo = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000);

    const allQuizzes = await Quiz.find();
    const allQuizCategories = await QuizCategory.find();
    const randomTopPickQuiz = lodash.sample(allQuizzes); // Get a random top pick quiz

    const quizCategoriesWithCounts = await Promise.all(
      allQuizCategories.map(async (category) => {
        // const quizCount = await Quiz.countDocuments({ category: category._id });
        const quizCount = await Quiz.count();

        return {
          _id: category._id,
          title: category.title,
          createdAt: category.createdAt,
          updatedAt: category.updatedAt,
          quizCount: quizCount,
        };
      })
    );
    QuizResult.greaterThanOrEqualTo('updatedAt', oneWeekAgo);
    QuizResult.lessThan('updatedAt', currentDate);
    QuizResult.descending("points");
    // const weekTopRank = await QuizResult.first({
    //   updatedAt: { $gte: oneWeekAgo, $lt: currentDate }
    // }).sort({ points: -1 })
    //   .populate('user', 'firstname lastname profilePic');
    const weekTopRank = await QuizResult.first();

    return {
      code: 200, status: true, message: '',
      top_pic_quiz: randomTopPickQuiz,
      week_top_rank: weekTopRank,
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
    // const userDetail = await User.findOne(userId, '-password').lean();

    const User = new Parse.Query(Parse.User);
    const userDetail = await User.equalTo("objectId", userId);
    // userDetail = user

    // const stats = await QuizResult.findOne({
    //   user: userId
    // }, '-user')

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.equalTo('user', userDetail.id);
    const stats = QuizResult.first();

    const Quiz = new Parse.Query("Quiz");
    let rank = null;
    let successRate = 0;
    let averagePointsPerQuiz = 0;
    // const totalQuizzesAvailable = await Quiz.countDocuments();
    const totalQuizzesAvailable = await Quiz.count();
    let quizParticipationRate = 0;
    let statsResult = null;

    if (stats) {
      successRate = (stats.quizWon / stats.quizPlayed) * 100;
      averagePointsPerQuiz = stats.points / stats.quizPlayed;
      quizParticipationRate = (stats.quizPlayed / totalQuizzesAvailable) * 100;

      const userPoints = stats.points;

      // const higherRankUsers = await QuizResult.countDocuments({
      //   points: { $gt: userPoints }
      // });

      const QuizResult_2 = new Parse.Query('QuizResult');
      QuizResult_2.greaterThan("points", userPoints);
      const higherRankUsers = await QuizResult_2.count();

      rank = higherRankUsers + 1;

      statsResult = {
        quiz_won: stats.quizWon,
        _id: stats._id,
        points: stats.points,
        total_quiz_played: stats.quizPlayed,
        rank: rank,
        success_rate: successRate,
        average_points_per_quiz: averagePointsPerQuiz,
        quiz_participation_rate: quizParticipationRate,
        createdAt: stats.createdAt,
        updatedAt: stats.updatedAt
      };
    }

    return {
      code: 200, status: true, message: 'Profile details fetched successfully',
      user_detail: userId,
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


    // const weeklyLeaderboard = await QuizResult.find({
    //   updatedAt: { $gte: oneWeekAgo, $lt: currentDate }
    // }).sort({ points: -1 })
    //   .populate('user', 'firstname lastname profilePic');// Populate user details with specified fields

    const QuizResult = new Parse.Query("QuizResult");
    QuizResult.greaterThanOrEqualTo('updatedAt', oneWeekAgo);
    QuizResult.lessThan('updated', currentDate);
    QuizResult.descending("points");

    const weeklyLeaderboard = await QuizResult.find();

    // const allTimeLeaderboard = await QuizResult_2.find().sort({ points: -1 })
    //   .populate('user', 'firstname lastname profilePic'); // Populate user details with specified fields

    const QuizResult_2 = new Parse.Query("QuizResult");
    QuizResult_2.descending("points");
    const allTimeLeaderboard = await QuizResult_2.find();

    if (allTimeLeaderboard.length > 0) {
      return {
        code: 200, status: true, message: '',
        all_time_leaderboard: allTimeLeaderboard,
        weekly_leaderboard: weeklyLeaderboard
      };
    } else {
      return { code: 404, status: false, message: 'No data found' };
    }
  }
  catch (err) {
    throw new Error(err);
  }
});
