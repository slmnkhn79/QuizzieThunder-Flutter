// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/great_wall_data.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/editorial_screen.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class SchoolDetails extends StatelessWidget {
  // FileData _fileData = FileData();

  SchoolDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolController schoolController = Get.find<SchoolController>();

    // PlatformFile? objFile;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ThemeColor.white,
            )),
        title: Obx(() => Text(
              schoolController.isLoading.value
                  ? "School Details"
                  : schoolController.schoolDetailsModel!.school.name!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.white),
            )),
        backgroundColor: ThemeColor.headerOne,
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: ThemeColor.facebook_light_4,
      body: Obx(
        () => schoolController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 600
                        ? 600
                        : MediaQuery.of(context).size.width,
                    child: Container(
                      color: ThemeColor.headerThree,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("Editorial Screem"),
                            WonderEditorialScreen(GreatWallData(), contentPadding: EdgeInsets.all(16))

                          ]),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
