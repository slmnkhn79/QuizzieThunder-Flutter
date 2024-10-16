import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_post/add_post_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
// import 'package:file_picker_pro/file_data.dart';
// import 'package:file_picker_pro/file_picker.dart';
// import 'package:file_picker_pro/files.dart';

class AddPost extends StatelessWidget {
  // FileData _fileData = FileData();
  Object? result;

  @override
  Widget build(BuildContext context) {
    AddPostController addPostController = Get.find<AddPostController>();
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
          title: Text(
            "Add a post",
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

            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter some text'),
            ),
            ElevatedButton(
              onPressed: () async {
                // _startFilePicker();
                // uploadFile();
                startWebFilePicker(addPostController);
              },
              child: Text('Select File'),
            ),
            SizedBox(height: 10),

            Obx(
              () => addPostController.haveImage.value
                  ? Image.memory(
                      addPostController.bytesData!,
                      width: 200,
                      height: 200,
                    )
                  : Spacer(),
            ),
            Obx(() => addPostController.haveImage.value
                ? ElevatedButton(
                    onPressed: () async {
                      // _startFilePicker();
                      // uploadFile();
                      _handleResult(addPostController);
                    },
                    child: Text('Upload'),
                  )
                : Spacer())

            // FilePicker
            // (
            //         context: context,
            //         height: 100,
            //         fileData: _fileData,
            //         crop: true,
            //         maxFileSizeInMb: 10,
            //         allowedExtensions: const [
            //           Files.txt,
            //           Files.png,
            //           Files.jpg,
            //           Files.pdf
            //         ],
            //         onSelected: (fileData) {
            //           _fileData = fileData;
            //           print(fileData.filePath);
            //           // setState(() {});
            //         },
            //         onCancel: (message, messageCode) {
            //           print("[$messageCode] $message");
            //         }
            //         ),
          ],
        ));
  }

  startWebFilePicker(AddPostController addPostController) async {
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

  void _handleResult(AddPostController addPostController
      // , Object? result
      ) {
    // addPostController.haveImage.value = true;
    // // addPostController.filename = result.;
    // addPostController.bytesData =
    //     Base64Decoder().convert(result.toString().split(",").last);
    addPostController.uploadEventDetails();
    // setState(() {
    //   _bytesData = Base64Decoder().convert(result.toString().split(",").last);
    //   _selectedFile = _bytesData;
    // });
  }
}
