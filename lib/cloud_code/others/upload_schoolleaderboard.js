
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Question");

const Quiz = Parse.Object.extend("Quiz");



function load_data(data) {
    var list_data = [];
    for (const item of data) {

        const _questions = new Question();
        const _quiz = new Quiz()
        _quiz.id = item['_p_quiz'];

        // do stuff with your user

        _questions
            .set('quiz', _quiz)
            .set('question', item['question'])
            .set('options', item['options'])
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

    // console.log(list_data[2].get('correct_answer'));
    
}

var question_data =
[
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    },
    {
        "quizWon":200,
        "studentParticipated":2000,
        "points":2000,
        "quizPlayed":20,
        "school":"",
        "bestQuiz":""
    }
];

load_data(question_data);