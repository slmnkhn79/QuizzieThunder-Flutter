const Parse = require('parse/node');
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE", javaScriptKey = "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey = "984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';


const Quiz = new  Parse.Object('Quiz');
Quiz.id = 'BKGmX7h0FY';



const Questions = new Parse.Query('Question');
Questions.equalTo('quiz', Quiz);
Questions.limit(1000);


async function getQuestions() {
    const questions = await Questions.find({ useMasterKey: true });
    questions.map((question)=> {
        // console.log(questions.get('question'));
        if(!question.get('options').includes(question.get('correct_answer'))){
            console.log(question.id)
        }
        
    })
}

getQuestions();

