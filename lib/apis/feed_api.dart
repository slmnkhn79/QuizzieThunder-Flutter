import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../utils/dio_client.dart';

class FeedApi {
  Future<FeedScreenResponseModel> getFeedScreenDetails(
      {required int skip}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/feed", data: {
        'skip': skip,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      return FeedScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> likePostById(
      {required String postId}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/likePostById", data: {
        'postId':postId,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      // return FeedScreenResponseModel.fromJson(response.data['result']);
      return response.data['result'];
    } catch (e) {
      rethrow;
    }
  }
}
