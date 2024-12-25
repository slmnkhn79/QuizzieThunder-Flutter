import 'package:cached_network_image/cached_network_image.dart';
import 'package:exprollable_page_view/exprollable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/full_screen_picture/fullscreen_url_img_viewer_v2.dart';
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.headerOne,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ...galleryHeaderController.year
                                                .map((y) {
                                              return TextButton(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 8.0),
                                                  decoration: BoxDecoration(
                                                      color: galleryHeaderController
                                                                  .selectedYear
                                                                  .value
                                                                  .toString() ==
                                                              y
                                                          ? ThemeColor.headerTwo
                                                          : ThemeColor.headerOne,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: Text(y.toString(),
                                                      style: TextStyle(
                                                          color:
                                                              ThemeColor.white)),
                                                ),
                                                onPressed: () {
                                                  galleryHeaderController
                                                      .selectedYear
                                                      .value = int.parse(y);
                                                },
                                              );
                                            })
                                          ])),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: double.infinity,
                                      height: 50,
                                      // clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.headerOne,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: ScrollConfiguration(
                                        behavior: MyCustomScrollBehavior(),
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            ...galleryHeaderController.months
                                                .map((y) {
                                              return TextButton(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 8.0),
                                                  decoration: BoxDecoration(
                                                      color: galleryHeaderController
                                                                  .selectedMonth
                                                                  .value ==
                                                              y['month']
                                                          ? ThemeColor.headerTwo
                                                          : ThemeColor.headerOne,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: Text(
                                                      y['month_name'].toString(),
                                                      style: TextStyle(
                                                          color:
                                                              ThemeColor.white)),
                                                ),
                                                onPressed: () {
                                                  galleryHeaderController
                                                      .selectedMonth
                                                      .value = y['month'];
                                                  galleryHeaderController
                                                      .getEventByDate();
                                                },
                                              );
                                            })
                                          ],
                                        ),
                                      )),
                                  galleryHeaderController.isLoadingGallery.value
                                      ? Container()
                                      // : PhotoGallery(galleryDetailsResponseModel:  galleryHeaderController.galleryResponseModel)
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                              width: double.infinity,
                                              // height: MediaQuery.of(context).size.height +200,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      galleryHeaderController
                                                              .selectedEventId
                                                              .value =
                                                          galleryHeaderController
                                                              .galleryResponseModel!
                                                              .gallery[index]
                                                              .id;
                                                      // showDetailsPage(
                                                      //     context,
                                                      //     galleryHeaderController,
                                                      // galleryHeaderController
                                                      //     .galleryResponseModel!
                                                      //     .gallery[index]
                                                      //     .headerImageUrl
                                                      // );
                                                      galleryHeaderController
                                                          .getEventById();
                                                      Get.to(
                                                          FullscreenUrlImgViewerV2(
                                                              galleryHeaderController:
                                                                  galleryHeaderController,
                                                              headerImageUrl:
                                                                  galleryHeaderController
                                                                      .galleryResponseModel!
                                                                      .gallery[
                                                                          index]
                                                                      .headerImageUrl),
                                                          arguments: {
                                                            'eventId':
                                                                galleryHeaderController
                                                                    .galleryResponseModel!
                                                                    .gallery[
                                                                        index]
                                                                    .id,
                                                          });
                                                      // Get.to(PhotoGallery(eventId: galleryHeaderController.galleryResponseModel!.gallery[index].id));
                                                    },
                                                    child: Card(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          // Padding(
                                                          //   padding:
                                                          //       EdgeInsets.all(
                                                          //           20.0),
                                                          //   child: Text(
                                                          //     '${galleryHeaderController.galleryResponseModel!.gallery[index].date.day}/${galleryHeaderController.galleryResponseModel!.gallery[index].date.month}/${galleryHeaderController.galleryResponseModel!.gallery[index].date.year}',
                                                          //     style: TextStyle(
                                                          //       color: Color(
                                                          //           0xffb6b2b2),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          Divider(height: 1.0),
                                                          CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                              imageUrl: galleryHeaderController
                                                                  .galleryResponseModel!
                                                                  .gallery[index]
                                                                  .headerImageUrl),
                                                          Divider(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(galleryHeaderController
                                                                    .galleryResponseModel!
                                                                    .gallery[
                                                                        index]
                                                                    .eventName),
                                                                    VerticalDivider(),
                                                                Text(
                                                                  '${galleryHeaderController.galleryResponseModel!.gallery[index].date.day}/${galleryHeaderController.galleryResponseModel!.gallery[index].date.month}/${galleryHeaderController.galleryResponseModel!.gallery[index].date.year}',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xffb6b2b2),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: galleryHeaderController
                                                    .galleryResponseModel!
                                                    .gallery
                                                    .length,
                                              )),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            )));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

void showDetailsPage(
    BuildContext context,
    GalleryHeaderController galleryHeaderController,
    String headerImageUrl) async {
  await galleryHeaderController.getEventById();

  Navigator.of(context, rootNavigator: true).push(
    ModalExprollableRouteBuilder(
      // This is the only required paramter.
      pageBuilder: (context, _, __) {
        return PageConfiguration(
          initialPage: 0,
          viewportConfiguration: ViewportConfiguration(
              extendPage: false,
              overshootEffect: true,
              shrunkInset: ViewportInset.fractional(0.2)),
          child: ExprollablePageView(
            scrollBehavior: MyCustomScrollBehavior(),
            itemCount: galleryHeaderController
                    .galleryDetailsResponseModel!.eventDetails.isNotEmpty
                ? galleryHeaderController
                    .galleryDetailsResponseModel!.eventDetails.length
                : 1,
            itemBuilder: (context, page) {
              return galleryHeaderController
                      .galleryDetailsResponseModel!.eventDetails.isNotEmpty
                  ? PageGutter(
                      gutterWidth: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            // color: ThemeColor.facebook_light_1,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              controller:
                                  PageContentScrollController.of(context),
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CachedNetworkImage(
                                      fadeInDuration: Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          Duration(milliseconds: 0),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          // SizedBox(
                                          //     width: 50,
                                          //     height: 50,
                                          //     child: CircularProgressIndicator(
                                          //         value:
                                          //             downloadProgress.progress))
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              'assets/images/placeholder.png')
                                      // SizedBox(
                                      //   height: 400,
                                      //   width: 600,
                                      //   child: Container(
                                      //     child: Text("Sorry! Image unavailable"),
                                      //   ),
                                      // )
                                      ,
                                      imageUrl: galleryHeaderController
                                          .galleryDetailsResponseModel!
                                          .eventDetails[page]
                                          .imageUrl)),
                            ),
                          ),
                        ],
                      ))
                  : PageGutter(
                      gutterWidth: 12,
                      child: Card(
                        // color: ThemeColor.facebook_light_1,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          controller: PageContentScrollController.of(context),
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                      // placeholder: (context, str) {
                                      //   return Text("Image is loading");
                                      // },
                                      fadeInDuration: Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          Duration(milliseconds: 0),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          // SizedBox(
                                          //     width: 50,
                                          //     height: 50,
                                          //     child: CircularProgressIndicator(
                                          //         value:
                                          //             downloadProgress.progress)
                                          // ),
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      imageUrl: headerImageUrl),
                                ],
                              )),
                        ),
                      ));
            },
          ),
        );
      },
      // Increase the transition durations and take a closer look at what's going on!
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      // The next two lines are not required, but are recommended for better performance.
      backgroundColor: Colors.white,
      opaque: true,
    ),
  );
}
