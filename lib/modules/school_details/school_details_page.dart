import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title:  Obx(()=>
        Text(
          schoolController.isLoading.value ? "School Details": schoolController.schoolDetailsModel!.school.name! ,
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
      backgroundColor: ThemeColor.primary,
      body: Obx(
        () => schoolController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://picsum.photos/seed/136/600',
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: AnimatedDefaultTextStyle(
                                          style: Theme.of(context)
                                              .textTheme.displayLarge!
                                              // .override(
                                              //   fontFamily: 'Open Sans',
                                              //   color: Colors.white,
                                              //   fontSize: 44,
                                              //   letterSpacing: 0,
                                              // )
                                              ,
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeIn,
                                          child: Text(
                                            'School Name',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Description',
                                      style: Theme.of(context)
                                          .textTheme.bodyMedium
                                          // .override(
                                          //   fontFamily: 'Readex Pro',
                                          //   letterSpacing: 0,
                                          // )
                                          ,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/253/600',
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Achivement one',
                                style: Theme.of(context)
                                    .textTheme.bodyMedium
                                    // .override(
                                    //   fontFamily: 'Readex Pro',
                                    //   letterSpacing: 0,
                                    // )
                                    ,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(6, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AchivementoTwo',
                                  style: Theme.of(context)
                                      .textTheme.bodyMedium
                                      // .override(
                                      //   fontFamily: 'Readex Pro',
                                      //   letterSpacing: 0,
                                      // )
                                      ,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://picsum.photos/seed/253/600',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height: 400,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/253/600',
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Achivement Three',
                                style: Theme.of(context)
                                    .textTheme.bodyMedium
                                    // .override(
                                    //   fontFamily: 'Readex Pro',
                                    //   letterSpacing: 0,
                                    // )
                                    ,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xCC000000),
                        ),
                        // Align(
                        //   alignment: AlignmentDirectional(0, 0),
                        //   child: Padding(
                        //     padding: EdgeInsets.all(16),
                        //     child: Checkbox(
                        //       options: ['Option 1', 'Option 2', 'Option 3'],
                        //       onChanged: (val) => ()
                        //       // controller:
                        //         //   _model.checkboxGroupValueController ??=
                        //         //       FormFieldController<List<String>>(
                        //         // [],
                        //       // )
                        //       ,
                        //       activeColor: Theme.of(context).colorScheme.primary,
                        //       checkColor: Theme.of(context).colorScheme.secondary,
                        //       checkboxBorderColor:
                        //           Theme.of(context).textTheme.labelSmall,
                        //       textStyle: Theme.of(context)
                        //           .textTheme.bodyMedium
                        //           // .override(
                        //           //   fontFamily: 'Readex Pro',
                        //           //   fontSize: 24,
                        //           //   letterSpacing: 0,
                        //           // )
                        //           ,
                        //       unselectedTextStyle: Theme.of(context)
                        //           .textTheme.bodyMedium
                        //           // .override(
                        //           //   fontFamily: 'Readex Pro',
                        //           //   fontSize: 24,
                        //           //   letterSpacing: 0,
                        //           // )
                        //           ,
                        //       labelPadding:
                        //           EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        //       itemPadding: EdgeInsets.all(4),
                        //       checkboxBorderRadius: BorderRadius.circular(5),
                        //       initialized: _model.checkboxGroupValues != null,
                        //     ),
                        //   ),
                        // ),
                        
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'District',
                              style: Theme.of(context)
                                  .textTheme.bodyMedium
                                  // .override(
                                  //   fontFamily: 'Readex Pro',
                                  //   fontSize: 44,
                                  //   letterSpacing: 0,
                                  // )
                                  ,
                            ),
                            Text(
                              'City',
                              style: Theme.of(context)
                                  .textTheme.bodyMedium
                                  // .override(
                                  //   fontFamily: 'Readex Pro',
                                  //   fontSize: 44,
                                  //   letterSpacing: 0,
                                  // )
                                  ,
                            ),
                            Text(
                              'State',
                              style: Theme.of(context)
                                  .textTheme.bodyMedium
                                  // .override(
                                  //   fontFamily: 'Readex Pro',
                                  //   fontSize: 44,
                                  //   letterSpacing: 0,
                                  // )
                                  ,
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/403/600',
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  startWebFilePicker(AddSchoolController addPostController) async {
    html.InputElement? uploadInput =
        html.FileUploadInputElement() as html.InputElement?;
    uploadInput?.multiple = true;
    uploadInput?.draggable = true;
    uploadInput?.click();

    uploadInput?.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files?[0];
      final reader = new html.FileReader();
      // result = reader.result;
      reader.onLoadEnd.listen((e) {
        // _handleResult(addPostController, reader.result);
        addPostController.haveImage.value = true;
        addPostController.bytesData =
            Base64Decoder().convert(reader.result.toString().split(",").last);
      });
      reader.readAsDataUrl(file!);
    });
  }

  void _handleResult(AddSchoolController addPostController
      // , Object? result
      ) {
    // addPostController.haveImage.value = true;
    // // addPostController.filename = result.;
    // addPostController.bytesData =
    //     Base64Decoder().convert(result.toString().split(",").last);
    addPostController.uploadSchoolDetails();
    // setState(() {
    //   _bytesData = Base64Decoder().convert(result.toString().split(",").last);
    //   _selectedFile = _bytesData;
    // });
  }
}
