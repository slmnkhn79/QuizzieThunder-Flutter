
import 'package:quizzie_thunder/models/feed_screen_response_model.dart';

import '../utils/dio_client.dart';

class FeedApi {
  Future<FeedScreenResponseModel> getFeedScreenDetails({required int skip}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/feed", data: {'skip':skip, 'limit':1});

      return FeedScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
