import 'dart:convert';
import 'dart:html' as html;

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_school/add_post_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
// import 'package:file_picker_pro/file_data.dart';
// import 'package:file_picker_pro/file_picker.dart';
// import 'package:file_picker_pro/files.dart';

class AddSchoolDetails extends StatelessWidget {
  // FileData _fileData = FileData();
  Object? result;

  AddSchoolDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddSchoolController addSchoolController = Get.find<AddSchoolController>();
    Uint8List uploadedImage;
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
        title: Text(
          "Add a school",
          // addPostController.quizCategoryName.isEmpty
          //     ? "Quizzes"
          //     : "${quizzesController.quizCategoryName} Quizzes",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColor.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: ThemeColor.primary,
      body:
          // Obx(() =>
          // )

          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Stack(children: [
                // Background image
                Positioned.fill(
                 
                    child: addSchoolController.schoolDetailsModel == null
                        ? Image.asset("images/placeholder.png",
                            width: double.infinity, height: 1000, fit: BoxFit.cover)
                        : Image.network(
                            'https://example.com/your-image.jpg', // Replace with your image URL or use AssetImage for local images
                            fit: BoxFit.cover,
                          )),
                // Centered text
                Align(
                   alignment:  Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter your school name',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Type something...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.blueGrey),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.blueGrey),
                                onPressed: () {
                                  // Action to clear the text field
                                },
                              ),
                    
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12),
                              //   borderSide: BorderSide(
                              //     color: Colors.blueGrey,
                              //     width: 1.5,
                              //   ),
                              // ),
                    
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12),
                              //   borderSide: BorderSide(
                              //     color: Colors.blue,
                              //     width: 2.0,
                              //   ),
                              // ),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                            ),
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                    width: 200,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: TextField(
                              // expands: true,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: 'Some headers',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                                hintText: 'Some headers',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.blueGrey),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear, color: Colors.blueGrey),
                                  onPressed: () {
                                    // Action to clear the text field
                                  },
                                ),
                                                
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(12),
                                //   borderSide: BorderSide(
                                //     color: Colors.blueGrey,
                                //     width: 1.5,
                                //   ),
                                // ),
                                                
                                // focusedBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(12),
                                //   borderSide: BorderSide(
                                //     color: Colors.blue,
                                //     width: 2.0,
                                //   ),
                                // ),
                                filled: true,
                                fillColor: Colors.blue.shade50,
                              ),
                              cursorColor: Colors.blue,
                              style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter your school name',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                              hintText: 'Type something...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.blueGrey),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.blueGrey),
                                onPressed: () {
                                  // Action to clear the text field
                                },
                              ),
                    
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12),
                              //   borderSide: BorderSide(
                              //     color: Colors.blueGrey,
                              //     width: 1.5,
                              //   ),
                              // ),
                    
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12),
                              //   borderSide: BorderSide(
                              //     color: Colors.blue,
                              //     width: 2.0,
                              //   ),
                              // ),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                            ),
                            cursorColor: Colors.blue,
                            style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  ],
                ),
              ),
            ),
              ])
              ,
            ),
            // Bottom text
            
          ],
        ),

        // Obx(
        //   () => addPostController.haveImage.value
        //       ? Image.memory(
        //           addPostController.bytesData!,
        //           width: 200,
        //           height: 200,
        //         )
        //       : Spacer(),
        // ),
        // Obx(() => addPostController.haveImage.value
        //     ? ElevatedButton(
        //         onPressed: () async {
        //           // _startFilePicker();
        //           // uploadFile();
        //           _handleResult(addPostController);
        //         },
        //         child: Text('Upload'),
        //       )
        //     : Spacer())
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
      final reader = html.FileReader();
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
