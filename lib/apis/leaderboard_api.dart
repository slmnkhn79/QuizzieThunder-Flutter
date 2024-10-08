import 'package:dio/dio.dart';

import '../models/leaderboard_screen_response_model.dart';
import '../utils/dio_client.dart';

class LeaderboardApi {
  Future<LeaderboardScreenResponseModel> getLeaderboardScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/leaderboard", options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));
      return LeaderboardScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
