import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import 'signin_controller.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController signinController = Get.find<SigninController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // key: SigninController.scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => signinController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        //  LayoutBuilder(
                        //   builder:
                        //       (BuildContext context, BoxConstraints constraints) {
                        //     double screenWidth = constraints.maxWidth;
                        //     double screenHeight = constraints.maxHeight;
                        //     return
                        Center(
                      child: SizedBox(
                        width: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello There 👋",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 44,
                            ),
                            Form(
                                key: SigninController.signinFormKey,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Username",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ThemeColor.textPrimary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: signinController
                                            .phoneNumberController,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            color: ThemeColor.black,
                                            fontSize: 14),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          prefixIcon: Icon(
                                            Icons.phone_outlined,
                                            size: 18,
                                          ),
                                          contentPadding: EdgeInsets.all(12),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: ThemeColor.grey_500),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          filled: true,
                                          fillColor: ThemeColor.white,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Password",
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
                                            signinController.passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: signinController
                                            .passwordInVisible.value,
                                        style: TextStyle(
                                            color: ThemeColor.black,
                                            fontSize: 14),
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock_outlined,
                                            size: 18,
                                          ),
                                          // suffixText: signinController
                                          //     .passwordInVisible.value
                                          //     .toString(),
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                signinController
                                                        .passwordInVisible.value
                                                    ? Icons.visibility_off
                                                    : Icons
                                                        .visibility, //change icon based on boolean value
                                              ),
                                              onPressed: () {
                                                print(signinController
                                                    .passwordInVisible.value);
                                           
                                                signinController
                                                    .updatePasswordVisibility();
                                              }),
                                          contentPadding: EdgeInsets.all(12),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: ThemeColor.grey_500),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          filled: true,
                                          fillColor: ThemeColor.white,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                      ),
                                    ])),
                          
                            SizedBox(
                              height: 16,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPasswordPage);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ThemeColor.accent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 44,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    signinController.login();
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    backgroundColor: ThemeColor.primaryDark,
                                  ),
                                  child: Text("Login",
                                      style:
                                          TextStyle(color: ThemeColor.white)),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: RichText(
                            //       text: TextSpan(
                            //           style: TextStyle(
                            //             fontSize: 14,
                            //           ),
                            //           children: [
                            //         TextSpan(
                            //           text: "Don't have the account yet? ",
                            //           style: TextStyle(
                            //             color: ThemeColor.grey,
                            //           ),
                            //         ),
                            //         TextSpan(
                            //             text: "Sign up",
                            //             style: TextStyle(
                            //                 color: ThemeColor.primary,
                            //                 fontWeight: FontWeight.bold),
                            //             recognizer: TapGestureRecognizer()
                            //               ..onTap =
                            //                   () => Get.toNamed(AppRoutes.signUpPage))
                            //       ])),
                            // ),
                            SizedBox(
                              height: 44,
                            ),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "By continuing, you agree to the ",
                                        style: TextStyle(
                                          color: ThemeColor.grey,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              "Terms of service & Privacy Policy",
                                          style: TextStyle(
                                              color: ThemeColor.black,
                                              fontWeight: FontWeight.bold)),
                                    ]))
                          ],
                        ),
                      ),
                    )
                    // },
                    // ),
                    ),
              )));
  }
}
