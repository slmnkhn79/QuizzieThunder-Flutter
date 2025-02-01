const {validateUser} = require('./userValidation.js');

Parse.Cloud.define("leaderboard", async (request) => {
  try {
    await validateUser(request);
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
    return {
      code: 500,
      status: true, message: '',
      all_time_leaderboard: [],
      weekly_leaderboard: []
    };
  }
});




Parse.Cloud.define('schoolLeaderboard', async (request) => {

  const SchoolLeaderboard = new Parse.Query('SchoolLeaderboard');
  SchoolLeaderboard.include("school");
  SchoolLeaderboard.include("bestQuiz");

  try {
    await validateUser(request);
    const schoolLeaderboard = await SchoolLeaderboard.find();
    if (schoolLeaderboard) {
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
    else {
      return {
        "code": 200,
        "status": true,
        "message": "success",
        "schoolLeaderboard": []
      }
    }


  }
  catch (err) {
    // throw new Error(err);
    return {
      "code": 500,
      "status": false,
      "message": err.toString(),
      "schoolLeaderboard": []
    }
  }
});