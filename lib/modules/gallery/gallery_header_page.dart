import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryHeaderController galleryHeaderController =
        Get.find<GalleryHeaderController>();
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
                galleryHeaderController.isLoading.value
                    ? "School Details"
                    : "School Details",
                // addPostController.quizCategoryName.isEmpty
                //     ? "Quizzes"
                //     : "${quizzesController.quizCategoryName} Quizzes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.white),
              )),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: false,
          elevation: 0,
        ),
        body: Obx(() => RefreshIndicator(
              onRefresh: () async {
                //fill the refresh value
              },
              child: galleryHeaderController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.headerOne,
                    ))
                  : SingleChildScrollView(
                      child: Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width > 600
                                  ? 600
                                  : MediaQuery.of(context).size.width,
                              child: Container(
                                  color: ThemeColor.headerThree,
                                  child: ListView.builder(
                                      // scrollDirection: Axis.horizontal,
                                      itemCount: galleryHeaderController
                                          .galleryDatesResponse!
                                          .dates
                                          .length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            child: SizedBox(
                                              height: double.infinity,
                                              width: 100,
                                              child: ListTile(
                                                  title: Text( galleryHeaderController
                                                      .galleryDatesResponse!
                                                      .dates[index]
                                                      .year
                                                      .toString())),
                                            ));
                                      }))))),
            )));
  }
}
