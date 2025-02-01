import 'package:quizzie_thunder/models/all_books_response_model.dart';
import 'package:quizzie_thunder/models/all_course_content_model.dart';
import 'package:quizzie_thunder/models/book_response_model.dart';
import 'package:quizzie_thunder/models/couse_content_response_model.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class CourseContentAPI {
  Future<AllCourseContentResponseModel> getAllCourses() async {
    try {
      final response = await DioClient.getDioInstance().post("/allCourses");
      return AllCourseContentResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return AllCourseContentResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No books found",
        "courses": []
      });
    }
  }

  Future<CourseContentResponseModel> getcourseById({required String courseId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/courseById", data: {'courseId': courseId});
      return CourseContentResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return CourseContentResponseModel.fromJson({
        "code": 400,
        "status": true,
        "message": "No books found",
        "course": {}
      });
    }
  }
}
