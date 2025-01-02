import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';
import 'package:quizzie_thunder/models/post_response_model.dart';
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
      // rethrow;
      // return 
      return FeedScreenResponseModel.fromJson({
        "code": 400,
        "message" : "Failed",
        "status": false,
        "posts":[]
      });
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
      return PostDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return 
      PostDetailsResponseModel.fromJson({
        "code": 200,
        "status": true,
        "message": "No data fetched",
        "post": [],
      });
    }
  }

  Future<dynamic> dislikePostById(
      {required String postId}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/dislikePostById", data: {
        'postId':postId,
        'userId': GetStorage().read(KEY_USER_DATA)['result']['_id']
      });

      // return FeedScreenResponseModel.fromJson(response.data['result']);
      return PostDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return PostDetailsResponseModel.fromJson( {
        "code":  400,
        "status": false,
        "message": "Some error occured",
        "post": null
      });
    }
  }
}
