import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:get/get.dart';

import 'package:quizzie_thunder/modules/quiz_question/photo_quiz/photo_quiz_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/full_screen_picture/fullscreen_url_img_viewer.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:shimmer/shimmer.dart';

class PhotoQuizPage extends StatelessWidget {
  const PhotoQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    var photoQuizController = Get.find<PhotoQuizController>();
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
        backgroundColor: ThemeColor.headerOne,
        centerTitle: false,
        elevation: 0,
      ),
      body: Obx(() => RefreshIndicator(
          onRefresh: () async {},
          child: photoQuizController.isLoading.value
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())])
              : SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width > 600
                            ? 600
                            : MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Container(
                          color: ThemeColor.headerThree,
                          child: photoQuizController
                                  .photoQuizResponseModel!.data.hasAttempted
                              ? showPhotoContainer(context, photoQuizController)
                              : uploadPhotoContainer(
                                  context, photoQuizController),
                        )),
                  ),
                ))),
    );
  }

  uploadPhotoContainer(
      BuildContext context, PhotoQuizController photoQuizController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      photoQuizController.selectedImage.value != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.memory(
                photoQuizController.selectedImage.value!,
                height: 600,
                width: 600,
                fit: BoxFit.contain,
              ),
            )
          : Container(),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: !photoQuizController.isUploading.value
                  ? photoQuizController.pickFile
                  : null,
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                backgroundColor: ThemeColor.headerOne,
              ),
              child: Text('Select Image',
                  style: TextStyle(color: ThemeColor.headerThree)),
            ),
          ),
        ),
      ),
      photoQuizController.selectedImage.value != null
          ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                  onPressed: !photoQuizController.isUploading.value
                      ? photoQuizController.uploadFile
                      : null,
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: ThemeColor.headerOne,
                  ),
                  child: Text("Upload", style: TextStyle(color: ThemeColor.headerThree))),
            ),
          )
          : Container(),
      Center(
        child: photoQuizController.isUploading.value
            ? CircularProgressIndicator()
            : Text(photoQuizController.photoQuizResponseModel!.message,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: ThemeColor.red),),
      )
    ]);
  }

  showPhotoContainer(
      BuildContext context, PhotoQuizController photoQuizController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(FullscreenUrlImgViewer(
                headerImageUrl:
                    photoQuizController.photoQuizResponseModel!.data.imageUrl!,
              ));
            },
            child: CachedNetworkImage(
                imageUrl:
                    photoQuizController.photoQuizResponseModel!.data.imageUrl!,
                width: double.infinity,
                fit: BoxFit.contain,
                imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Image.asset("assets/images/placeholder.png")),
                errorWidget: (context, url, error) => Icon(Icons.error)),
          )
        ],
      ),
    );
  }
}
