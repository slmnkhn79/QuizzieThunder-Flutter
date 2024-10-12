import 'package:dio/dio.dart';
import 'package:quizzie_thunder/models/school_leaderboard_screen_response_model.dart';

import '../models/leaderboard_screen_response_model.dart';
import '../utils/dio_client.dart';

class SchoolLeaderboardApi {
  Future<SchoolLeaderboardScreenResponseModel> getSchoolLeaderboardScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/schoolLeaderboard", options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));
      return SchoolLeaderboardScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
