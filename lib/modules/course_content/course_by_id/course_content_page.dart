import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_controller.dart';
import 'package:quizzie_thunder/modules/course_content/course_by_id/course_content_controller.dart';

import 'package:quizzie_thunder/theme/colors_theme.dart';

class CourseContentPage extends StatelessWidget {
  const CourseContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    CourseContentController courseContentController =
        Get.find<CourseContentController>();
    return Obx(() {
      return courseContentController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: ThemeColor.blue,
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
                      courseContentController.pdfController.previousPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 100),
                      );
                    },
                  ),
                  PdfPageNumber(
                    controller: courseContentController.pdfController,
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
                      courseContentController.pdfController.nextPage(
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
              body: courseContentController.isLoading.value
                  ? Column(
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                            value: courseContentController.progressValue.value,
                          color: ThemeColor.blue,
                        )),
                        
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(courseContentController.progressValue.value.toString()),
                        Flexible(
                          child: PdfView(
                            controller: courseContentController.pdfController,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton.filled(
                                onPressed: () {
                                  courseContentController.pdfController
                                      .previousPage(
                                    curve: Curves.ease,
                                    duration: const Duration(milliseconds: 100),
                                  );
                                },
                                icon: Icon(Icons.skip_previous_rounded)),
                            PdfPageNumber(
                              controller: courseContentController.pdfController,
                              builder: (_, loadingState, page, pagesCount) =>
                                  Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '$page/${pagesCount ?? 0}',
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                            IconButton.filled(
                                onPressed: () {
                                  courseContentController.pdfController
                                      .nextPage(
                                          curve: Curves.ease,
                                          duration: const Duration(
                                              milliseconds: 100));
                                },
                                icon: Icon(Icons.skip_next_rounded))
                          ],
                        ),
                        SizedBox(height: 25,)
                      ],
                    ));
    });
  }
}
