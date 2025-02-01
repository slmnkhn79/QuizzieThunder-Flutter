import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/signin_response_model.dart';
import '../routes/app_routes.dart';
import '../theme/colors_theme.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Error", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch (status) {
      case MessageStatus.SUCCESS:
        backgroundColor = ThemeColor.green;
        break;
      case MessageStatus.ERROR:
        backgroundColor = ThemeColor.red;
        break;
      case MessageStatus.WARNING:
        backgroundColor = ThemeColor.orange;
        break;
      case MessageStatus.NORMAL:
      default:
        backgroundColor = ThemeColor.black;
        break;
    }

    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: ThemeColor.white,
      backgroundColor: backgroundColor,
    );
  }

  static SignInResponseModel loginUserDetail() {
    return SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)));
  }

  static String getNameInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = names.length > 2 ? 2 : names.length;
    for (int i = 0; i < numWords; i++) {
      String initial = names[i][0].toUpperCase();
      initials += initial;
    }
    return initials;
  }

  String convertBase64(String data) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(data);
    return encoded;
  }

  String convertBase64ToString(String base64EncodedData) {
    List<int> bytes = base64.decode(base64EncodedData);

    // Converting bytes to string
    String decodedString = utf8.decode(bytes);
    return decodedString;
  }

  // static Future<Map<String, String>> getAppDetails() async {
  //   final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //   final version = packageInfo.version;
  //   final buildNumber = packageInfo.buildNumber;
  //   final buildSignature = packageInfo.buildSignature;
  //   final appName = packageInfo.appName;
  //   final packageName = packageInfo.packageName;
  //   final installerStore = packageInfo.installerStore;

  //   print("App version = $version");
  //   return {"version": version, "buildNumber": buildNumber};
  // }

  static Color getRandomAvatarBgColor() {
    final List<Color> randomColors = [
      Color(0xffC9F2E9),
      Color(0xffC4D0FB),
      Color(0xffBF83FF),
      Color(0xffFFD6DD),
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static Color getRandomCardBgColor() {
    final List<Color> randomColors = [
      Color(0xff8891AA),
      Color(0xff88E2CE),
      Color(0xff9087E5),
      Color(0xffF0A2D4),
      Color(0xffF7D37A),
      Color(0xff9DE2B8),
      Color(0xffF5928B),
      Color(0xffA6C1E7),
      Color(0xffFFB478),
      Color(0xffC9A7C1),
      Color(0xff6DD7D3)
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static List<Color> getRandomGradient(int? randomValue) {
    final List<List<Color>> randomColors = [
      [Color(0xFF3A86FF), Color(0xFF7FDBFF), Color(0xFFF4F4F9)],
      [Color(0xFF367588), Color(0xFFCAD2C5), Color(0xFFF4F4F9)],
      // [Color(0xFF367588),
      // Color(0xFF264653),
      // Color(0xFFE9C46A)
      // ],
      [Color(0xFF5E60CE), Color(0xFF48BFE3), Color(0xFFD9F2EB)],
      [Color(0xFF6C757D), Color(0xFF95D5B2), Color(0xFFE9ECEF)],
      [Color(0xFF08B0AB), Color(0xFFFF6854), Color(0xFFE9C46A)],
      [Color(0xFF3A86FF), Color(0xFF7FDBFF), Color(0xFFF4F4F9)]
    ];
    final random = Random();
    return randomColors[
        randomValue! % 6 ?? random.nextInt(randomColors.length)];
  }

  static void logout() async {
    await GetStorage().remove(KEY_USER_DATA);
    Get.offAllNamed(AppRoutes.signInPage);
  }

  static String getGreeting() {
    var now = DateTime.now();
    if (now.hour >= 0 && now.hour < 12) {
      return "GOOD MORNING";
    } else if (now.hour >= 12 && now.hour < 17) {
      return "GOOD AFTERNOON";
    } else {
      return "GOOD EVENING";
    }
  }

  static Color getRandomShadeOfBlack() {
    final Random random = Random();

    // Generates shades of black by using RGB values close to 0.
    int shade = random.nextInt(56); // Value between 0 and 55

    return Color.fromARGB(255, shade, shade, shade);
  }

  static Future<void> shareImageFromApi({
    required String imageUrl,
    required String text,
    required String subject,
  }) async {
    // Download the image from the API link.
    final response = await http.get(Uri.parse(imageUrl));

    // Get the temporary directory on the device.
    final tempDir = await getTemporaryDirectory();

    // Create a file with a unique name in the temporary directory.
    const tempFileName = 'image.png';
    final tempFile = File('${tempDir.path}/$tempFileName');

    // Write the downloaded image data to the temporary file.
    await tempFile.writeAsBytes(response.bodyBytes);

    // Share the temporary image file using Share.shareXFiles.
    await Share.shareXFiles([XFile(tempFile.path)],
        subject: subject, text: text);

    // Delete the temporary image file.
    await tempFile.delete();
  }

  static Color getGradientFirstColor() {
    final Random random = Random();
    List<Color> materialColors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ];

    // Select a random color from the list
    return materialColors[random.nextInt(materialColors.length)];
  }

  static Color getRandomColor() {
    final Random random = Random();

    // Ensure green and blue are dominant for a cooler color.
    int green = random.nextInt(156) + 100; // random between 100 and 255
    int blue = random.nextInt(156) + 100; // random between 100 and 255
    int red = random.nextInt(100); // random between 0 and 99

    return Color.fromARGB(
      255, // Fully opaque
      red,
      green,
      blue,
    );
  }

  static Color getRandomShadeOfWhite() {
    final Random random = Random();

    // Generates shades of white by using RGB values close to 255.
    int shade = random.nextInt(56) + 200; // Value between 200 and 255

    return Color.fromARGB(255, shade, shade, shade);
  }

  static Color getRandomMaterialColor() {
    final Random random = Random();

    // List of Material colors (you can add more if needed)
    List<Color> materialColors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
    ];

    // Select a random color from the list
    return materialColors[random.nextInt(materialColors.length)];
  }

  static LinearGradient getRandomLightGradient() {
    return LinearGradient(
      colors: [
        getRandomColor(),
        getRandomColor(),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  static Future<void> downloadImage(String url, String fileName) async {
    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/$fileName';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        showSnackBar("Image saved to disk",
            title: "Success", status: MessageStatus.SUCCESS);
      }
    } catch (e) {
      showSnackBar("An error occurred while saving the image",
          title: "Error", status: MessageStatus.ERROR);
    }
  }

  static String timeAgo(DateTime dateTime) {
    final Duration diff = DateTime.now().difference(dateTime);
    final int seconds = diff.inSeconds;
    final int minutes = diff.inMinutes;
    final int hours = diff.inHours;
    final int days = diff.inDays;
    final int months = (days / 30).floor(); // Approximate month length
    final int years = (days / 365).floor(); // Approximate year length

    if (years >= 1) {
      return '$years y ago';
    } else if (months >= 1) {
      return '$months mo ago';
    } else if (days >= 1) {
      return '$days d ago';
    } else if (hours >= 1) {
      return '$hours h ago';
    } else if (minutes >= 1) {
      return '$minutes m ago';
    } else {
      return 'Just now';
    }
  }
}
