import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/public_profile_screen_response_model.dart';

import '../models/profile_screen_response_model.dart';
import '../utils/constants.dart';
import '../utils/dio_client.dart';

class ProfileApi {
  Future<ProfileScreenResponseModel> getProfileScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/profile", data: {'_id':GetStorage().read(KEY_USER_DATA)['result']['_id']});
      return ProfileScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
     return ProfileScreenResponseModel.fromJson( {
        "code": 500,
        "message": "Something went wrong",
        "status": false,
        "user_detail": null,
        "stats": null,
        "other_attributes": null
      });
    }
  }

  Future<PublicProfileScreenResponseModel> getPublicProfileScreenDetails(String userId) async {
    try {
      final response = await DioClient.getDioInstance().post("/publicProfile", data: {'_id':GetStorage().read(KEY_USER_DATA)['result']['_id'], 'userId': userId});
      return PublicProfileScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      return PublicProfileScreenResponseModel.fromJson( {
        "code": 500,
        "message": "Something went wrong",
        "status": false,
        "user_detail": null,
        "stats": null,
        "other_attributes": null
      });
    }
  }
}
