import 'package:dio/dio.dart';

import '../models/home_screen_response_model.dart';
import '../utils/dio_client.dart';

class HomeApi {
  Future<HomeScreenResponseModel> getHomeScreenDetails() async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/home",options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));

      return HomeScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
