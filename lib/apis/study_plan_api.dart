import 'package:quizzie_thunder/models/all_study_plan_response_model.dart';
import 'package:quizzie_thunder/models/study_plan_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class StudyPlanApi {
  Future<AllStudyPlanResponseModel> getAllStudyPlans() async {
    try {
      final response = await DioClient.getDioInstance().post("/studyplans");
      return AllStudyPlanResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<StudyPlanResponseModel> getStudyPlanById(
      {required String studyPlanId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/studyPlanById", data: {'studyPlanId': studyPlanId});
      return StudyPlanResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
