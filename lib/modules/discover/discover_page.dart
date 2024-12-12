import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/discover/event_card.dart';
import 'package:quizzie_thunder/modules/discover/school_discover_controller.dart';
import 'package:quizzie_thunder/models/all_quiz_response_model.dart';
import 'package:quizzie_thunder/modules/discover/search_controller.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import 'learning_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {

    LearningController learningController = Get.find<LearningController>();

    SchoolDiscoverController schoolDiscoverController = Get.find<SchoolDiscoverController>();

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
            visible: learningController.selectedTabIndex.value == 0 ||
                learningController.selectedTabIndex.value == 1,
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
                learningController.getDiscoverScreenDetails();
              },
              child: learningController.isLoading.value && schoolDiscoverController.isLoading.value
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
                                            learningController
                                                .selectedTabIndex.value = 0;
                                          },
                                          child: learningController
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
                                            learningController
                                                .selectedTabIndex.value = 1;
                                          },
                                          child: learningController
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
                              learningController.selectedTabIndex.value == 0
                                  ? learningPath()
                                  : schoolFilter(learningController, context)
                            ]),
                          ),
                        ),
                      ),
                    )),
            )));
  }

  Container schoolFilter(
      LearningController learningController, BuildContext context) {
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
                      ARG_SCHOOL_DETAIL: learningController
                          .discoverScreenResponseModel!.topSchool.id
                    });
                  },
                  child: Stack(children: [
                    Image.network(
                      learningController.discoverScreenResponseModel!.topSchool
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
                                      "${learningController.discoverScreenResponseModel?.topSchool.name}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.burgundy)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "${learningController.discoverScreenResponseModel?.topSchool.schoolType} ",
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
                        itemCount: learningController
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
                                    ARG_SCHOOL_DETAIL: learningController
                                        .discoverScreenResponseModel!
                                        .schools![index]
                                        .id
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(learningController
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
                                      "${learningController.discoverScreenResponseModel?.schools?[index].name}",
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
                                      "${learningController.discoverScreenResponseModel?.schools?[index].schoolType}",
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

  Column schoolDicover(SchoolDiscoverController schoolDiscoverController) {
    return Column(
      children: [
        //top liked event of nearby school or filtered schools
        AddSpacer("Top Event"),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.postDetailsPage,arguments: {
                      ARG_POST_ID: schoolDiscoverController
                              .schoolDiscoverScreenResponseModel!.mostLiked!.id,
                      // ARG_POST_CONTROLLER: feedController,
                    });
                },
                child: Stack(children: [
                  schoolDiscoverController
                              .schoolDiscoverScreenResponseModel!.mostLiked ==
                          null
                      ? Container()
                      : Image.network(
                          schoolDiscoverController
                              .schoolDiscoverScreenResponseModel!
                              .mostLiked!
                              .imageUrl!,
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
                              height: 84,
                            ),
                            Text(
                                "${schoolDiscoverController.schoolDiscoverScreenResponseModel?.mostLiked?.title}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.burgundy)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${schoolDiscoverController.schoolDiscoverScreenResponseModel?.mostLiked?.caption}",
                                style: TextStyle(
                                    fontSize: 12, color: ThemeColor.burgundy))
                          ])),
                ]),
              ),
            ],
          ),
        ),
        //recent activity by schools top 10 activites  or filtered schools

        AddSpacer("Top Activities"),

        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.postDetailsPage,arguments: {
                      ARG_POST_ID: schoolDiscoverController
                          .schoolDiscoverScreenResponseModel!
                          .recentActivity![index].id,
                      // ARG_POST_CONTROLLER: feedController,
                    });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: EventCard(
                      // post: feedController.feedScreenResponseModel!.posts[index])
                      post: schoolDiscoverController
                          .schoolDiscoverScreenResponseModel!
                          .recentActivity![index] ,schoolDiscoverController: schoolDiscoverController,),
                ),
              );
            },
            itemCount: schoolDiscoverController
                .schoolDiscoverScreenResponseModel!.recentActivity!.length),
        //upcoming events of nearby school or filtered schools
        // upComingEventsDicover(schoollearningController)
      ],
    );
  }

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
  //     SchoollearningController schoollearningController) {
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
  //       //             post: schoollearningController
  //       //                 .schoolDiscoverScreenResponseModel!
  //       //                 .recentActivity![index]),
  //       //       );
  //       //     },
  //       //     itemCount: schoollearningController
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
  Column learningPath(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //card horiontal list view
        // ListView.separated(itemBuilder: (context, index){

        // }, separatorBuilder: (){
        //   return VerticalDivider()
        // }, itemCount: 10);
        //card grid view of 6 elements
        //Pages list view 
      ],
    );
  }
}
