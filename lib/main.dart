import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzie_thunder/apis/testing_encryption_api.dart';
import 'package:quizzie_thunder/logic/common/app_logic.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'theme/colors_theme.dart';

void main() async {
  await GetStorage.init();
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  await appLogic.bootstrap();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin{
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Quizzie Thunder App',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ).copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: ThemeColor.primaryDark)),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
AppLogic get appLogic => GetIt.I.get<AppLogic>();
