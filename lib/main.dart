import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'theme/colors_theme.dart';


void main() async {
  await GetStorage.init();
  // await Parse().initialize(keyApplicationId, BASE_URL,
  //     clientKey: keyClientKey, debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var dimensions = {'gender': 'm', 'source': 'web', 'dayType': 'weekend'};
    // Parse.Analytics.track('signup', dimensions);
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
