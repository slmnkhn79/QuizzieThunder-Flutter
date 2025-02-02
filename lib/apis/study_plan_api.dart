import 'package:quizzie_thunder/models/all_study_plan_response_model.dart';
import 'package:quizzie_thunder/models/study_plan_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class StudyPlanApi {
  Future<AllStudyPlanResponseModel> getAllStudyPlans({String? searchTermId}) async {
    try {
      final response = await DioClient.getDioInstance().post("/studyplans",data:{
        "searchTermId": searchTermId
      });
      return AllStudyPlanResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return AllStudyPlanResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": e.toString(),
        "plans": []
      });
    }
  }

  Future<StudyPlanResponseModel> getStudyPlanById(
      {required String studyPlanId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/studyPlanById", data: {'studyPlanId': studyPlanId});
      return StudyPlanResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return StudyPlanResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": e.toString(),
        "plan": null
      });
    }
  }
}
