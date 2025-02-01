import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quizzie_thunder/apis/books_api.dart';
import 'package:quizzie_thunder/models/book_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';
import 'package:http/http.dart' as http;

class BookController extends GetxController {
  final arguments = Get.arguments;
  final isLoading = true.obs;
  BookResponseModel? bookResponseModel;
  BooksApi booksApi = BooksApi();
  late final PdfController pdfController;
  var bookId = '';

  @override
  void onInit() {
    if (arguments != null) {
      bookId = arguments[ARG_BOOK_ID];
    }
    getBookById();
    super.onInit();
  }

  void getBookById() async {
    isLoading.value = true;
    var response = await booksApi.getBookById(bookId: bookId);
    if (response.code == 200) {
      bookResponseModel = response;
      // try {
      //   final response =
      //       await http.get(Uri.parse(bookResponseModel!.book!.bookPdfLink));
      //   if (response.statusCode == 200) {
      //     pdfController = PdfController(
      //       document:
      //           PdfDocument.openData(Uint8List.fromList(response.bodyBytes)),
      //     );
      //     isLoading.value = false;
      //   } else {
      //     throw Exception('Failed to load PDF');
      //   }
      // } catch (e) {
      //   print("PDF Load Error $e");
      //   // Handle errors accordingly
      // }
      if (!kIsWeb) {
        _downloadAndDisplayPdf(bookResponseModel!.book!.bookPdfLink);
      } else {
        pdfController = PdfController(
          document: PdfDocument.openData(
              loadPdfFromUrl(bookResponseModel!.book!.bookPdfLink)),
        );
      }
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  Future<void> _downloadAndDisplayPdf(String pdfUrl) async {
    final response = await http.get(Uri.parse(pdfUrl));
    final bytes = response.bodyBytes;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/temp.pdf');
    await file.writeAsBytes(bytes);
    pdfController = PdfController(
      document: PdfDocument.openFile(file.path),
    );
    isLoading.value = false;
  }

  FutureOr<Uint8List>
      // Future<List<int>>
      loadPdfFromUrl(String pdfUrl) async {
    final response = await http.get(Uri.parse(pdfUrl));
    isLoading.value = false;
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load PDF');
    }
  }
}
