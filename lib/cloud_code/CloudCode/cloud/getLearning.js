 const getLearnings =  async (request) =>
 {
     const Books = new Parse.Object("Books");
  const Internship = new Parse.Object("InternshipWorkshop");
  const LearningPaths = new Parse.Object("LearningPaths");
  const MentorVideos = new Parse.Object("MentorVideos");
  const News = new Parse.Object("News");
  const StudyPlan = new Parse.Object("StudyPlan");
  const CoursePDF = new Parse.Object("CoursePDF")
   const CourseWithModule = new Parse.Object('Course');
   
   const booksQuery = new Parse.Query(Books);
    booksQuery.limit(5);

    const interQuery = new Parse.Query(Internship);
    interQuery.limit(5);

    const learningQuery = new Parse.Query(LearningPaths);
    learningQuery.limit(5);

    const mentorQuery = new Parse.Query(MentorVideos);
    mentorQuery.limit(5);

    const newsQuery = new Parse.Query(News);
    newsQuery.limit(5);

    const courseQuery = new Parse.Query(CoursePDF);
    courseQuery.include('standard')
    courseQuery.limit(5);

    const studyPlanQuery = new Parse.Query(StudyPlan);
    studyPlanQuery.limit(6);
    studyPlanQuery.includeAll();

    const coursesWithModules = new Parse.Query(CourseWithModule);
    coursesWithModules.limit(6);
    

    const books = await booksQuery.find();
    const internships = await interQuery.find();
    const learnings = await learningQuery.find();
    const mentorVideos = await mentorQuery.find();
    const news = await newsQuery.find();
    const studyPlans = await studyPlanQuery.find();
    const coursePdfs = await courseQuery.find();
   const coursesWithModule = await coursesWithModules.find(); 



    return {
      status: true,
      code: 200,
      message: "",
      data: {
        books: books.map((book) => {
          return {
            id: book.id,
            book_name: book.get('book_name'),
            book_publisher: book.get('book_publisher'),
            book_type: book.get('book_type'),
            book_category: book.get('book_category'),
            pdf_link: book.get('book_pdf_link'),
          }
        }),
        internships: internships.map((intern) => {
          id: intern.id
        }),
        learnings: learnings.map((learn) => {
          return {
            id: learn.id,
            "path_name": learn.get('path_name'),
            description: learn.get("description")
          }
        }),
        mentorVideos: mentorVideos.map((mentor) => {
          return {
            id: mentor.id,
            video_link: mentor.get("video_link"),
            title: mentor.get('title'),
            duration: mentor.get('duration'),
            thumbnail: mentor.get('thumbnail'),
            video_type: mentor.get('video_type')
          }
        }),
        news: news.map((e) => {
          return {
            id: e.id
          }
        }),
        studyPlan: studyPlans.map((plan) => {
          return {
            id: plan.id,
            plan_name: plan.get('plan_name'),
            plan_description: plan.get('plan_description'),
            pdf_link: plan.get('pdf_link'),
            plan_attributes: plan.get('plan_attributes'),
            standard: plan.get('standard').get('standard_name'),
            standard_name: plan.get('standard').get('standard_code')
          }
        }),
        courses: coursePdfs.map((pdf) => {
          return {
            id: pdf.id,
            topic_name: pdf.get('topic_name'),
            pdf_url: pdf.get('pdf_url'),
            // standard : {
            // id: pdf.get('standard').id,
            standard_name: pdf.get('standard').get('standard_name'),
            standard_code: pdf.get('standard').get('standard_code'),
            // },
            course_type: pdf.get('type')
          }
        }),
        courseWithModule: coursesWithModule.map((course) =>{
          return{
            id: course.id,
            title : course.get('title'),
          }
        })

      }
    }
 }
module.exports = {
  getLearnings
}