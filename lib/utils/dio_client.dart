import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/models/signin_response_model.dart';

import 'api_logging_interceptor.dart';
import 'constants.dart';
import 'error_handling_interceptor.dart';

class DioClient {
  static Dio getDioInstance() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "application/json"
      ..options.headers["X-Parse-Application-Id"] = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE"
      ..options.headers["X-Parse-REST-API-Key"] = "Zhql5mJQna2oJ7ztrmSCFyDtVQ4uxmbMYtMjfe9Q"
      ..options.headers["X-Parse-Session-Token"] = GetStorage().read(KEY_USER_DATA) ==
              null
          ? ""
          : (SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token
          // :""


      // ..options.headers["Authorization"] = 
      //GetStorage().read(KEY_USER_DATA) ==
      //         null
      //     ? ""
      //     : "Bearer ${(SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token}"

      ..interceptors.add(ErrorHandingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
  static Dio getDioInstanceFile() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL_DEFAULT,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "multipart/form-data"
      // ..options.headers["X-Parse-Application-Id"] = "myappID"
      ..options.headers["X-Parse-Application-Id"] = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE"
      ..interceptors.add(ErrorHandingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }

  // static Dio getDioInstanceWithDefaultUrl() {
  //   var dio = Dio(BaseOptions(
  //     baseUrl: BASE_URL_DEFAULT,
  //     connectTimeout: Duration(minutes: 2),
  //     receiveTimeout: Duration(minutes: 1),
  //   ))
  //     ..options.headers["content-type"] = "application/json"
  //     // ..options.headers["X-Parse-Application-Id"] = "myappID"
  //     ..options.headers["X-Parse-Application-Id"] = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE"
      
  //     // ..options.headers["Authorization"] = GetStorage().read(KEY_USER_DATA) ==
  //     //         null
  //     //     ? ""
  //     //     : "Bearer ${(SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token}"

  //     ..interceptors.add(ErrorHandingInterceptor())
  //     ..interceptors.add(LoggingInterceptor());
  //   return dio;
  // }
}
