import '../models/forgot_password_post_body_model.dart';
import '../models/forgot_password_response_model.dart';
import '../utils/dio_client.dart';

class ForgotPasswordApi {
  Future<ForgotPasswordResponseModel> forgotPassword(
      {required ForgotPasswordPostBodyModel
          forgotPasswordPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().post(
          "/requestPasswordReset",
          data: forgotPasswordPostBodyModel.toJson());
      return ForgotPasswordResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
