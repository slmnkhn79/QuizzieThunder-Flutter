import '../models/quiz_question_response_model.dart';
import '../utils/dio_client.dart';

class QuizQuestionApi {
  Future<QuizQuestionResponseModel> getQuizQuestionList(
      {required String? quizId}) async {
    try {
      final response = await DioClient.getDioInstance()
          // .post("question/$quizId/questions");
          .post("/questions",data: {"quizId":quizId});
      return QuizQuestionResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
