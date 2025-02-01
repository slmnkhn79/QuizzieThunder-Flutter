const {validateUser} = require('./userValidation.js');
Parse.Cloud.define('getSchool', async (request) => {
  const { schoolId } = request.params;

  //implement logic in case shcool id is null
  if (!schoolId) {
    throw new Parse.Error(Parse.Error.INVALID_QUERY, "schoolId");
  }
  try {
    await validateUser(request);
    const School = new Parse.Query("Schools");
    // School.equalTo("objectId", schoolId);
    const school = await School.get(schoolId);

    return {
      code: 200,
      status: true,
      message: "success",
      school:
      {
        _id: school.id,
        name: school.get('name'),
        // achivements: [],
        //   school.get('achievements').map((e) => {
        //   return {
        //     "achivement_text": e['achivement_text'],
        //     "achivement_image": e['achivement_image']
        //   }
        // }),
        city: school.get('city'),
        district: school.get('district'),
        state: school.get('state'),
        footerImageUrl: school.get('some_other_events_image'),
        // coursesOffered:
        //   school.get('courses_offered').map((e) => {
        //   return {
        //     courseName: e['course_name'],
        //     successPct: e['success_pct'],
        //     totalStudents: e['total_students_enrolled'],
        //   }
        // }),
        type: school.get('type'),
        description: school.get('description'),
        headerImageUrl: school.get('final_image'),
        numOfStudents: school.get('number_of_students'),
        facultyRatio: school.get('faculty_ratio'),
        attributes: school.get('attributes'),
        photo1: school.get('photo1'),
        photo2: school.get('photo2'),
        photo3: school.get('photo3'),
        pullQuote1Top: school.get('text_artifacts')['pullQuote1Top'],
        pullQuote1Bottom: school.get('text_artifacts')['pullQuote1Bottom'],
        pullQuote2: school.get('text_artifacts')['pullQuote2'],
        historyInfo2: school.get('text_artifacts')['historyInfo2'],
        constructionInfo1: school.get('text_artifacts')['constructionInfo1'],
        callout2: school.get('text_artifacts')['callout2'],
        constructionInfo2: school.get('text_artifacts')['constructionInfo2'],
        locationInfo1: school.get('text_artifacts')['locationInfo1'],
        locationInfo2: school.get('text_artifacts')['locationInfo2'],
        startYear: school.get('text_artifacts')['startYear'],
        endYear: school.get('text_artifacts')['endYear'],
        videoCaption: school.get('text_artifacts')['videoCaption'],
        videoId: school.get('text_artifacts')['videoId'],
      }
    };
  } catch (error) {
    // throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, error);
    return {
      code: 500,
      status: false,
      message: error.toString(),
      school: {}
    };
  }
});
