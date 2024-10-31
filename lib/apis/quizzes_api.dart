import '../models/all_quiz_response_model.dart';
import '../utils/dio_client.dart';

class QuizzesApi {
  Future<AllQuizResponseModel> getAllQuizList() async {
    try {
      final response =
          await DioClient.getDioInstance().post("/allQuiz");
      return AllQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<AllQuizResponseModel> getAllQuizOfSpeacificCategory(
      {required String quizCategoryId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/quizByCatId",data: {'quizCatId':quizCategoryId});
      return AllQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
