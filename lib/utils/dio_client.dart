import 'package:dio/dio.dart';

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
      ..options.headers["X-Parse-Application-Id"] = "myappID"

      // ..options.headers["Authorization"] = GetStorage().read(KEY_USER_DATA) ==
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
      ..options.headers["X-Parse-Application-Id"] = "myappID"
      
      // ..options.headers["Authorization"] = GetStorage().read(KEY_USER_DATA) ==
      //         null
      //     ? ""
      //     : "Bearer ${(SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token}"

      ..interceptors.add(ErrorHandingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
  static Dio getDioInstanceWithDefaultUrl() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL_DEFAULT,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "application/json"
      ..options.headers["X-Parse-Application-Id"] = "myappID"
      
      // ..options.headers["Authorization"] = GetStorage().read(KEY_USER_DATA) ==
      //         null
      //     ? ""
      //     : "Bearer ${(SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token}"

      ..interceptors.add(ErrorHandingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
}
