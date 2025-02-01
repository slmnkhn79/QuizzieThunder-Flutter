const getCourseDetails = async (request) => {

    const { courseId } = request.params;
    const USER = request.user;
    if (!courseId) {
        throw new Error("courseId parameter is required.");
    }

    // Find the course
    const Course = Parse.Object.extend("Course");
    const courseQuery = new Parse.Query(Course);
    // courseQuery.equalTo("courseId", courseId);
    // const course = await courseQuery.first();
    const course = await courseQuery.get(courseId, { useMasterKey: true });

    if (!course) {
        throw new Error("Course not found!");
    }

    // Retrieve modules
    const Module = Parse.Object.extend("Module");
    const moduleQuery = new Parse.Query(Module);
    moduleQuery.equalTo("course", course);
    moduleQuery.ascending("order");
    const modules = await moduleQuery.find();

    // Retrieve quizzes and questions for each module
    const QuizV2 = Parse.Object.extend("QuizV2");
    const QuestionV2 = Parse.Object.extend("QuestionV2");
    const moduleDetails = await Promise.all(modules.map(async (module) => {
        const quizQuery = new Parse.Query(QuizV2);
        quizQuery.equalTo("module", module);
        const quiz = await quizQuery.first();

        let questions = [];
        if (quiz) {
            const questionQuery = new Parse.Query(QuestionV2);
            questionQuery.equalTo("quiz", quiz);
            questions = await questionQuery.find();
        }
        let milestone = {};

        const milestoneQuery = new Parse.Query('Milestone');
        milestoneQuery.equalTo('quiz', quiz);
        milestoneQuery.containedIn('requiredModules',[module])
        milestone = await milestoneQuery.first();
      
        var userProgress = null;
        if (milestone) {
          // console.log('milestone',milestone);
            const UserProgressQuery = new Parse.Query('UserProgress');
            UserProgressQuery.equalTo('course', course);
            UserProgressQuery.equalTo('user', USER);
            UserProgressQuery.equalTo('milestonesAchieved', milestone);
            userProgress = await UserProgressQuery.first();
            
        }

        return {
            module: module.toJSON(),
            quiz: quiz ? quiz.toJSON() : null,
            questions: questions.map(q => q.toJSON()),
            milestone: milestone ? milestone.toJSON() : null,
            userProgress: userProgress,
            isCompleted: userProgress ? true : false

        };
    }));
    //Retrive UserProgress


    // Retrieve milestones
    const Milestone = Parse.Object.extend("Milestone");
    const milestoneQuery = new Parse.Query(Milestone);
    milestoneQuery.equalTo("course", course);
    const milestones = await milestoneQuery.find();

    return {
        code: 200,
        status: true,
        message: '',
        data: {
            courseId: course.id,
            title: course.get('title'),
            description: course.get('description'),
            modules: moduleDetails.map((m) => ({
                'id': m['module']['objectId'],
                'order': m['module']['order'],
                'title': m['module']['title'],
                'content': m['module']['content'],
                'quiz': {
                    'question': m['questions'].map((ques) => ({
                        'ques': ques.id,
                        'text': ques['text'],
                        'options': ques['options'],
                        'correctAnswer': ques['correctAnswer']
                    })
                    )
                },

                'milestone': m['milestone'] ? {
                    id: m['milestone']['objectId'],
                    title: m['milestone']['title'],
                    description: m['milestone']['description'],
                    rewardPoints: m['milestone']['rewardPoints'],
                    requiredModules: m['milestone']['requiredModules'].map((req) => ({
                        requiredModuleId: req.id
                    }))
                } : null,
                'isCompleted': m['isCompleted'] ?? false,
              userProgress:m['userProgress']
            })
            ),
            // mileStones: milestones
            milestones: milestones.map((m) => ({
                id: m.id,
                title: m.get('title'),
                description: m.get('description'),
                rewardPoints: m.get('rewardPoints'),
                requiredModules: m.get('requiredModules').map((req) => ({
                    requiredModuleId: req.id
                }))
            }))
        }
    };
};
module.exports = {
    getCourseDetails
}