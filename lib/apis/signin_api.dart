import '../models/signin_post_body_model.dart';
import '../models/signin_response_model.dart';
import '../utils/dio_client.dart';

class SignInApi {
  Future<SignInResponseModel> signIn(
      {required SignInPostBodyModel signInPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("/login", data: signInPostBodyModel.toJson());
      return SignInResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return SignInResponseModel.fromJson({
        "code": 400,
        "status": false,
        "message": e.toString(),
        "result": false
      });
    }
  }
}
