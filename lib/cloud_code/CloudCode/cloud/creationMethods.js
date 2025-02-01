const createPost = async (request) => {
    console.log(request.params)
    const { title, caption, imageUrl, type, schoolId } = request.params;
    const Post = new Parse.Object('Posts');
    const School = new Parse.Object('Schools');
    School.id = schoolId;
    Post.set('title', title).set('caption', caption).set('imageUrl', imageUrl).set('type', type);
    Post.set('school', School);
    const res = await Post.save(null, { useMasterKey: true })
    const Feed = new Parse.Object('Feed');
    Feed.set('post', res);
    const FeedACL = new Parse.ACL();
    FeedACL.setPublicReadAccess(true);
    FeedACL.setPublicWriteAccess(false);
    Feed.setACL(FeedACL);
    await Feed.save(null, { useMasterKey: true })
    return res;
};

createQuiz = async (request) => {
    console.log(request.params);
    const { totalQuestions, quizType, difficulty, timeLimit, startDate, endDate, title, description, category, standard } = request.params
    if (!totalQuestions) {
        throw new Error("totalQuestions parameter is required.");
    }
    if (!quizType) {
        throw new Error("quizType parameter is required.");
    }
    if (!difficulty) {
        throw new Error("difficulty parameter is required.");
    }
    if (!timeLimit) {
        throw new Error("timeLimit parameter is required.");
    }
    if (!startDate) {
        throw new Error("startDate parameter is required.");
    }
    if (!endDate) {
        throw new Error("endDate parameter is required.");
    }
    if (!title) {
        throw new Error("title parameter is required.");
    }
    if (!description) {
        throw new Error("description parameter is required.");
    }
    if (!category) {
        throw new Error("category parameter is required.");
    }
    if (!standard) {
        throw new Error("standard parameter is required.");
    }

    const QuizTypeQuery = new Parse.Query('QuizTypes');
    const QuizType = await QuizTypeQuery.get(quizType);

    const CategoryQuery = new Parse.Query('QuizCategory');
    const Category = await CategoryQuery.get(category);

    const StandardQuery = new Parse.Query('Standard');
    const Standard = await StandardQuery.get(standard);

    const PrizeQuery = new Parse.Query('QuizPrize');
    const Prize = await PrizeQuery.get('ewgbGauOFi');

    const QuizACL = new Parse.ACL();
    QuizACL.setPublicReadAccess(true);
    QuizACL.setPublicWriteAccess(false);

    const QuizObject = new Parse.Object('Quiz');
    QuizObject.set('total_question', totalQuestions)
        .set('quiz_type', QuizType)
        .set('level', difficulty)
        .set('time_limit', timeLimit)
        .set('start_date', new Date(startDate))
        .set('prize', Prize)
        .set('end_date', new Date(endDate))
        .set('title', title)
        .set('description', description)
        .set('category', Category)
        .set('enabled', 1)
        .set('standard', Standard);
    QuizObject.setACL(QuizACL);

    const result = await QuizObject.save(null, { useMasterKey: true });
    return result;

}

Parse.Cloud.define("createPost", async (request) => {
    try {

        const result = await createPost(request);
        return result;
    } catch (error) {
        // throw new Error("Error retrieving course details: " + error.message);
        return {
            code: 500,
            status: false,
            "message": error.toString()
        }
    }
});

Parse.Cloud.define("createQuiz", async (request) => {
    try {

        const result = await createQuiz(request);
        return result;
    } catch (error) {
        // throw new Error("Error retrieving course details: " + error.message);
        return {
            code: 500,
            status: false,
            "message": error.toString()
        }
    }
});

