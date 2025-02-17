import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apis/signin_api.dart';
import '../../models/signin_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class SigninController extends GetxController {
  SignInApi signInApi = SignInApi();

  final localStorage = GetStorage();

  static final GlobalKey<FormState> signinFormKey =
      GlobalKey<FormState>(debugLabel: '__signinFormKey__');

      // static final scaffoldKey = GlobalKey<ScaffoldState>();
      

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  void updatePasswordVisibility() {
    passwordInVisible.value = !passwordInVisible.value;
  }

  bool _loginFormValidation() {
    if (phoneNumberController.text.isEmpty) {
      errorMessage = "Phone number should not be empty";
      return false;
    } else if (phoneNumberController.text.toString().length < 8) {
      errorMessage = "Enter valid phone number";
      return false;
    } else if (passwordController.text.isEmpty) {
      errorMessage = "Password should not be empty";
      return false;
    } else {
      return true;
    }
  }

  void login() async {
    try {
      if (_loginFormValidation()) {
        SignInPostBodyModel signInPostBodyModel = SignInPostBodyModel(
            username: phoneNumberController.text,
            password: passwordController.text);
        isLoading.value = true;
        var response =
            await signInApi.signIn(signInPostBodyModel: signInPostBodyModel);
        print(response);
        if (response.code == 200) {
          GetStorage().remove(KEY_IS_API_ERROR_HANDLE);
          localStorage.write(KEY_USER_DATA, response.toJson());
          isLoading.value = false;
          Get.offAllNamed(AppRoutes.dashboardPage);
        } else if (response.code == 210) {
          isLoading.value = false;
          Get.toNamed(AppRoutes.verifyOtpPage,
              arguments: {ARG_PHONE_NUMBER: phoneNumberController.text});
        } else {
          isLoading.value = false;
          AppUtils.showSnackBar(response.message ?? "Error",
              status: MessageStatus.ERROR);
        }
      } else {
        AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
      }
    } catch (error) {
      isLoading.value = false;
      // AppUtils.showSnackBar("Error" ?? "Error",
      //     status: MessageStatus.ERROR);
    }
  }
}
