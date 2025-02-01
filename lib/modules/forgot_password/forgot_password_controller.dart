import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/forgot_password_api.dart';
import '../../models/forgot_password_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordApi forgotPasswordApi = ForgotPasswordApi();

  final GlobalKey<FormState> forgotPasswodFormKey =
      GlobalKey<FormState>(debugLabel: '__forgotPasswodFormKey__');

  final phoneNumberController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  bool _forgotPasswordFormValidation() {
    if (phoneNumberController.text.isEmpty) {
      errorMessage = "Email address should not be empty";
      return false;
    } else if (!EMAIL_REGEX
        .hasMatch(phoneNumberController.text.toString().trim())) {
      errorMessage = "Enter a valid email address";
      return false;
    } else {
      return true;
    }
  }

  void forgotPassword() async {
    if (_forgotPasswordFormValidation()) {
      ForgotPasswordPostBodyModel forgotPasswordPostBodyModel =
          ForgotPasswordPostBodyModel(email: phoneNumberController.text);
      isLoading.value = true;
      var response = await forgotPasswordApi.forgotPassword(
          forgotPasswordPostBodyModel: forgotPasswordPostBodyModel);
      if (response.code == 200) {
        isLoading.value = false;

        Get.back();
        AppUtils.showSnackBar(response.message ?? "Success",
            status: MessageStatus.SUCCESS);
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Error",
            status: MessageStatus.ERROR);
      }
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
