import 'package:quizzie_thunder/models/courseV2_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class CourseDetailsApiService {
  Future<Coursev2ResponseModel> getCourseDetails({required String courseId}) async {
    try {
      final response = await DioClient.getDioInstance().post("/getCourseDetails",data:{
        "courseId":courseId
      });
      return Coursev2ResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return Coursev2ResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No books found",
        "courses": []
      });
    }
  }
}