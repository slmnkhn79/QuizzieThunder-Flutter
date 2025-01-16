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

    if ((!_isErrorCodeHandled &&
        (err.response?.statusCode == 401 || err.response?.statusCode == 400))) {
      _isErrorCodeHandled = true;
      await localStorage.write(KEY_IS_API_ERROR_HANDLE, _isErrorCodeHandled);
      Get.dialog(
      AlertDialog(
        title: Text('Error'),
        content: Text("Session Expired! Please login again"),
        actions: [
          TextButton(
            onPressed: () {
             AppUtils.logout(); 
            },
            child: Text('Logout!'),
          ),
        ],
      ),
    );
      // AppUtils.showSnackBar("Session Expired! Please login again",
      //     status: MessageStatus.ERROR);
      //     // Get.closeAllSnackbars();
      // AppUtils.logout();
    } else {
      if (!_isErrorCodeHandled) {
        AppUtils.showSnackBar(
            "${ApiErrorResponseModel.fromJson(err.response?.data).error}",
            status: MessageStatus.ERROR);
      }
    }
    super.onError(err, handler);
  }
}
