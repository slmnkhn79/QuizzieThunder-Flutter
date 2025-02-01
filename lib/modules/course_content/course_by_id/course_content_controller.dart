import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/foundation.dart';
import 'package:quizzie_thunder/apis/course_content.dart';
import 'package:quizzie_thunder/models/couse_content_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class CourseContentController extends GetxController {
  final arguments = Get.arguments;
  final isLoading = true.obs;
  CourseContentResponseModel? courseContentResponseModel;
  CourseContentAPI courseContentAPI = CourseContentAPI();
  late final PdfController pdfController;
  var progressValue = 0.0.obs;
  var courseId = '';

  @override
  void onInit() {
    if (arguments != null) {
      courseId = arguments[ARG_COURSE_CONTENT_ID];
      getcourseById();
    }
    
    super.onInit();
  }
  // @override
  // void onClose(){
  //   pdfController.dispose();
  //   super.onClose();
  // }


  void getcourseById() async {
    isLoading.value = true;
    var response = await courseContentAPI.getcourseById(courseId: courseId);
    if (response.code == 200) {
      courseContentResponseModel = response;
      // isLoading.value= false;
      if (!kIsWeb) {
        _downloadAndDisplayPdf(courseContentResponseModel!.course!.pdfUrl);
      } else {
        pdfController = PdfController(
          document: PdfDocument.openData(
              loadPdfFromUrl(courseContentResponseModel!.course!.pdfUrl)),
        );
      }
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  // Future<void> _downloadAndDisplayPdf(String pdfUrl) async {
  //   final response = await http.get(Uri.parse(pdfUrl));
  //   final bytes = response.bodyBytes;
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/temp.pdf');
  //   await file.writeAsBytes(bytes);
  //   pdfController = PdfController(
  //     document: PdfDocument.openFile(file.path),
  //   );
  //   isLoading.value = false;
  // }

  // FutureOr<Uint8List>
  //     // Future<List<int>>
  //     loadPdfFromUrl(String pdfUrl) async {
  //   final response = await http.get(Uri.parse(pdfUrl));
  //   isLoading.value = false;
  //   if (response.statusCode == 200) {
  //     return response.bodyBytes;
  //   } else {
  //     throw Exception('Failed to load PDF');
  //   }
  // }

  Future<void> _downloadAndDisplayPdf(String pdfUrl) async {
    final client = http.Client();
    final request = http.Request('GET', Uri.parse(pdfUrl));
    final response = await client.send(request);
    final total = response.contentLength;
    var bytes = 0;

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/temp.pdf');
    final sink = file.openWrite();

    response.stream.listen(
      (chunk) {
        bytes += chunk.length;
        sink.add(chunk);
        progressValue.value = bytes / total!;
      },
      onDone: () async {
        await sink.close();
        pdfController = PdfController(
          document: PdfDocument.openFile(file.path),
        );
        isLoading.value = false;
      },
      onError: (e) {
        print("Error: $e");
        isLoading.value = false;
      },
      cancelOnError: true,
    );
  }

  // FutureOr<Uint8List> loadPdfFromUrl(String pdfUrl) async {
  //   final response = await http.get(Uri.parse(pdfUrl));
  //   isLoading.value = false;
  //   if (response.statusCode == 200) {
  //     return response.bodyBytes;
  //   } else {
  //     throw Exception('Failed to load PDF');
  //   }
  // }

  Future<Uint8List> loadPdfFromUrl(String pdfUrl) async {
    final client = http.Client();
    final request = http.Request('GET', Uri.parse(pdfUrl));
    final response = await client.send(request);
    final total = response.contentLength;
    var bytes = 0;
    final List<int> data = [];

    await for (var chunk in response.stream) {
      bytes += chunk.length;
      data.addAll(chunk);
      progressValue.value = bytes / total!;
    }

    isLoading.value = false;
    return Uint8List.fromList(data);
  }
}
