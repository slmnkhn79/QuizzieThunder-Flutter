import 'dart:math';
import 'dart:ui';
import 'package:animated_gradient/animated_gradient.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/discover/event_card.dart';
import 'package:quizzie_thunder/modules/discover/learning_discover_controller.dart';
import 'package:quizzie_thunder/models/all_quiz_response_model.dart';
import 'package:quizzie_thunder/modules/discover/search_controller.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import 'school_discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    DiscoverController discoverController = Get.find<DiscoverController>();

    LearningDiscoverController learningDiscoverController =
        Get.find<LearningDiscoverController>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: true,
          elevation: 0,
        ),
        //fiters the current feed for the applied filted
        floatingActionButton: Obx(() => Visibility(
            visible: discoverController.selectedTabIndex.value == 0 ||
                discoverController.selectedTabIndex.value == 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 44.0),
              child: FloatingActionButton(
                backgroundColor: ThemeColor.headerOne,
                foregroundColor: ThemeColor.headerThree,
                onPressed: () {
                  // openDialog();
                },
                child: Icon(Icons.filter_alt_outlined),
              ),
            ))),
        backgroundColor: ThemeColor.facebook_light_4,
        body: Obx(() => RefreshIndicator(
              onRefresh: () async {
                discoverController.getDiscoverScreenDetails();
              },
              child: discoverController.isLoading.value &&
                      learningDiscoverController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.white,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                                            discoverController
                                                .selectedTabIndex.value = 0;
                                          },
                                          child: discoverController
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
                                                    "Learning",
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
                                                    "Learning",
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
                                            discoverController
                                                .selectedTabIndex.value = 1;
                                          },
                                          child: discoverController
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              discoverController.selectedTabIndex.value == 0
                                  ? learningPath(
                                      learningDiscoverController, context)
                                  : schoolFilter(discoverController, context)
                            ]),
                          ),
                        ),
                      ),
                    )),
            )));
  }

  Container schoolFilter(
      DiscoverController discoverController, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/schoolDetails', arguments: {
                      ARG_SCHOOL_DETAIL: discoverController
                          .discoverScreenResponseModel!.topSchool!.id
                    });
                  },
                  child: Stack(children: [
                    Image.network(
                      discoverController.discoverScreenResponseModel!.topSchool!
                          .headerImageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      top: 200,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: EdgeInsets.only(right: 24),
                            color: ThemeColor.facebook_light_4,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // SizedBox(
                                  //   height: 84,
                                  // ),
                                  Text(
                                      "${discoverController.discoverScreenResponseModel?.topSchool!.name}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.burgundy)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "${discoverController.discoverScreenResponseModel?.topSchool!.schoolType} ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ThemeColor.burgundy)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ]),
                          )),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                        itemCount: discoverController
                            .discoverScreenResponseModel?.schools?.length,
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
                                  Get.toNamed('/schoolDetails', arguments: {
                                    ARG_SCHOOL_DETAIL: discoverController
                                        .discoverScreenResponseModel!
                                        .schools![index]
                                        .id
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(discoverController
                                        .discoverScreenResponseModel!
                                        .schools![index]
                                        .headerImageUrl),
                                    // Icon(
                                    //   Icons.science_outlined,
                                    //   size: 36,
                                    //   color: ThemeColor.white,
                                    // ),
                                    // SizedBox(
                                    //   height: 16,
                                    // ),
                                    Text(
                                      "${discoverController.discoverScreenResponseModel?.schools?[index].name}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ThemeColor.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // SizedBox(
                                    //   height: 4,
                                    // ),
                                    Text(
                                      "${discoverController.discoverScreenResponseModel?.schools?[index].schoolType}",
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
                    ])),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  // Column schoolDicover(learningDiscoverController learningDiscoverController) {
  //   return Column(
  //     children: [
  //       //top liked event of nearby school or filtered schools
  //       AddSpacer("Top Event"),
  //       Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 Get.toNamed(AppRoutes.postDetailsPage, arguments: {
  //                   ARG_POST_ID: learningDiscoverController
  //                       .schoolDiscoverScreenResponseModel!.mostLiked!.id,
  //                   // ARG_POST_CONTROLLER: feedController,
  //                 });
  //               },
  //               child: Stack(children: [
  //                 learningDiscoverController
  //                             .schoolDiscoverScreenResponseModel!.mostLiked ==
  //                         null
  //                     ? Container()
  //                     : Image.network(
  //                         learningDiscoverController
  //                             .schoolDiscoverScreenResponseModel!
  //                             .mostLiked!
  //                             .imageUrl!,
  //                         width: double.infinity,
  //                         fit: BoxFit.cover,
  //                       ),
  //                 Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           SizedBox(
  //                             height: 84,
  //                           ),
  //                           Text(
  //                               "${learningDiscoverController.schoolDiscoverScreenResponseModel?.mostLiked?.title}",
  //                               style: TextStyle(
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: ThemeColor.burgundy)),
  //                           SizedBox(
  //                             height: 8,
  //                           ),
  //                           Text(
  //                               "${learningDiscoverController.schoolDiscoverScreenResponseModel?.mostLiked?.caption}",
  //                               style: TextStyle(
  //                                   fontSize: 12, color: ThemeColor.burgundy))
  //                         ])),
  //               ]),
  //             ),
  //           ],
  //         ),
  //       ),
  //       //recent activity by schools top 10 activites  or filtered schools

  //       AddSpacer("Top Activities"),

  //       ListView.separated(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           separatorBuilder: (BuildContext context, int index) {
  //             return SizedBox(height: 8);
  //           },
  //           scrollDirection: Axis.vertical,
  //           itemBuilder: (context, index) {
  //             return InkWell(
  //               onTap: () {
  //                 Get.toNamed(AppRoutes.postDetailsPage, arguments: {
  //                   ARG_POST_ID: learningDiscoverController
  //                       .schoolDiscoverScreenResponseModel!
  //                       .recentActivity![index]
  //                       .id,
  //                   // ARG_POST_CONTROLLER: feedController,
  //                 });
  //               },
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 8.0, horizontal: 16.0),
  //                 child: EventCard(
  //                   // post: feedController.feedScreenResponseModel!.posts[index])
  //                   post: learningDiscoverController
  //                       .schoolDiscoverScreenResponseModel!
  //                       .recentActivity![index],
  //                   learningDiscoverController: learningDiscoverController,
  //                 ),
  //               ),
  //             );
  //           },
  //           itemCount: learningDiscoverController
  //               .schoolDiscoverScreenResponseModel!.recentActivity!.length),
  //       //upcoming events of nearby school or filtered schools
  //       // upComingEventsDicover(learningDiscoverController)
  //     ],
  //   );
  // }

  Column AddSpacer(String head) {
    return Column(children: [
      SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: ThemeColor.headerOne,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            color: ThemeColor.headerOne,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          head,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ThemeColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                    // : Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 16, vertical: 8),
                    //     child: Text(
                    //       "Nearby",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           color: ThemeColor.white.withOpacity(0.6),
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 16,
      )
    ]);
  }

  // Column upComingEventsDicover(
  //     learningDiscoverController learningDiscoverController) {
  //   return Column(
  //     children: [
  //       //top liked event of nearby school or filtered schools
  //       AddSpacer("Upcoming Event"),

  //       // ListView.separated(
  //       //     shrinkWrap: true,
  //       //     physics: NeverScrollableScrollPhysics(),
  //       //     separatorBuilder: (BuildContext context, int index) {
  //       //       return SizedBox(height: 8);
  //       //     },
  //       //     scrollDirection: Axis.vertical,
  //       //     itemBuilder: (context, index) {
  //       //       return Padding(
  //       //         padding:
  //       //             const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //       //         child: EventCard(
  //       //             // post: feedController.feedScreenResponseModel!.posts[index])
  //       //             post: learningDiscoverController
  //       //                 .schoolDiscoverScreenResponseModel!
  //       //                 .recentActivity![index]),
  //       //       );
  //       //     },
  //       //     itemCount: learningDiscoverController
  //       //         .schoolDiscoverScreenResponseModel!.recentActivity!.length
  //       //         ),
  //       //upcoming events of nearby school or filtered schools
  //     ],
  //   );
  // }

  // void openDialog() {
  //   SearchResultsController searchController =
  //       Get.find<SearchResultsController>();
  //   Get.dialog(Dialog(
  //     child: SizedBox(
  //       height: 600,
  //       width: 600,
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             //filter input
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: TextField(
  //                 // controller:  searchController,
  //                 decoration: InputDecoration(
  //                   hintText: 'Start typing!',
  //                   border: OutlineInputBorder(),
  //                 ),
  //                 onChanged: (value) async {
  //                   if (value.length >= 3) {
  //                     await searchController.getSearchResults(value);
  //                     // print(value);
  //                   }
  //                 },
  //               ),
  //             ),

  //             Obx(() => searchController.isLoading.value == false &&
  //                     searchController
  //                         .searchDialogResponseModel!.searchResults.isNotEmpty
  //                 ? Expanded(
  //                     child: GridView(
  //                         gridDelegate:
  //                             SliverGridDelegateWithFixedCrossAxisCount(
  //                           mainAxisExtent: 44,
  //                           mainAxisSpacing: 10.0,
  //                           crossAxisCount: 4,
  //                           crossAxisSpacing: 10.0,
  //                           childAspectRatio: 1.0,
  //                         ),
  //                         children: [
  //                         ...searchController
  //                             .searchDialogResponseModel!.searchResults
  //                             .map((e) {
  //                           return ElevatedButton(
  //                               onPressed: () {}, child: Text(e.displayValue));
  //                         })
  //                       ]))
  //                 : SizedBox(
  //                     height: 60,
  //                     width: double.infinity,
  //                     // child: Container(color: Colors.red)
  //                   )),

  //             // selection
  //             Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 8.0, horizontal: 16.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Divider(),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: <Widget>[
  //                         ElevatedButton(
  //                           onPressed: () {
  //                             Get.back();
  //                           },
  //                           child: Text('Close'),
  //                         ),
  //                         ElevatedButton(
  //                           onPressed: () {
  //                             // Apply filter logic here
  //                           },
  //                           child: Text('Apply'),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ))
  //           ]),
  //     ),
  //   )

  // AlertDialog(
  //   title: const Text('Dialog'),
  //   content: const Text('This is a dialog'),
  //   actions: [
  // TextButton(
  //   child: const Text("Close"),
  //   onPressed: () => Get.back(),
  // ),
  //   ],
  // ),
  // );
  // }
  Column learningPath(LearningDiscoverController learningDiscoverController,
      BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        learningPathCards(learningDiscoverController, context),
        Divider(),
        studyPlan(learningDiscoverController, context),
        Divider(),
        mentorVideos(learningDiscoverController, context),
        Divider(),
        booksContainer(learningDiscoverController, context)
      ],
    );
  }

  Column learningPathCards(
      LearningDiscoverController learningDiscoverController,
      BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Learning paths",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed('/learnings',
                          arguments: {ARG_IS_LEARNING_PATH: true});
                    },
                    child: Text("See all",
                        style: TextStyle(color: Colors.blue[400])))
              ],
            ),
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 80.0,
            child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: ScrollConfiguration(
                behavior: HorizontalScrollBehavior(),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: learningDiscoverController
                        .discoverLearningResponseModel!
                        .data
                        .learnings
                        .length, // Number of cards
                    itemBuilder: (context, index) {
                      var item = learningDiscoverController
                          .discoverLearningResponseModel!.data.learnings[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/learningsPathById',
                              arguments: {ARG_LEARNING_PATH_ID: item.id});
                        },
                        child: Container(
                          width: 150.0, // Adjust according to your needs
                          // margin: EdgeInsets.symmetric(
                          //     horizontal: 8.0), // Space between cards

                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(4), // No border radius
                            ),
                            elevation: 4.0,
                            child: AnimatedGradient(
                              colors: AppUtils.getRandomGradient(index),
                              child: Center(
                                child: ListTile(
                                  isThreeLine: true,
                                  title: Text(
                                    item.pathName,
                                    style: TextStyle(
                                      color: AppUtils.getRandomShadeOfWhite(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  subtitle: Text('Some Description',
                                      style: TextStyle(
                                        color: AppUtils.getRandomShadeOfWhite(),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  // trailing:  Icon(Icons.navigate_next_rounded),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )),
      ],
    );
  }

  Container studyPlan(LearningDiscoverController learningDiscoverController,
      BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Study plans",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                  InkWell(
                      onTap: () {
                        //open all the learning paths
                        Get.toNamed(
                          '/allStudyPlans',
                        );
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(color: Colors.blue[400]),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width > 600
                  ? 600
                  : MediaQuery.of(context).size.width,
              height: 300.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ScrollConfiguration(
                  behavior: NoScrollBarScrollBehavior(),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2),
                      itemCount: learningDiscoverController
                          .discoverLearningResponseModel!
                          .data
                          .studyPlans
                          .length, // Number of cards
                      itemBuilder: (context, index) {
                        var item = learningDiscoverController
                            .discoverLearningResponseModel!
                            .data
                            .studyPlans[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed('/studyPlansById',
                                arguments: {ARG_STUDY_PLAN_ID: item.id});
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(4), // No border radius
                            ),
                            elevation: 4.0,
                            child: AnimatedGradient(
                              colors: AppUtils.getRandomGradient(index),
                              child: Center(
                                child: ListTile(
                                  title: Text(item.planName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  leading: Text(item.standard),
                                  trailing: Icon(Icons.not_started_outlined),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )),
        ],
      ),
    );
  }

  SizedBox mentorVideos(LearningDiscoverController learningDiscoverController,
      BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width,
        // height: 500.0,
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Must watch videos",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        )),
                    InkWell(
                        onTap: () {
                          //open all the learning paths
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.blue[400]),
                        ))
                  ],
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: learningDiscoverController
                    .discoverLearningResponseModel!
                    .data
                    .videos
                    .length, // Number of cards
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = learningDiscoverController
                      .discoverLearningResponseModel!.data.videos[index];
                  return Container(
                    height: 80.0,
                    // Adjust according to your needs
                    margin: EdgeInsets.symmetric(
                        horizontal: 8.0), // Space between cards
                    child: InkWell(
                      onTap: () {
                        //play the video in next page
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4), // No border radius
                        ),
                        elevation: 4.0,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text(" Duration : ${item.duration}"),
                            trailing: SizedBox(
                                height: 100,
                                width: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl: item.thumbnail),
                                    Icon(Icons.play_circle_fill_sharp)
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ));
  }

  SizedBox booksContainer(LearningDiscoverController learningDiscoverController,
      BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width > 500
            ? 500
            : MediaQuery.of(context).size.width,
        height: 500.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Books",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text("See all",
                            style: TextStyle(color: Colors.blue[400])))
                  ],
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: learningDiscoverController
                    .discoverLearningResponseModel!
                    .data
                    .books
                    .length, // Number of cards
                itemBuilder: (context, index) {
                  var item = learningDiscoverController
                      .discoverLearningResponseModel!.data.books[index];
                  return InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      height: 70.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(item.bookName),
                              trailing: Text("Read..."),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}

class HorizontalScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class NoScrollBarScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // Removing scrollbars by returning the child directly
  }
}
