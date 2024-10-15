
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/add_a_post/add_post_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:file_picker_pro/file_picker.dart';
import 'package:file_picker_pro/files.dart';

class AddPost extends StatelessWidget {
  FileData _fileData = FileData();


  @override
  Widget build(BuildContext context) {
    AddPostController addPostController = Get.find<AddPostController>();
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
          children: [
            // TextField(
            //   decoration: InputDecoration(labelText: 'Enter some text'),
            // ),
            // ElevatedButton(
            //   onPressed: ,
            //   child: Text('Select File'),
            // ),
            // SizedBox(height: 10),
            // Text("Text"),

          FilePicker
          (
                  context: context,
                  height: 100,
                  fileData: _fileData,
                  crop: true,
                  maxFileSizeInMb: 10,
                  allowedExtensions: const [
                    Files.txt,
                    Files.png,
                    Files.jpg,
                    Files.pdf
                  ],
                  onSelected: (fileData) {
                    _fileData = fileData;
                    print(fileData.filePath);
                    // setState(() {});
                  },
                  onCancel: (message, messageCode) {
                    print("[$messageCode] $message");
                  }
                  ),

          ],
        ));
  }

  
}
