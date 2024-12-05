
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user

const User = Parse.User.extend();
User.id = 'rDISRLnrlu';

const QuizResult = Parse.Object.extend("QuizResult");
const QuizQuery = new Parse.Query(QuizResult);
QuizQuery.equalTo('user',User)


const Quiz = new Parse.Query('Quiz');




async function start ()
{
const result =  await QuizQuery.first();
// const quiz = await Quiz.get('NTDruvUyoy');
// const quiz = await Quiz.get('IUeLREiYbn');
// const quiz = await Quiz.get('BlWYmsLwaI');
const quiz = await Quiz.get('dMM3YCiGtk');

var quizAttempt = result.relation('quizAttemptList');
var quizWon = result.relation('quizWonList');

quizAttempt.add(quiz);
// quizWon.add(quiz);
await result.save();

}

console.log(start());