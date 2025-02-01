const { result, random } = require('lodash');
var lodash = require('lodash/lodash.js');
const {validateUser} = require('./userValidation.js');
Parse.Cloud.define("home", async (request) => {

  const today = new Date();
  const Quiz = new Parse.Query('Quiz');
  Quiz.include('category');
  Quiz.include('standard');
  Quiz.equalTo('enabled', 1);
  Quiz.greaterThanOrEqualTo('end_date', today);
  Quiz.lessThanOrEqualTo('start_date', today);


  const QuizCategory = new Parse.Query('QuizCategory');
  const QuizResult = new Parse.Query('QuizResult');
  try {
    await validateUser(request);
    
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
        QuizCount.equalTo('enabled', 1);
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
    // console.log(allQuizzes);
    const allQuizzes_1 = await allQuizzes.map((e) => {

      return {
        "id": e.id,
        'title': e.get('title'),
        'description': e.get('description'),
        'category': { 'title': e.get('category').get('title'), '_id': e.get('category').id, 'createdAt': e.get('category').get('createdAt').toJSON(), 'updatedAt': e.get('category').get('updatedAt').toJSON() },
        'createdAt': e.get('createdAt').toJSON(),
        'updatedAt': e.get('updatedAt').toJSON(),
        'standard': e.get('standard').get('standard_name'),
        'level': e.get('level')
      }
    });
    const randomQuizzes = lodash.sampleSize(allQuizzes_1, 5); // Get 5 random quizzes
    // const randomMostPlayedQuiz = lodash.sample(allQuizzes_1); // Get a random most played quiz

    const MostPlayedQuizQuery = new Parse.Query('MostPlayedQuiz');
    MostPlayedQuizQuery.include('most_played_quiz');
    MostPlayedQuizQuery.include('most_played_quiz.category');
    MostPlayedQuizQuery.include('most_played_quiz.standard');
    MostPlayedQuizQuery.include('user');
    const e = await MostPlayedQuizQuery.first();
    var mostPlayedQuizResult = null;
    if (e) {
      mostPlayedQuizResult = {
        "id": e.get('most_played_quiz').id,
        'title': e.get('most_played_quiz').get('title'),
        'description': e.get('most_played_quiz').get('description'),
        'category': {
          'title': e.get('most_played_quiz').get('category').get('title'),
          '_id': e.get('most_played_quiz').get('category').id,
          'createdAt': e.get('most_played_quiz').get('category').get('createdAt').toJSON(),
          'updatedAt': e.get('most_played_quiz').get('category').get('updatedAt').toJSON()
        },
        'createdAt': e.get('most_played_quiz').get('createdAt').toJSON(),
        'updatedAt': e.get('most_played_quiz').get('updatedAt').toJSON(),
        'standard': e.get('most_played_quiz').get('standard').get('standard_name'),
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
    // throw new Error(err);
    return {
      "code": 500,
      "status": false,
      "message": err.toString(),
      "quizzes": [],
      "mostPlayedQuiz": [],
      "topPicQuiz": [],
      "weekTopRank": [],
      "quizCategories": [],
    }
  }
}
);