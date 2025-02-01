const { validateUser } = require('./userValidation');


const getQuizDetails = async (request) =>{
   const { quizId, userId } = request.params;
  const user = request.user;


  //implement logic in case shcool id is null
  if (!quizId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }
  if (!userId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no userId id found");
  }
    const QuizQuery = new Parse.Query("Quiz");
    QuizQuery.include('category');
    QuizQuery.include('standard');

    QuizQuery.include('quiz_type')
    QuizQuery.include('prize')
    const quiz = await QuizQuery.get(quizId);



    //check if entry exists or not for a user
    const hasAnsweredQuery = new Parse.Query("QuizActivity");
    hasAnsweredQuery.equalTo('quiz', quiz);
    hasAnsweredQuery.equalTo('user', user);
    const hasAnswered = await hasAnsweredQuery.first();

    

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
          points: quiz.get('prize').get('points') ?? 0,
          // isPlayed : hasAnswered ? true: false,
          isPlayed: hasAnswered != 'undefined' && hasAnswered ? true : false,
          standard: quiz.get("standard").get('standard_name'),
          quizType:
            {
              id: quiz.get('quiz_type').id,
              quizTypeNameLong: quiz.get('quiz_type').get("type_name_long"),
              quizTypeShort:  quiz.get('quiz_type').get("type_name_short"),
              quizTypeId:  quiz.get('quiz_type').get("type_id"),
        },
          categoryName: quiz.get('category').get('title'),
          timeLimit: quiz.get('time_limit'),
          level: quiz.get('level'),
          quizPrizeDetails: quiz.get('prize').get('prizes') ?? [],
        }
      }
    }
    else {
      return {
        code: 400,
        status: true,
        message: "quiz nto found",
        data: "please check quiz id"
      }
    }

  
 };

 const startQuiz = async (request) =>{
  const user = request.user;
  const {quizId} = request.params;

  if(!quizId){
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "no quiz id found");
  }

  const QuizQuery = new Parse.Query('Quiz');
  const Quiz = await QuizQuery.get(quizId,{useMasterKey:true});

  const StartedQuery = new Parse.Query('QuizActivity');
  StartedQuery.equalTo('user',user);
  StartedQuery.equalTo('quiz',Quiz);
  const result = await StartedQuery.first({useMasterKey:true});

  if(result)
  {
    return {
      code:500,
      status: false,
      message: "Quiz Already Opened!",
      data: result
    }
  }
  else{
    const StartedObject = new Parse.Object('QuizActivity');
    StartedObject.set('user',user);
    StartedObject.set('quiz',Quiz);
    const result = await StartedObject.save(null,{useMasterKey:true})
    return {
      code: 200,
      status: true,
      message:"",
      data :{
        id: result.id,
        quizId : result.get('quiz').id,
      }
    }
  }
 };


// module.exports = {
//   getQuizDetails,
//   startQuiz
// };

Parse.Cloud.define('getQuizDetail', async (request) => {
  

  try {
    await validateUser(request);
    const result = await getQuizDetails(request);
    return result;
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: true,
      message: error.toString(),
      quizDetail: {}
    }
  }
});

Parse.Cloud.define('startQuiz', async (request) => {
  

  try {
    await validateUser(request);
    const result = await startQuiz(request);
    return result;
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: true,
      message: error.toString(),
      quizDetail: {}
    }
  }
});