Parse.Cloud.define("createSchool", async (request) => {
  try {
    const Schools = Parse.Object.extend("Schools");
    const school = new Schools();

    const{header_image_url
,school_name
,year
,photo1_url
,photo2_url
,videoId
,videoCaption
,photo3_url
,faculty_ratio
,number_of_students
,logo
,logo_url
,description
,pullTop1Quote
,pullTop1QuoteBottom
,pullQuote2
,historyInfo2
,constructionInfo1
,callOut2
,constructionInfo2
,extraInfo1
,pullQuote3
,locationInfo2
          ,type
         } = request.params;

    // Mapping JSON data to Parse object fields
    school.set("name", school_name);
    // school.set("year", year);
    school.set("photo1", photo1_url);
    school.set("photo2", photo2_url);
    school.set("photo3", photo3_url);
    school.set("faculty_ratio", faculty_ratio);
    school.set("number_of_students", parseInt(number_of_students, 10)); // Convert to number
    school.set("logo", logo_url); // Assuming you want to use the URL
    school.set("description", description);
    school.set("header_image", header_image_url);
    school.set("final_image",header_image_url);
    school.set('city','Lakhimpur Kheri');
    school.set('district','Lakhimpur Kheri');
    school.set('state','UP');
    school.set('type',type);
    school.set('map_location','https://maps.google.com/mnop1234');
    school.set('attributes',[]);
    
    
    
    school.set("text_artifacts", {
      startYear:year,
      endYear: 0,
      pullQuote1Top: pullTop1Quote,
      pullQuote1Bottom: pullTop1QuoteBottom,
      pullQuote2: pullTop1Quote,
      historyInfo2: historyInfo2,
      constructionInfo1: constructionInfo1,
      callout2: callOut2,
      constructionInfo2: constructionInfo2,
      locationInfo1: extraInfo1,
      pullQuote3: pullQuote3,
      locationInfo2: locationInfo2,
      videoId: videoId,
      videoCaption: videoCaption
    });

   const result =  await school.save(null, {useMasterKey:true});
    
    return {
            code: 200,
            status: true,
            "message": "Data Saved Succesfully",
      "data":result
        }
  } catch (error) {
   return {
            code: 500,
            status: false,
            "message": error.toString()
        }
  }
});


Parse.Cloud.define("createQuestions", async (request) => {
  // Access the parameters passed to the cloud function
  const {
    quizId,
    question,
    answers,
    correct_answers,
    question_category
  } = request.params;

  // Create a new instance of the Parse Object for the Question class
  const Question = Parse.Object.extend("Question");
  const questionObject = new Question();

  // Set the properties of the question object
  questionObject.set("question", question);
  questionObject.set("options", answers);
  questionObject.set("correct_answer", correct_answers);
  questionObject.set("question_category", question_category);
  
  // If a quiz ID is provided, set the quiz relationship
  if (quizId) {
    const Quiz = Parse.Object.extend("Quiz");
    const quizPointer = new Quiz();
    quizPointer.id = quizId;
    questionObject.set("quiz", quizPointer); // Establish a pointer relationship
  }

  // Save the question object to the Parse database
  try {
    const savedQuestion = await questionObject.save();
    return {code:200, status:true, message:"data saved succesfully",data: savedQuestion};
  } catch (error) {
   return  {code:500, status:false, message: error.toString()}
  }
});

Parse.Cloud.define("createStudyPlanUsingJson", async (request) => {
  const {
    dropdown,
    plan_attributes,
    plan_description,
    plan_name
  } = request.params;

  const Standard = Parse.Object.extend("Standard");
  const standard = new Standard();
  standard.id = dropdown;
  
  // Create a new instance of the StudyPlan class
  const StudyPlan = Parse.Object.extend("StudyPlan");
  const studyPlan = new StudyPlan();

  const studyACL = new Parse.ACL();
  studyACL.setPublicReadAccess(true);
  studyACL.setPublicWriteAccess(false);
  
  // Define the `plan_attributes` field using the provided information
 
  
  // Set the fields on the StudyPlan object
  studyPlan.set("plan_name", plan_name);
  studyPlan.set("plan_description", plan_description);
  studyPlan.set("plan_attributes", {"data": JSON.parse(plan_attributes)});
  studyPlan.setACL(studyACL);
  studyPlan.set('standard',standard);
  
  try {
    // Save the object in Parse database
    const result = await studyPlan.save();
    return {code:200, status:true, message:"Saved succesfully!", data: result.id};
  } catch (error) {
 return   {code:500, status:false, message:error.toString()};
  }
});
Parse.Cloud.define("createStudyPlan", async (request) => {
  const {
    dropdown,
    plan_attributes,
    plan_description,
    plan_name
  } = request.params;

  const Standard = Parse.Object.extend("Standard");
  const standard = new Standard();
  standard.id = dropdown;
  
  // Create a new instance of the StudyPlan class
  const StudyPlan = Parse.Object.extend("StudyPlan");
  const studyPlan = new StudyPlan();

  const studyACL = new Parse.ACL();
  studyACL.setPublicReadAccess(true);
  studyACL.setPublicWriteAccess(false);
  
  // Define the `plan_attributes` field using the provided information
 
  
  // Set the fields on the StudyPlan object
  studyPlan.set("plan_name", plan_name);
  studyPlan.set("plan_description", plan_description);
  studyPlan.set("plan_attributes", plan_attributes);
  studyPlan.setACL(studyACL);
  studyPlan.set('standard',standard);
  
  try {
    // Save the object in Parse database
    const result = await studyPlan.save();
    return {code:200, status:true, message:"Saved succesfully!", data: result.id};
  } catch (error) {
 return   {code:500, status:false, message:error.toString()};
  }
});