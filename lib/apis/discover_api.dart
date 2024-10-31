import 'package:dio/dio.dart';

import '../models/discover_screen_response_model.dart';
import '../utils/dio_client.dart';

class DiscoverApi {
  Future<DiscoverScreenResponseModel> getDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/discover");
      return DiscoverScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
