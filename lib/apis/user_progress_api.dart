import 'package:quizzie_thunder/models/user_progress_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class UserProgressApi {
  Future<UserProgressResponseModel> createUserProgress(String courseId, String moduleId, String milestoneId ) async {
    try {
      final response = await DioClient.getDioInstance().post("/createUserProgress",
      data:
      {
        'courseId':courseId,
        'moduleId': moduleId,
        'milestoneId':milestoneId
      });
      return UserProgressResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return UserProgressResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No data found",
      });
    }
  }
  Future<UserProgressResponseModel> getUserProgress(String courseId) async {
    try {
      final response = await DioClient.getDioInstance().post("/getUserProgress",
      data:{
        'courseId':courseId
      });
      return UserProgressResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return UserProgressResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No data found",
      });
    }
  }
  Future<UserProgressResponseModel> updateUserProgress(UserProgressResponseModel userProgressResponseModel) async {
    try {
      final response = await DioClient.getDioInstance().post("/updateUserProgress",data:
        userProgressResponseModel.toJson()
      );
      return UserProgressResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return UserProgressResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No data found",
      });
    }
  }
}
