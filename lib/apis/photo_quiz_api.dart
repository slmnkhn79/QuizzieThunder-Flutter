import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/photo_quiz_response_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class PhotoQuizApi {
  Future<PhotoQuizResponseModel> getPhotoQuizDetails(String quizId) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/getPhotoQuizDetails", data: {"quizId": quizId});
      return PhotoQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return PhotoQuizResponseModel.fromJson({
       "code": 500,
        "status": false,
        "message": e.toString(),
        "data": {'hasAnswered': true, 'imageUrl': null}
      });
    }
  }

  Future<PhotoQuizResponseModel> uploadQuizImage(
      String data, String quizId) async {
    try {
      final response =
          await DioClient.getDioInstance().post("/uploadImage", data: {
        'quizId': quizId,
        'base64': data,
        'fileName':
            'image_${quizId}_${GetStorage().read(KEY_USER_DATA)['result']['_id']}.jpg'
      });
      return PhotoQuizResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return PhotoQuizResponseModel.fromJson({
        "code": 500,
        "status": false,
        "message": e.toString(),
        data: {'hasAnswered': true, 'imageUrl': null}
      });
    }
  }
}
