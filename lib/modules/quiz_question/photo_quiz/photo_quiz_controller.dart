import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:quizzie_thunder/apis/photo_quiz_api.dart';
import 'package:quizzie_thunder/models/photo_quiz_response_model.dart';
import 'package:universal_html/html.dart' as html;

class PhotoQuizController extends GetxController {
  PhotoQuizResponseModel? photoQuizResponseModel;
  PhotoQuizApi photoQuizApi = PhotoQuizApi();

  var selectedImage = Rxn<Uint8List>();
  var uploadStatus = ''.obs;

  var isLoading = true.obs;
  var isUploading = false.obs;
  var parameters = Get.parameters;
  var quizId = '';
  var hasAttempted = true.obs;

  @override
  void onInit() {
    quizId = parameters['quizId']!;
    getQuizDetail();
    super.onInit();
  }

  void getQuizDetail() async {
    isLoading.value = true;
    var response = await photoQuizApi.getPhotoQuizDetails(quizId);
    if (response.code == 200) {
      isLoading.value = false;
      photoQuizResponseModel = response;
    } else {
      isLoading.value = false;
       photoQuizResponseModel = response;
    }
  }

  void pickFile() async {
    if (GetPlatform.isWeb) {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final files = uploadInput.files;
        if (files!.isNotEmpty) {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(files[0]);
          reader.onLoadEnd.listen((e) {
            selectedImage.value = reader.result as Uint8List;
          });
        }
      });
    } else {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        selectedImage.value =
            await File(result.files.single.path!).readAsBytes();
      } else {
        // User canceled the picker
      }
    }
  }

  void uploadFile() async {
    isUploading.value = true;
    if (selectedImage.value != null) {
      var response = await photoQuizApi.uploadQuizImage(
          base64Encode(selectedImage.value!), quizId);
    if(response.code == 200){
      photoQuizResponseModel = response;
      isUploading.value = false;
    }
    else
    {
      isUploading.value = false;
      photoQuizResponseModel = response;
    }
    }
  }
}
