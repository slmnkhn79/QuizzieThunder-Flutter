 const { validateUser } = require('./userValidation');
const { updateStreak } = require('./streakMechanism.js');
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
    await validateUser(request);
    //check if entry exists or not for a user
    
    const AnsweredQuery = new Parse.Query("Answered");

    // const User = new Parse.Query(Parse.User);
    // const user = await User.get(userId);
    const user = request.user;

    const QuizObject = new Parse.Object("Quiz");
    QuizObject.id = quizId;

    AnsweredQuery.equalTo('quiz', QuizObject);
    AnsweredQuery.equalTo('user', user);
    const hasAnswered = await AnsweredQuery.first({useMasterKey:true});
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

      const acl = new Parse.ACL();
      acl.setPublicWriteAccess(false);
      acl.setPublicReadAccess(false);

      Answers.setACL(acl);
      const result = await Answers.save(null, {useMasterKey:true});
      const streak = await updateStreak(request,'quiz-submitted');
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
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      newQuizResult: {}
    };
  }
});
