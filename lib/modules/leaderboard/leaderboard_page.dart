
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/main.dart';
import 'package:quizzie_thunder/models/school_leaderboard_screen_response_model.dart';
import 'package:quizzie_thunder/modules/leaderboard/school_leaderboard_controller.dart';
import 'package:quizzie_thunder/modules/videos/play_video/play_video_page.dart';
import 'package:quizzie_thunder/routes/app_pages.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../../models/leaderboard_screen_response_model.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import 'student_leaderboard_controller.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    LeaderboardController leaderboardController =
        Get.find<LeaderboardController>();
    SchoolLeaderboardController schoolLeaderboardController =
        Get.find<SchoolLeaderboardController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Leaderboard",
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
                leaderboardController.getLeaderboardScreenDetails();
              },
              child: leaderboardController.isLoading.value &&
                      schoolLeaderboardController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.white,
                    ))
                  : Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width > 600
                            ? 600
                            : MediaQuery.of(context).size.width,
                        child: Container(
                          color: ThemeColor.headerThree,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.headerOne,
                                      borderRadius: BorderRadius.circular(16)),
                                  // padding: const EdgeInsets.all(4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            leaderboardController
                                                .selectedTabIndex.value = 0;
                                          },
                                          child: leaderboardController
                                                      .selectedTabIndex.value ==
                                                  0
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ThemeColor.headerTwo,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Schools",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: ThemeColor
                                                            .facebook_light_4,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                              : Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Schools",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: ThemeColor
                                                            .facebook_light_4,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            leaderboardController
                                                .selectedTabIndex.value = 1;
                                          },
                                          child: leaderboardController
                                                      .selectedTabIndex.value ==
                                                  1
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ThemeColor.headerTwo,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Students",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: ThemeColor
                                                            .facebook_light_4,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                              : Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Students",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: ThemeColor
                                                            .facebook_light_4,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              leaderboardController.selectedTabIndex.value == 0
                                  ? schoolLeaderboard(
                                      schoolLeaderboardController,
                                      context) //schools
                                  : allTimeLeaderboard(
                                      leaderboardController, context) //students
                            ],
                          ),
                        ),
                      ),
                    ),
            )));
  }

  Expanded allTimeLeaderboard(
      LeaderboardController leaderboardController, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: leaderboardController
                    .leaderboardScreenResponseModel?.allTimeLeaderboard == 0
            ? Container(
                child: Column(
                children: [Text("Be the first to apper here!")],
              ))
            : SizedBox(
                width: MediaQuery.of(context).size.width > 600
                    ? 600
                    : MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/all_time_leaderboard_bg.png",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    leaderboardController
                                                .leaderboardScreenResponseModel!
                                                .allTimeLeaderboard!.length  > 1
                                        ? allTimeWinnerInfo(
                                            leaderboardController
                                                .leaderboardScreenResponseModel
                                                ?.allTimeLeaderboard?[1])
                                        : Container(),
                                  ],
                                ),
                                leaderboardController
                                            .leaderboardScreenResponseModel
                                            ?.allTimeLeaderboard?.isNotEmpty == true                                        
                                    ? allTimeWinnerInfo(leaderboardController
                                        .leaderboardScreenResponseModel
                                        ?.allTimeLeaderboard?[0])
                                    : Container(),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 64,
                                    ),
                                    leaderboardController
                                                .leaderboardScreenResponseModel!
                                                .allTimeLeaderboard!
                                                .length > 2
                                            
                                        ? allTimeWinnerInfo(
                                            leaderboardController
                                                .leaderboardScreenResponseModel
                                                ?.allTimeLeaderboard![2])
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 24),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          decoration: BoxDecoration(
                              color: ThemeColor.facebook_light_3,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 12);
                              },
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: leaderboardController
                                      .leaderboardScreenResponseModel
                                      ?.allTimeLeaderboard
                                      ?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Get.toNamed('/publicProfile',arguments: {ARG_STUDENT_ID:leaderboardController.leaderboardScreenResponseModel?.allTimeLeaderboard?[index]?.user?.id});
                                  },
                                  child: userQuizPointsInfoContainter(
                                      index,
                                      leaderboardController
                                          .leaderboardScreenResponseModel
                                          ?.allTimeLeaderboard?[index]),
                                );
                              }),
                        )),
                  ],
                ),
              ),
      ),
    );
  }

  Column allTimeWinnerInfo(Leaderboard? leaderboard) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppUtils.getRandomAvatarBgColor(),
          radius: 24,
          child: ClipOval(
            child: CachedNetworkImage(
              imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
              imageUrl: "${leaderboard?.user?.profilePic}",
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
          height: 16,
        ),
        Text(
          "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}"
                      .length >
                  10
              ? "${"${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}".substring(0, 10)}..."
              : "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}",
          style: TextStyle(
              color: ThemeColor.facebook_light_4,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColor.headerOne,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "${leaderboard?.points} QP",
            style: TextStyle(
                color: ThemeColor.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Expanded schoolLeaderboard(
      SchoolLeaderboardController schoolLeaderBoardController,
      BuildContext context) {
    return schoolLeaderBoardController.isLoading.value
        ? Expanded(
            child: SizedBox(
                width: MediaQuery.of(context).size.width > 600
                    ? 600
                    : MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: Center(
                    child: const CircularProgressIndicator(),
                  ),
                )))
        : Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 600
                  ? 600
                  : MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: schoolLeaderBoardController
                              .schoolLeaderboardScreenResponseModel
                              ?.schoolLeaderboard
                              ?.isEmpty ==
                          true
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          decoration: BoxDecoration(
                              color: ThemeColor.headerThree,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "No data available for this week",
                              style: TextStyle(color: ThemeColor.textPrimary),
                            ),
                          ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width > 600
                              ? 600
                              : MediaQuery.of(context).size.width,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 12),
                            decoration: BoxDecoration(
                                color: ThemeColor.headerTwo,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListView.separated(
                                // physics: NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 12);
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: schoolLeaderBoardController
                                        .schoolLeaderboardScreenResponseModel
                                        ?.schoolLeaderboard
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  //  return Container(color: Colors.red);
                                  // return userQuizPointsInfoContainter(
                                  //     index,
                                  //     leaderboardController.leaderboardScreenResponseModel
                                  //         ?.weeklyLeaderboard?[index]);
                                  return schoolLeaderBoardContainer(
                                      index,
                                      schoolLeaderBoardController
                                          .schoolLeaderboardScreenResponseModel
                                          ?.schoolLeaderboard?[index]);
                                }),
                          ),
                        )),
            ),
          );
  }

  Container userQuizPointsInfoContainter(int index, Leaderboard? leaderboard) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.facebook_light_4,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ThemeColor.grey_400,
                      )),
                  child: Text(
                    "${index + 1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.grey_600),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  backgroundColor: AppUtils.getRandomAvatarBgColor(),
                  radius: 24,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                      imageUrl: "${leaderboard?.user?.profilePic}",
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${leaderboard?.points} points",
                        style:
                            TextStyle(fontSize: 14, color: ThemeColor.grey_500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: index < 3,
            child: Image.asset(
              index == 0
                  ? "assets/images/gold_badge.png"
                  : index == 1
                      ? "assets/images/silver_badge.png"
                      : "assets/images/bronze_badge.png",
              width: 28,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  InkWell schoolLeaderBoardContainer(
      int index, SchoolLeaderboard? schoolLeaderboard) {
    return InkWell(
      onTap: () {
        Get.toNamed('/schoolDetails',
            arguments: {ARG_SCHOOL_DETAIL: schoolLeaderboard!.school.id});
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ThemeColor.facebook_light_4,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ThemeColor.grey_400,
                          )),
                      child: Text(
                        "${index + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.grey_600),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    CircleAvatar(
                      backgroundColor: AppUtils.getRandomAvatarBgColor(),
                      radius: 24,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                          imageUrl: "${schoolLeaderboard?.school.profilePic}",
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${schoolLeaderboard?.school.schoolName}",
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.black),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${schoolLeaderboard?.points} points",
                            style: TextStyle(
                                fontSize: 14, color: ThemeColor.grey_500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: index < 3,
                child: Image.asset(
                  index == 0
                      ? "assets/images/gold_badge.png"
                      : index == 1
                          ? "assets/images/silver_badge.png"
                          : "assets/images/bronze_badge.png",
                  width: 28,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
