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
        .set('level', level)
        .set('time_limit', timeLimit)
        .set('start_date', startDate)
        .set('prize', Prize)
        .set('end_date', endDate)
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