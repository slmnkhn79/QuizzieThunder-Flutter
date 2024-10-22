import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/main.dart';
import 'package:quizzie_thunder/modules/add_a_school/add_post_controller.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
// import 'package:file_picker_pro/file_data.dart';
// import 'package:file_picker_pro/file_picker.dart';
// import 'package:file_picker_pro/files.dart';

class SchoolDetails extends StatelessWidget {
  // FileData _fileData = FileData();
  Object? result;

  SchoolDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolController schoolController = Get.find<SchoolController>();
    Uint8List uploadedImage;
    PlatformFile? objFile = null;
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
              // addPostController.quizCategoryName.isEmpty
              //     ? "Quizzes"
              //     : "${quizzesController.quizCategoryName} Quizzes",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.white),
            )),
        backgroundColor: Colors.transparent,
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
                          // Header Image
                          Image.network(schoolController
                              .schoolDetailsModel!.school.headerImageUrl),

                          // Row with three text widgets with colored background
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildColoredText(
                                  schoolController
                                      .schoolDetailsModel!.school.numOfStudents
                                      .toString(),
                                  Colors.red),
                              _buildColoredText(
                                  schoolController
                                      .schoolDetailsModel!.school.facultyRatio,
                                  Colors.green),
                              _buildColoredText(
                                  schoolController
                                      .schoolDetailsModel!.school.schoolType,
                                  Colors.blue),
                            ],
                          ),

                          // List of items with score and rating
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: List.generate(
                                  schoolController.schoolDetailsModel!.school
                                      .attributes.length, (index) {
                                return ListTile(
                                  title: Text(schoolController
                                      .schoolDetailsModel!
                                      .school
                                      .attributes[index]
                                      .type),
                                  trailing: SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Text(schoolController
                                          //     .schoolDetailsModel!
                                          //     .school
                                          //     .attributes[index]
                                          //     .ratings),
                                          VerticalDivider(),
                                          Text(schoolController
                                              .schoolDetailsModel!
                                              .school
                                              .attributes[index]
                                              .score),
                                          VerticalDivider(),
                                          RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              itemSize: 24,
                                              ignoreGestures: true,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              onRatingUpdate: (value) => {})
                                        ],
                                      ),
                                    ),
                                  ),
                                  // subtitle: ,
                                );
                              }),
                            ),
                          ),

                          // Grid view with three items in a row or column
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 600
                                      ? 3
                                      : 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(9, (index) {
                                return Card(
                                  child: Center(
                                      child: Text('Grid Item ${index + 1}')),
                                );
                              }),
                            ),
                          ),

                          // List of 3 cards with some text
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: List.generate(3, (index) {
                                return Card(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        'Card ${index + 1} content goes here.'),
                                  ),
                                );
                              }),
                            ),
                          ),

                          // Text box with header and paragraph
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Header',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'This is a paragraph that provides more detailed information. '
                                  'It can span multiple lines and is meant to be descriptive.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // startWebFilePicker(AddSchoolController addPostController) async {
  //   html.InputElement? uploadInput =
  //       html.FileUploadInputElement() as html.InputElement?;
  //   uploadInput?.multiple = true;
  //   uploadInput?.draggable = true;
  //   uploadInput?.click();

  //   uploadInput?.onChange.listen((e) {
  //     final files = uploadInput.files;
  //     final file = files?[0];
  //     final reader = new html.FileReader();
  //     // result = reader.result;
  //     reader.onLoadEnd.listen((e) {
  //       // _handleResult(addPostController, reader.result);
  //       addPostController.haveImage.value = true;
  //       addPostController.bytesData =
  //           Base64Decoder().convert(reader.result.toString().split(",").last);
  //     });
  //     reader.readAsDataUrl(file!);
  //   });
  // }

  // void _handleResult(AddSchoolController addPostController
  // , Object? result
  // ) {
  // addPostController.haveImage.value = true;
  // // addPostController.filename = result.;
  // addPostController.bytesData =
  //     Base64Decoder().convert(result.toString().split(",").last);
  // addPostController.uploadSchoolDetails();
  // setState(() {
  //   _bytesData = Base64Decoder().convert(result.toString().split(",").last);
  //   _selectedFile = _bytesData;
  // });
  // }

  Widget _buildColoredText(String text, Color color) {
    return Expanded(
      child: SizedBox(
        height: 150,
        child: Container(
          padding: EdgeInsets.all(8),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                // softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
