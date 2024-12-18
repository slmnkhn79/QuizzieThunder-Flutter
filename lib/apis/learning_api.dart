import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/learning_path_by_id_resonse_model.dart';
import 'package:quizzie_thunder/models/learning_paths_resonse_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';

class LearningPathApi {
  Future<LearningPathsResponseModel> getLearningPaths(
      ) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/learningpaths", data: {
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      return LearningPathsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<LearningPathByIdResponseModel> getLearningPathById(String learningId
      ) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/learningPathById", data: {
        'learningPathById': learningId,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      return LearningPathByIdResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}