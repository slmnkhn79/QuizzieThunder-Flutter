import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotPasswordController =
        Get.find<ForgotPasswordController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          title: Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => forgotPasswordController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Please enter your email to reset your password",
                        style: TextStyle(
                            fontSize: 14, color: ThemeColor.textPrimary),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeColor.textPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller:
                            forgotPasswordController.phoneNumberController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: ThemeColor.black, fontSize: 14),
                        decoration: InputDecoration(
                          counterText: '',
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            size: 18,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                              fontSize: 14, color: ThemeColor.grey_500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: ThemeColor.white,
                        ),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              forgotPasswordController.forgotPassword();
                            },
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: ThemeColor.primaryDark,
                            ),
                            child: Text("Next",
                                style: TextStyle(color: ThemeColor.white)),
                          )),
                    ]))));
  }
}
