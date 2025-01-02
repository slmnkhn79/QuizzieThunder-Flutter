
import '../models/home_screen_response_model.dart';
import '../utils/dio_client.dart';

class HomeApi {
  Future<HomeScreenResponseModel> getHomeScreenDetails() async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/home");

      return HomeScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return HomeScreenResponseModel.fromJson({
        "code": 500,
        "status": false,
        "message": "Something went wrong",
        "quizzes" : [],
        "mostPlayedQuiz" : [],
        "topPicQuiz" : [],
        "weekTopRank" : [],
        "quizCategories" : [],
      });
    }
  }
}
