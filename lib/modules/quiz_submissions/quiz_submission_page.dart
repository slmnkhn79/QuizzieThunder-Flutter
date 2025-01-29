import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_submissions/quiz_submission_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/full_screen_picture/fullscreen_url_img_viewer.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:shimmer/shimmer.dart';

class QuizSubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizSubmissionController quizSubmissionController =
        Get.find<QuizSubmissionController>();
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
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () async {},
            child: quizSubmissionController.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Center(child: CircularProgressIndicator())],
                  )
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      // print("scrollInfo : ${scrollInfo}");
                      if (!quizSubmissionController.isLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          quizSubmissionController.quizType == 'photo_1') {
                        quizSubmissionController
                            .getAllSubmissionForPhotoWithSkip();
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height > 600
                              ? 600
                              : MediaQuery.of(context).size.height,
                          // height: MediaQuery.of(context).size.height,
                          child: Container(
                            color: ThemeColor.headerThree,
                            child:
                                getContainer(context, quizSubmissionController),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ));
  }

  Container getContainer(
      BuildContext context, QuizSubmissionController quizSubmissionController) {
    return Container(
      child: Column(
        children: [
          quizSubmissionController.quizSubmissionResponseModel!.data.self !=
                  null
              ? getSelfSubmissionContainer(context, quizSubmissionController)
              : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: ThemeColor.headerOne,
                ),
                child: Text('All submissions',
                    style: TextStyle(color: ThemeColor.headerThree)),
              ),
            ),
          ),
          getOthersContainer(context, quizSubmissionController),
          quizSubmissionController.isSubmittedPhotoLoading.value
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container()
        ],
      ),
    );
  }

  Container getSelfSubmissionContainer(
      BuildContext context, QuizSubmissionController quizSubmissionController) {
    return Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: ThemeColor.headerOne,
                  ),
                  child: Text('Your submission',
                      style: TextStyle(color: ThemeColor.headerThree)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(FullscreenUrlImgViewer(
                    headerImageUrl: quizSubmissionController
                        .quizSubmissionResponseModel!.data!.self!.imageUrl,
                  ));
                },
                child: CachedNetworkImage(
                    imageUrl: quizSubmissionController
                        .quizSubmissionResponseModel!.data!.self!.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                    imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child:
                                Image.asset("assets/images/placeholder.png")),
                    errorWidget: (context, url, error) => Icon(Icons.error)),
              ),
            )
          ],
        ));
  }

  getOthersContainer(
      BuildContext context, QuizSubmissionController quizSubmissionController) {
    return Container(
      color: ThemeColor.headerThree,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: quizSubmissionController.submittedPhotoArray.length,
          itemBuilder: (context, index) {
            var item = quizSubmissionController.submittedPhotoArray[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(FullscreenUrlImgViewer(
                      headerImageUrl: item.imageUrl,
                    ));
                  },
                  child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      width: 200,
                      height: 120,
                      fit: BoxFit.fill,
                      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                      progressIndicatorBuilder: (context, url,
                              downloadProgress) =>
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child:
                                  Image.asset("assets/images/placeholder.png")),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      child: 
                      item.isLiked ?
                       IconButton(
                        color: ThemeColor.headerOne,
                         onPressed: () {
                          quizSubmissionController.disLikeQuizPhotoById(item.id);
                        },
                        icon: Icon(Icons.thumb_up_alt_sharp),
                        iconSize: 30,
                      ):
                      IconButton(
                        icon: Icon(Icons.thumb_up_alt_sharp),
                        onPressed: () {
                          quizSubmissionController.likeQuizPhotoById(item.id);
                        },
                        iconSize: 30,
                      ),
                    ),
                    
                  ],
                )
              ],
            );
          }),
    );
  }
}
