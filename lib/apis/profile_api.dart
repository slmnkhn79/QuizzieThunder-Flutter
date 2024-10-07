import 'package:dio/dio.dart';

import '../models/profile_screen_response_model.dart';
import '../utils/dio_client.dart';

class ProfileApi {
  Future<ProfileScreenResponseModel> getProfileScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/profile",options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));
      return ProfileScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
