const Parse = require('parse/node');
require('dotenv').config();
async function updateQuestionTypePointer(targetObjectId) {
    // Initialize Parse (ensure you have proper initialization elsewhere)
    Parse.initialize(
        Parse.applicationId = process.env.appId, 
        javaScriptKey = process.env.jsKey,
        masterKey = process.env.masterKey,
    );
    // Parse.serverURL = 'https://parseapi.back4app.com/parse';
    Parse.serverURL = 'https://parse.slmnkhn79.shop/parse';


    try {
        // Create a pointer to QuestionType with objectId '2enWWvHYIT'
        const QuestionType = Parse.Object.extend('QuestionType');
        const questionTypePointer = new QuestionType();
        questionTypePointer.id = targetObjectId;

        // Create query for the target object
        const Question = Parse.Object.extend('Question');
        const query = new Parse.Query(Question);
        query.limit(3000);

        // Get the objects to update
        const targetObjects = await query.find({ useMasterKey: true });

        // Update each object’s 'question_type' field to point to the specified QuestionType
        targetObjects.forEach((object) => {
            object.set('question_type', questionTypePointer);
        });

        // Save all objects in a single batch request
        const  result = await Parse.Object.saveAll(targetObjects, { useMasterKey: true });
        console.log(result.length);

        console.log(`Successfully updated ${targetObjects.length} question type pointers.`);
        return true;
    } catch (error) {
        console.error('Error updating pointers:', error);
        return false;
    }
}

// Usage
updateQuestionTypePointer('2enWWvHYIT');