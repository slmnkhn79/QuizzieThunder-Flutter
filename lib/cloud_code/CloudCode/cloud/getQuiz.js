const {validateUser} = require('./userValidation.js');
Parse.Cloud.define('allQuiz', async (request) => {

  try {
    await validateUser(request);
    const today = new Date();
    const Quizzes = new Parse.Query("Quiz");
    Quizzes.include('category');
    Quizzes.descending('createdAt');
    Quizzes.include('standard');
    Quizzes.include('quiz_schedule');
    Quizzes.greaterThanOrEqualTo('end_date', today);
    Quizzes.lessThanOrEqualTo('start_date', today);
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
        schedule:{
          id:e.get('quiz_schedule').id,
          frequency_name: e.get('quiz_schedule').get('quiz_schedule_name'),
          frequency_code: e.get('quiz_schedule').get('quiz_schedule_code')
          
        },
        standard: e.get('standard').get('standard_name'),
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
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      quizzes: []
    };
  }
});

Parse.Cloud.define('quizByCatId', async (request) => {
  const { quizCatId } = request.params;

  //implement logic in case shcool id is null
  if (!quizCatId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "quizCatId");
  }
  try {
    await validateUser(request);


    const Quizzes = new Parse.Query("Quiz");

    const QuizCategory = new Parse.Object("QuizCategory");
    QuizCategory.id = quizCatId;
    Quizzes.equalTo("category", QuizCategory);
    Quizzes.include('quiz_schedule');

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
         schedule:{
          id:e.get('quiz_schedule').id,
          frequency_name: e.get('quiz_schedule').get('quiz_schedule_name'),
          frequency_code: e.get('quiz_schedule').get('quiz_schedule_code')
          
        },
        standard: e.get('standard').get('standard_name'),
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
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      quizzes: []
    };
  }
});
