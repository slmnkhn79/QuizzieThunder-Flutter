import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_controller.dart';

import 'package:quizzie_thunder/theme/colors_theme.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.find<BookController>();
    return Obx(() {
      return bookController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: ThemeColor.white,
            ))
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  "Book",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.white),
                ),
                backgroundColor: ThemeColor.headerOne,
                centerTitle: true,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () {
                      bookController.pdfController.previousPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 100),
                      );
                    },
                  ),
                  PdfPageNumber(
                    controller: bookController.pdfController,
                    builder: (_, loadingState, page, pagesCount) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        '$page/${pagesCount ?? 0}',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.navigate_next),
                    onPressed: () {
                      bookController.pdfController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 100),
                      );
                    },
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.refresh),
                  //   onPressed: () {
                  //     if (_isSampleDoc) {
                  //       bookController.pdfController.loadDocument(
                  //           PdfDocument.openAsset('assets/flutter_tutorial.pdf'));
                  //     } else {
                  //       bookController.pdfController
                  //           .loadDocument(PdfDocument.openAsset('assets/hello.pdf'));
                  //     }
                  //     // _isSampleDoc = !_isSampleDoc;
                  //   },
                  // ),
                ],
              ),
              body: bookController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.white,
                    ))
                  : PdfView(
                      controller: bookController.pdfController,
                    ));
    });
  }
}
