
const {validateUser} = require('./userValidation.js');
const { result, random } = require('lodash');
var lodash = require('lodash/lodash.js'); 

const getPhotoQuiz = async (request) =>{
   const { quizId} = request.params;
   const user = request.user;


  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  if (!user) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no user found");
  }
    
    //check if entry exists or not for a user
    const AnsweredQuery = new Parse.Query("Answered");

    // const User = new Parse.Query(Parse.User);
    // const user = await User.get(userId);

    // const QuizObject = new Parse.Object("Quiz");
    // QuizObject.id = quizId;
    const QuizQuery = new Parse.Query("Quiz");
    const QuizObject = await QuizQuery.get(quizId);

    AnsweredQuery.equalTo('quiz', QuizObject);
    AnsweredQuery.equalTo('user', user);
    const hasAnswered = await AnsweredQuery.first();

  if(hasAnswered){
    return {
      code:500,
      status: false,
      message: "Quiz already completed",
      data:{
        quiz: {
          id: QuizObject.id,

        },
        hasAttempted: true,
        imageUrl: hasAnswered.get('ans_map')['imageUrl']
      }
    }
  }
  else
  {
    return {
       code:200,
      status: true,
      message: "",
       data:{
        hasAttempted:false
      }
    }
  }

   

  
 };
module.exports = {
  getPhotoQuiz,
};

Parse.Cloud.define('questions', async (request) => {


  const quizId = request.params.quizId;
  try {
    await validateUser(request);
    if (!quizId)
      return ({ code: 400, status: false, message: 'Invalid quiz_id format' });

    const Quiz = new Parse.Query("Quiz");
    Quiz.include("category");
    Quiz.include('standard');
    Quiz.equalTo('enabled',1);
    Quiz.equalTo("objectId", quizId);
    const quiz = await Quiz.first();


    if (!quiz)
      return (({ code: 400, status: false, message: 'Invalid quiz_id format' }));

    quizResult = {
      _id: quiz.id,
      title: quiz.get('title'),
      standard: quiz.get('standard').get('standard_name'),
      'category': { 'title': quiz.get('category').get('title'), '_id': quiz.get('category').id, 'createdAt': quiz.get('category').get('createdAt').toJSON(), 'updatedAt': quiz.get('category').get('updatedAt').toJSON() },
      createdAt: quiz.get('createdAt').toJSON(),
      updatedAt: quiz.get('updatedAt').toJSON(),
      numOfQuestions: quiz.get('total_question'),
      time_limit: quiz.get('time_limit') //time limit per question
    }

    const Question = new Parse.Query('Question');
    Question.include("quiz");

    Question.equalTo("quiz", quiz);

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
      return ({ code: 500, status: false, message: 'Quiz not found' });
    }
  }
  catch (err) {
    // throw new Error(err);
    return ({ code: 500, status: false, message: err.toString(), quizResult: {}, question: [] });
  }
});

Parse.Cloud.define('getQuizQuestion', async (request) => {
  const { quizId } = request.params;
  const User = request.user;

  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  try {
    await validateUser(request);
    //chekcing if quiz has already been answered
    const AnsweredQuery = new Parse.Query("QuizActivity");


    const QuizObject = new Parse.Object("Quiz");
    QuizObject.id = quizId;

    AnsweredQuery.equalTo('quiz', QuizObject);
    AnsweredQuery.equalTo('user', User);
    const hasAnswered = await AnsweredQuery.first();
    // flag to check if quiz has answered
    //
    console.log("Has answered", hasAnswered);

    if (hasAnswered) {
      return { code: 400, status: false, message: "Quiz already answered" };
    }
    else {
      const Quizzes = new Parse.Query("Quiz");
      Quizzes.include('category');

      Quizzes.equalTo('objectId', quizId);

      const quiz = await Quizzes.first();

      const Question = new Parse.Query("Question");
      Question.include('question_type');
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
          question: Buffer.from(e.get('question')).toString('base64'),
          options: e.get('options'),
          correctOptionIndex: -1,
          createdAt: e.get('createdAt').toJSON(),
          updatedAt: e.get('updatedAt').toJSON(),
          question_type: e.get('question_type').get('question_type')
            
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
          totalQuestions: quiz.get('total_question'),
          time_limit : quiz.get('time_limit')
        },
        questions: questionsResult
      };
    }
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      quiz: {}
    }
  }
});