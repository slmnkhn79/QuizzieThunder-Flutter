import 'package:quizzie_thunder/models/generic_response_model.dart';
import 'package:quizzie_thunder/models/quiz_submission_response_model.dart';

import '../models/all_quiz_response_model.dart';
import '../utils/dio_client.dart';

class QuizzesApi {
  Future<AllQuizResponseModel> getAllQuizList() async {
    try {
      final response = await DioClient.getDioInstance().post("/allQuiz");
      return AllQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return AllQuizResponseModel(
          status: false, code: 400, count: 0, quizzes: []);
    }
  }

  Future<AllQuizResponseModel> getAllQuizOfSpeacificCategory(
      {required String quizCategoryId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/quizByCatId", data: {'quizCatId': quizCategoryId});
      return AllQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return AllQuizResponseModel.fromJson(
          {"status": false, "code": 400, "count": 0, "quizzes": []});
    }
  }

  Future<QuizSubmissionResponseModel> getAllQuizSubmissionById(
      {required String quizId, required int skip}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/quizSubmissionById", data: {'quizId': quizId, "skip": skip});
      return QuizSubmissionResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return QuizSubmissionResponseModel.fromJson(
          {"code": 500, "status": false, "message": e.toString(), "data": {}});
    }
  }

  Future<GenericResponseModel> likeQuizSubmissionById(
      {required String photoId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/likeQuizPhotoById", data: {'photoId': photoId});
      return GenericResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return GenericResponseModel.fromJson(
          {"code": 500, "status": false, "message": e.toString(), "data": {}});
    }
  }

  Future<dynamic> dislikeQuizPhotoById({required String photoId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/dislikeQuizPhotoById", data: {'photoId': photoId});
      return GenericResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return GenericResponseModel.fromJson(
          {"code": 500, "status": false, "message": e.toString(), "data": {}});
    }
  }
}
