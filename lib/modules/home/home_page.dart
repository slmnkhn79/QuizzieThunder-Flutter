import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/home/post_card/feed_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/post_card.dart';

import '../../models/all_quiz_response_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../widgets/quiz_item_container.dart';
import '../profile/profile_controller.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
              feedController.getFeedScreenDetails();
              profileController.getProfileScreenDetails();
            },
            child: homeController.isLoading.value &&
                    feedController.isLoading.value
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
                                              "${AppUtils.getGreeting()}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  // color: ThemeColor.candyPink
                                                  color: ThemeColor.headerOne),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Visibility(
                                              visible: profileController.fullName
                                                  .value.isNotNullOrEmpty,
                                              child: Text(
                                                "${profileController.fullName}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ThemeColor.headerOne),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: profileController
                                              .profilePic.value.isNotNullOrEmpty,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                AppUtils.getRandomAvatarBgColor(),
                                            radius: 24,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "${profileController.profilePic}",
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: ThemeColor.accent,
                                                    ),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) => Icon(
                                                  Icons.error,
                                                  color: ThemeColor.red,
                                                ),
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
                                                    .selectedTabIndex.value = 0;
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                      child: Text(
                                                        "Nearby",
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                      child: Text(
                                                        "Nearby",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: ThemeColor
                                                                .facebook_light_4
                                                                ,
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
                                                    .selectedTabIndex.value = 1;
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                      child: Text(
                                                        "Weekly",
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                      child: Text(
                                                        "Weekly",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: ThemeColor
                                                                .facebook_light_4                                                                                                                                                                                                      
                                                                ,
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
                                        ? nearByFeedContainer(feedController)
                                        : quizFeedContainer(homeController,context)
                                  ]))
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ))));
  }

  SizedBox quizFeedContainer(HomeController homeController,BuildContext context) {
    return SizedBox(
    height: MediaQuery.of(context).size.height,
      child: Column(children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.quizDetailPage, arguments: {
              ARG_QUIZ_DETAIL: Quiz(
                id: homeController.homeScreenResponseModel?.mostPlayedQuiz?.id,
                title:
                    homeController.homeScreenResponseModel?.mostPlayedQuiz?.title,
                description: homeController
                    .homeScreenResponseModel?.mostPlayedQuiz?.description,
                category: homeController
                    .homeScreenResponseModel?.mostPlayedQuiz?.category,
                createdAt: homeController
                    .homeScreenResponseModel?.mostPlayedQuiz?.createdAt,
                updatedAt: homeController
                    .homeScreenResponseModel?.mostPlayedQuiz?.updatedAt,
                    standard: '',
                    level: ''
              )
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
        Stack(children: [
          Image.asset(
            "assets/images/featured_bg.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text("FEATURED",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.white.withOpacity(0.8))),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          "Take part in the challenges\nwith friends or other\nplayers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.white)),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                        height: 32,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "🤘 Find Friends",
                            style: TextStyle(color: ThemeColor.primary),
                          ),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            backgroundColor: ThemeColor.white,
                          ),
                        )),
                  ]))
        ]),
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
                                Get.toNamed(AppRoutes.quizDetailPage, arguments: {
                                  ARG_QUIZ_DETAIL: homeController
                                      .homeScreenResponseModel?.quizzes?[index]
                                });
                              },
                              child: QuizItemContainer(
                                  dataObj: homeController
                                      .homeScreenResponseModel?.quizzes?[index]));
                        })
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
                    Get.toNamed(AppRoutes.eventDetailsPage, arguments: {
                      ARG_QUIZ_DETAIL:
                          // feedController.feedScreenResponseModel?.posts?[index]
                          feedController.posts[index]
                    });
                  },
                  child: PostCard(
                      // post: feedController.feedScreenResponseModel!.posts[index])
                      post: feedController.posts[index]));
            }),
        SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                feedController.incrementSkip();
                feedController.getFeedScreenDetails();
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
}
