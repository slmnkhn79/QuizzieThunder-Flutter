import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../models/profile_screen_response_model.dart';
import '../utils/constants.dart';
import '../utils/dio_client.dart';

class ProfileApi {
  Future<ProfileScreenResponseModel> getProfileScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/profile", data: {'_id':GetStorage().read(KEY_USER_DATA)['result']['_id']});
      return ProfileScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
