
import '../models/leaderboard_screen_response_model.dart';
import '../utils/dio_client.dart';

class LeaderboardApi {
  Future<LeaderboardScreenResponseModel> getLeaderboardScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/leaderboard");
      return LeaderboardScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
     return  LeaderboardScreenResponseModel.fromJson({
        "code": 500,
        "status": false,
        "message": "Something went wrong",
        "leaderboard": null,
        "allTimeLeaderboard": [],
        "weeklyLeaderboard": []
      });
    }
  }
}
