import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryHeaderController galleryHeaderController = Get.find<GalleryHeaderController>();
  return Scaffold(
    //  appBar: AppBar(
    //     leading: IconButton(
    //         onPressed: () {
    //           Get.back();
    //         },
    //         icon: const Icon(
    //           Icons.arrow_back,
    //           color: ThemeColor.white,
    //         )),
    //     title: Obx(() => Text(
    //           schoolController.isLoading.value
    //               ? "School Details"
    //               : schoolController.schoolDetailsModel!.school.name!,
    //           // addPostController.quizCategoryName.isEmpty
    //           //     ? "Quizzes"
    //           //     : "${quizzesController.quizCategoryName} Quizzes",
    //           style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //               color: ThemeColor.white),
    //         )),
    //     backgroundColor: ThemeColor.headerOne,
    //     centerTitle: false,
    //     elevation: 0,
    //   ),
      body: Placeholder(),
  );
  }
}