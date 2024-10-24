
const Parse = require('parse/node');



Parse.initialize("myappID", "mymasterKey");
Parse.serverURL = 'http://192.168.1.40:1337/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Question");

const Quiz = Parse.Object.extend("Quiz");
const _quiz = new Quiz()
_quiz.id = "fmmvXGn2Ej";


function load_data(data) {
    var list_data = [];
    for (const item of data) {

        const _questions = new Question();

        // do stuff with your user

        _questions
            .set('quiz', _quiz)
            .set('question', item['question'])
            .set('options', item['answers'])
            .set('correct_answer', item['correct_answer'])
            ;
        list_data.push(_questions)
        // break;
    }
    Parse.Object.saveAll(list_data).then(() => {
        console.log('save batch:-');
    }).catch((err) => {
        console.log('error:-', err.toString());
    });
    // console.log(list_data[2].get('date'));
}

var question_data =
[
  
];

load_data(question_data);