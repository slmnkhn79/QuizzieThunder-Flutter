import '../models/verify_otp_post_body_model.dart';
import '../models/verify_otp_response_model.dart';

class VerifyOtpApi {
  Future<VerifyOtpResponseModel> verifyOtp(
      {required VerifyOtpPostBodyModel verifyOtpPostBodyModel}) async {
    try {
      // final response = await DioClient.getDioInstance().post(
      //     "api/user/verify/mobile-otp",
          // data: verifyOtpPostBodyModel.toJson());
      // return VerifyOtpResponseModel.fromJson(response.data);
      return VerifyOtpResponseModel.fromJson({"code":200,"status":true,"message":"success"});
    } catch (e) {
      rethrow;
    }
  }
}
