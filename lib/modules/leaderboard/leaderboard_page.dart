import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

import '../../theme/colors_theme.dart';
import 'leaderboard_controller.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaderboardController leaderboardController =
        Get.find<LeaderboardController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Leaderboard",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Obx(() => Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ThemeColor.primaryDark,
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              leaderboardController.selectedTabIndex.value = 0;
                            },
                            child: leaderboardController
                                        .selectedTabIndex.value ==
                                    0
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: ThemeColor.lightPrimary,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "Weekly",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ThemeColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ))
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "Weekly",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              ThemeColor.white.withOpacity(0.6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              leaderboardController.selectedTabIndex.value = 1;
                            },
                            child: leaderboardController
                                        .selectedTabIndex.value ==
                                    1
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: ThemeColor.lightPrimary,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "All Time",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ThemeColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ))
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "All Time",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              ThemeColor.white.withOpacity(0.6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
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
                    ? weeklyLeaderboard()
                    : allTimeLeaderboard()
              ],
            )));
  }

  Expanded allTimeLeaderboard() {
    return Expanded(
      child: SingleChildScrollView(
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
                      height: 36,
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
                            allTimeWinnerInfo(),
                          ],
                        ),
                        allTimeWinnerInfo(),
                        Column(
                          children: [
                            SizedBox(
                              height: 64,
                            ),
                            allTimeWinnerInfo(),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                      color: ThemeColor.lighterPrimary,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 16);
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return userQuizPointsInfoContainter(index);
                      }),
                )),
          ],
        ),
      ),
    );
  }

  Column allTimeWinnerInfo() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppUtils.getRandomColor(),
          radius: 24,
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Ruben Geidt",
          style: TextStyle(
              color: ThemeColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColor.lightPrimary,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "1,233 QP",
            style: TextStyle(
                color: ThemeColor.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Expanded weeklyLeaderboard() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
                color: ThemeColor.lighterPrimary,
                borderRadius: BorderRadius.circular(12)),
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16);
                },
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return userQuizPointsInfoContainter(index);
                }),
          )),
    );
  }

  Container userQuizPointsInfoContainter(int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
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
                backgroundColor: AppUtils.getRandomColor(),
                radius: 24,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Davis Curtis",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "1,124 points",
                    style: TextStyle(fontSize: 14, color: ThemeColor.coolGrey),
                  ),
                ],
              )
            ],
          ),
          Image.asset(
            "assets/images/gold_badge.png",
            width: 28,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
