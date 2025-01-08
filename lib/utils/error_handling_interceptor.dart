import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

import '../models/api_error_response_model.dart';
import 'app_utils.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class ErrorHandingInterceptor extends Interceptor {
  final localStorage = GetStorage();
  var _isErrorCodeHandled = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (localStorage.read(KEY_IS_API_ERROR_HANDLE) == null) {
      _isErrorCodeHandled = false;
    } else {
      _isErrorCodeHandled = true;
    }
    // print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    // print(err.toString());

    if ((!_isErrorCodeHandled && err.response?.statusCode == 401) ||
        err.response?.statusCode == 400 ||
        err.response?.statusCode == 404) {
      _isErrorCodeHandled = true;
      await localStorage.write(KEY_IS_API_ERROR_HANDLE, _isErrorCodeHandled);
      // Redirecting to sign in screen if token expires
      print("interceptor----");
      // AppUtils.showSnackBar("Session Expired! Please login again",
      //     status: MessageStatus.ERROR);
      Get.defaultDialog(
        navigatorKey: GlobalKey(debugLabel: "dialog"),
        title: "Error",
        content: Text("Some error occured"),
        confirm: MaterialButton(
          onPressed: () {
            Get.back(closeOverlays: true);
            AppUtils.logout();
          },
          child: Text("OK"),
        ),
      );
      // Get.closeAllSnackbars();
    } else {
      if (!_isErrorCodeHandled) {
        // print(
        // "Error = ${ApiErrorResponseModel.fromJson(err.response?.data).message}");
        // "Error = ${ApiErrorResponseModel.fromJson(err.response?.data).error}");

        AppUtils.showSnackBar(
            "${ApiErrorResponseModel.fromJson(err.response?.data).error}",
            status: MessageStatus.ERROR);
        //   Get.defaultDialog(
        //   title: "Hello",
        //   content: Text(err.response!.statusMessage!),
        //   confirm: MaterialButton(
        //     onPressed: () =>{ Get.back(closeOverlays: true)},
        //     child: Text("OK"),
        //   ),
        // );
      }
    }
    print("interceptor++++");
    super.onError(err, handler);
  }
}
