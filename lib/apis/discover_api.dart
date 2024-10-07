import 'package:dio/dio.dart';

import '../models/discover_screen_response_model.dart';
import '../utils/dio_client.dart';

class DiscoverApi {
  Future<DiscoverScreenResponseModel> getDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/discover",options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));
      return DiscoverScreenResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
