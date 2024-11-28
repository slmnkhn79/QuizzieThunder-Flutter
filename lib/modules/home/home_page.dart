import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dartx/dartx.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:exprollable_page_view/exprollable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:quizzie_thunder/models/post_card_item_model.dart';
import 'package:quizzie_thunder/modules/home/feed_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/post_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../models/all_quiz_response_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../widgets/quiz_item_container.dart';
import '../profile/profile_controller.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    print("homepage created");
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    ProfileController profileController = Get.find<ProfileController>();
    FeedController feedController = Get.find<FeedController>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.facebook_light_4,
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              homeController.getHomeScreenDetails();
              // feedController.getFeedScreenDetails(0);
              profileController.getProfileScreenDetails();
            },
            child: homeController.isLoading.value &&
                    feedController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: ThemeColor.headerOne,
                  ))
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      // print("scrollInfo : ${scrollInfo}");
                      if (!feedController.isLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent && homeController.selectedTabIndex.value == 0) {
                        // print('end reached');
                        feedController.getFeedScreenDetails();
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width > 600
                              ? 600
                              : MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          child: Container(
                            color: ThemeColor.headerThree,
                            child: SizedBox(
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 36,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppUtils.getGreeting(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    // color: ThemeColor.candyPink
                                                    color:
                                                        ThemeColor.headerOne),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Visibility(
                                                visible: profileController
                                                    .fullName
                                                    .value
                                                    .isNotNullOrEmpty,
                                                child: Text(
                                                  "${profileController.fullName}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ThemeColor.headerOne),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Visibility(
                                            visible: profileController
                                                .profilePic
                                                .value
                                                .isNotNullOrEmpty,
                                            child: CircleAvatar(
                                              backgroundColor: AppUtils
                                                  .getRandomAvatarBgColor(),
                                              radius: 24,
                                              child: ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${profileController.profilePic}",
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      // SizedBox(
                                                      //     width: 50,
                                                      //     height: 50,
                                                      //     child: CircularProgressIndicator(
                                                      //         value:
                                                      //             downloadProgress
                                                      //                 .progress)
                                                      Image.asset(
                                                          "assets/images/placeholder.png"),
                                                  // ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            // color: ThemeColor.primaryDark,
                                            color: ThemeColor.headerOne,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        // padding: const EdgeInsets.all(4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  homeController
                                                      .selectedTabIndex
                                                      .value = 0;
                                                },
                                                child: homeController
                                                            .selectedTabIndex
                                                            .value ==
                                                        0
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            color: ThemeColor
                                                                .headerTwo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        child: Text(
                                                          "Events",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: ThemeColor
                                                                  .facebook_light_4,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ))
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        child: Text(
                                                          "Events",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: ThemeColor
                                                                  .facebook_light_4,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  homeController
                                                      .selectedTabIndex
                                                      .value = 1;
                                                },
                                                child: homeController
                                                            .selectedTabIndex
                                                            .value ==
                                                        1
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            color: ThemeColor
                                                                .headerTwo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        child: Text(
                                                          "Quiz",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: ThemeColor
                                                                  .facebook_light_4,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ))
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        child: Text(
                                                          "Quiz",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: ThemeColor
                                                                  .facebook_light_4,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      homeController.selectedTabIndex.value == 0
                                          ? nearByFeedContainerV3(
                                              feedController)
                                          // ? nearByFeedContainerV2(
                                          // context, feedController)
                                          : quizFeedContainer(
                                              homeController, context)
                                    ]))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))));
  }

  Container quizFeedContainer(
      HomeController homeController, BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Column(children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.quizDetailPage, arguments: {
              ARG_QUIZ_ID:
                  homeController.homeScreenResponseModel?.mostPlayedQuiz!.id
            });
          },
          child: Stack(
            children: [
              Image.asset(
                "assets/images/most_played_quiz_bg.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text("MOST PLAYED QUIZ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.dustyRose)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "${homeController.homeScreenResponseModel?.mostPlayedQuiz?.title}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.burgundy))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        // Stack(children: [
        //   Image.asset(
        //     "assets/images/featured_bg.png",
        //     width: double.infinity,
        //     fit: BoxFit.cover,
        //   ),
        //   Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               height: 32,
        //             ),
        //             Text("FEATURED",
        //                 style: TextStyle(
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.bold,
        //                     color: ThemeColor.white.withOpacity(0.8))),
        //             SizedBox(
        //               height: 16,
        //             ),
        //             Align(
        //               alignment: Alignment.center,
        //               child: Text(
        //                   "Take part in the challenges\nwith friends or other\nplayers",
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: ThemeColor.white)),
        //             ),
        //             SizedBox(
        //               height: 24,
        //             ),
        //             SizedBox(
        //                 height: 32,
        //                 child: ElevatedButton(
        //                   onPressed: () {},
        //                   style: TextButton.styleFrom(
        //                     textStyle: TextStyle(
        //                         fontSize: 14, fontWeight: FontWeight.bold),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(24)),
        //                     backgroundColor: ThemeColor.white,
        //                   ),
        //                   child: Text(
        //                     "🤘 Find Friends",
        //                     style: TextStyle(color: ThemeColor.primary),
        //                   ),
        //                 )),
        //           ]))
        // ]),

        Visibility(
          visible: homeController.homeScreenResponseModel?.weekTopRank != null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top rank of the week",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.black),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(children: [
                Image.asset(
                  "assets/images/top_rank_bg.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ThemeColor.white,
                                  )),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  AppUtils.getRandomAvatarBgColor(),
                              radius: 24,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${homeController.homeScreenResponseModel?.weekTopRank?.user?.profilePic}",
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: ThemeColor.accent,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: ThemeColor.red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${homeController.homeScreenResponseModel?.weekTopRank?.user?.firstname} ${homeController.homeScreenResponseModel?.weekTopRank?.user?.lastname}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.white),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${homeController.homeScreenResponseModel?.weekTopRank?.points} points",
                                  style: TextStyle(
                                      fontSize: 14, color: ThemeColor.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ))
              ]),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),

        SizedBox(
          height: 24,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quizzes",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.black),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.quizzesPage);
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryDark),
                          ),
                        )
                      ],
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8);
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: homeController
                                .homeScreenResponseModel?.quizzes?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.quizDetailPage,
                                    arguments: {
                                      // ARG_QUIZ_DETAIL: homeController
                                      //     .homeScreenResponseModel
                                      //     ?.quizzes?[index],
                                      ARG_QUIZ_ID: homeController
                                          .homeScreenResponseModel
                                          ?.quizzes?[index]
                                          .id
                                    });
                              },
                              child: QuizItemContainer(
                                  dataObj: homeController
                                      .homeScreenResponseModel
                                      ?.quizzes?[index]));
                        }),
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GridView.builder(
                      itemCount: homeController
                          .homeScreenResponseModel?.quizCategories?.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final cardBgColor = AppUtils.getRandomCardBgColor();
                        return Card(
                            color: cardBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.quizzesPage, arguments: {
                                  ARG_QUIZ_CATEGORY_ID: homeController
                                      .homeScreenResponseModel
                                      ?.quizCategories?[index]
                                      .id,
                                  ARG_QUIZ_CATEGORY_NAME: homeController
                                      .homeScreenResponseModel
                                      ?.quizCategories?[index]
                                      .title
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.science_outlined,
                                    size: 36,
                                    color: ThemeColor.white,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "${homeController.homeScreenResponseModel?.quizCategories?[index].title}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ThemeColor.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${homeController.homeScreenResponseModel?.quizCategories?[index].quizCount} Quizzes",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ThemeColor.white,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    )
                  ],
                )))
      ]),
    );
  }

  Column nearByFeedContainer(FeedController feedController) {
    return Column(
      children: [
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
            scrollDirection: Axis.vertical,
            itemCount:
                // feedController.feedScreenResponseModel?.posts?.length ?? 0,
                // feedController.posts.length + (feedController.isLoading.value ? 1 : 0),
                feedController.postLen,
            // feedController.feedScreenResponseModel!.posts.length + (feedController.isLoading.value ? 1 : 0),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    feedController.selectedPostIndex =
                        feedController.posts[index].id;
                    Get.toNamed(AppRoutes.postDetailsPage, arguments: {
                      ARG_POST_ID: feedController.posts[index].id
                    });
                  },
                  child: PostCard(post: feedController.posts[index]));
            }),
        SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                // feedController.incrementSkip();
                // feedController.getFeedScreenDetails();
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: ThemeColor.headerOne,
              ),
              child: Text("Load More",
                  style: TextStyle(color: ThemeColor.headerThree)),
            )),
        SizedBox(
          height: 64,
        ),
      ],
    );
  }

  Column nearByFeedContainerV2(
      BuildContext context, FeedController feedController) {
    return Column(
      children: [
        Text(feedController.feedScreenResponseModel!.posts.length.toString()),
        SizedBox(
          height: MediaQuery.of(context).size.height > 600
              ? 600
              : MediaQuery.of(context).size.height * 0.7,
          child: Swiper(
            containerHeight: 600,
            containerWidth: 600,
            itemHeight: 600,
            itemWidth: 600,
            scrollDirection: Axis.vertical,
            // autoplay: true,
            itemCount: feedController.feedScreenResponseModel!.posts.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                      // height: 600,
                      feedController
                          .feedScreenResponseModel!.posts[index].photoUrl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.4,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: ThemeColor.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 5,
                                  offset: Offset(0, -15))
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                tileColor:
                                    const Color.fromARGB(255, 56, 56, 56),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      AppUtils.getRandomAvatarBgColor(),
                                  radius: 24,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: feedController
                                          .feedScreenResponseModel!
                                          .posts[index]
                                          .photoUrl,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: ThemeColor.accent,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: ThemeColor.red,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(feedController
                                    .feedScreenResponseModel!
                                    .posts[index]
                                    .caption),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      AppUtils.getRandomAvatarBgColor(),
                                  radius: 24,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: feedController
                                          .feedScreenResponseModel!
                                          .posts[index]
                                          .photoUrl,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: ThemeColor.accent,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: ThemeColor.red,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(feedController
                                    .feedScreenResponseModel!
                                    .posts[index]
                                    .caption),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Column nearByFeedContainerV3(FeedController feedController) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: feedController.posts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  feedController.selectedPostIndex =
                      feedController.posts[index].id;
                  Get.toNamed(AppRoutes.postDetailsPage,
                      arguments: {ARG_POST_ID: feedController.posts[index].id});
                },
                child: PostCard(post: feedController.posts[index]));
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
        feedController.isLoading.value
            ? CircularProgressIndicator()
            : Container(),
        feedController.endReached.value ? Text("End of List") : Container(),
        SizedBox(
          height: 64,
        ),
      ],
    );
  }
}

class VerticalScrollBehaviour extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
