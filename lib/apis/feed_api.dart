import 'package:dio/dio.dart';
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';

import '../models/home_screen_response_model.dart';
import '../utils/dio_client.dart';

class FeedApi {
  Future<FeedScreenResponseModel> getFeedScreenDetails() async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/feed");

      return FeedScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
