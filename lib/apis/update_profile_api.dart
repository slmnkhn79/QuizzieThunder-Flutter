import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../models/all_avatar_response_model.dart';
import '../models/update_profile_post_body_model.dart';
import '../models/update_profile_response_model.dart';
import '../models/user_profile_response_model.dart';
import '../utils/dio_client.dart';

class UpdateProfileApi {
  Future<UserProfileResponseModel> getUserProfile(
      {required String userId}) async {
    try {
      final response = await DioClient.getDioInstance().post("/profile",
      data: {"_id": GetStorage().read(KEY_USER_DATA)['result']['_id']});
      return UserProfileResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateProfileResponseModel> updateProfile(
      {required UpdateProfilePostBodyModel updateProfilePostBodyModel,
      required String userId}) async {
    try {
      final response = await DioClient.getDioInstance().post(
          "/updateProfile",
          data: updateProfilePostBodyModel.toJson());
      return UpdateProfileResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return UpdateProfileResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": "Please contact adminstrator",
        "updatedUser": null
      });
    }
  }

  Future<AllAvatarResponseModel> getAllAvatars() async {
    try {
      final response = await DioClient.getDioInstance().post("/getAllAvatars");
      return AllAvatarResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
