import 'package:quizzie_thunder/models/quiz_detail_response_model.dart';

import '../utils/dio_client.dart';

class QuizDetailApi {
  Future<QuizDetailResponseModel> getQuizDetail(
      {required String? quizId, required String? userId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/getQuizDetail", data: {"quizId": quizId, "userId": userId});
      return QuizDetailResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return QuizDetailResponseModel.fromJson({
        "code": 400,
        "status": false,
        "quizDetail": null,
        "message": " Something went wrong"
      });
    }
  }
}
