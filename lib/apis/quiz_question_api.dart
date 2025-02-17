import 'package:quizzie_thunder/utils/app_utils.dart';

import '../models/quiz_question_response_model.dart';
import '../utils/dio_client.dart';

class QuizQuestionApi {
  Future<QuizQuestionResponseModel> getQuizQuestionList(
      {required String? quizId}) async {
    try {
      final response = await DioClient.getDioInstance()
          // .post("question/$quizId/questions");
          .post("/getQuizQuestion", data: {"quizId": quizId});
      return QuizQuestionResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return QuizQuestionResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": "No question found",
        "quiz": null,
        "questions": []
      });
    }
  }

  // Future<QuizQuestionResponseModel> postQuizQuestionList(
  //     {required String? quizId, required String? questionId,String? solution}) async {
  //   try {
  //     final response = await DioClient.getDioInstance()
  //         // .post("question/$quizId/questions");
  //         .post("/postQuizAnswer",data: {"quizId":quizId, "questionId":questionId, "sessinoToken":''
  //         // , solution:solution
  //         });
  //     return QuizQuestionResponseModel.fromJson(response.data['result']);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<dynamic> startQuiz({String? quizId}) async {
    try {
      final response = await DioClient.getDioInstance()
          // .post("question/$quizId/questions");
          .post("/startQuiz", data: {"quizId": quizId});
      return response.data['results'];
    } catch (e) {
      return {
        'code': 500,
        'status': false,
        'message': "Quiz Already Opened!",
      };
    }
  }
}
