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
import 'discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    DiscoverController discoverController = Get.find<DiscoverController>();
    SchoolDiscoverController schoolDiscoverController =
        Get.find<SchoolDiscoverController>();

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
        floatingActionButton: Obx(() => 
        Visibility(
            visible: discoverController.selectedTabIndex.value == 0 || discoverController.selectedTabIndex.value == 1 ,
            child: Padding(
              padding: EdgeInsets.only(bottom: 44.0),
              child: FloatingActionButton(
                backgroundColor: ThemeColor.headerOne,
                foregroundColor: ThemeColor.headerThree,
                onPressed: () {
                  openDialog();
                },
                child: Icon(Icons.filter_alt_outlined),
              ),
            ))
            ),
        backgroundColor: ThemeColor.facebook_light_4,
        body: Obx(() => RefreshIndicator(
              onRefresh: () async {
                discoverController.getDiscoverScreenDetails();
              },
              child: discoverController.isLoading.value
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
                                                    "Recent",
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
                                                    "Recent",
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
                              discoverController.selectedTabIndex == 0
                                  ? schoolDicover(schoolDiscoverController)
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
                                        .discoverScreenResponseModel!
                                        .topSchool.id
                                  });
                  },
                  child: Stack(children: [
                    Image.network(
                      discoverController.discoverScreenResponseModel!.topSchool
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
                                      "${discoverController.discoverScreenResponseModel?.topSchool.name}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.burgundy)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "${discoverController.discoverScreenResponseModel?.topSchool.schoolType} ",
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
                      // Visibility(
                      //   visible: discoverController
                      //           .discoverScreenResponseModel?.weekTopRank !=
                      //       null,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Top rank of the week",
                      //         style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: ThemeColor.black),
                      //       ),
                      //       SizedBox(
                      //         height: 8,
                      //       ),
                      //       Stack(children: [
                      //         Image.asset(
                      //           "assets/images/top_rank_bg.png",
                      //           width: double.infinity,
                      //           fit: BoxFit.cover,
                      //         ),
                      //         Padding(
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Column(
                      //               children: [
                      //                 SizedBox(
                      //                   height: 24,
                      //                 ),
                      //                 Row(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       padding: const EdgeInsets.all(8),
                      //                       decoration: BoxDecoration(
                      //                           shape: BoxShape.circle,
                      //                           border: Border.all(
                      //                             color: ThemeColor.white,
                      //                           )),
                      //                       child: Text(
                      //                         "1",
                      //                         style: TextStyle(
                      //                             fontSize: 12,
                      //                             fontWeight: FontWeight.bold,
                      //                             color: ThemeColor.white),
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       width: 16,
                      //                     ),
                      //                     CircleAvatar(
                      //                       backgroundColor:
                      //                           AppUtils.getRandomAvatarBgColor(),
                      //                       radius: 24,
                      //                       child: ClipOval(
                      //                         child: CachedNetworkImage(
                      //                           imageUrl:
                      //                               "${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.profilePic}",
                      //                           width: double.infinity,
                      //                           height: double.infinity,
                      //                           fit: BoxFit.cover,
                      //                           placeholder: (context, url) =>
                      //                               Center(
                      //                             child: SizedBox(
                      //                               width: 20,
                      //                               height: 20,
                      //                               child:
                      //                                   CircularProgressIndicator(
                      //                                 color: ThemeColor.accent,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           errorWidget:
                      //                               (context, url, error) => Icon(
                      //                             Icons.error,
                      //                             color: ThemeColor.red,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       width: 12,
                      //                     ),
                      //                     Column(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           "${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.firstname} ${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.lastname}",
                      //                           style: TextStyle(
                      //                               fontSize: 16,
                      //                               fontWeight: FontWeight.bold,
                      //                               color: ThemeColor.white),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 4,
                      //                         ),
                      //                         Text(
                      //                           "${discoverController.discoverScreenResponseModel?.weekTopRank?.points} points",
                      //                           style: TextStyle(
                      //                               fontSize: 14,
                      //                               color: ThemeColor.white),
                      //                         ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ],
                      //             ))
                      //       ]),
                      //       SizedBox(
                      //         height: 16,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Text(
                      //   "Categories",
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       color: ThemeColor.black),
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
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
                                        .schools![index].id
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
                onTap: () {},
                child: Stack(children: [
                  Image.network(
                    schoolDiscoverController
                        .schoolDiscoverScreenResponseModel!.mostLiked!.imageUrl,
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: EventCard(
                    // post: feedController.feedScreenResponseModel!.posts[index])
                    post: schoolDiscoverController
                        .schoolDiscoverScreenResponseModel!
                        .recentActivity![index]),
              );
            },
            itemCount: schoolDiscoverController
                .schoolDiscoverScreenResponseModel!.recentActivity!.length),
        //upcoming events of nearby school or filtered schools
        upComingEventsDicover(schoolDiscoverController)
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

  Column upComingEventsDicover(
      SchoolDiscoverController schoolDiscoverController) {
    return Column(
      children: [
        //top liked event of nearby school or filtered schools
        AddSpacer("Upcoming Event"),

        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: EventCard(
                    // post: feedController.feedScreenResponseModel!.posts[index])
                    post: schoolDiscoverController
                        .schoolDiscoverScreenResponseModel!
                        .recentActivity![index]),
              );
            },
            itemCount: schoolDiscoverController
                .schoolDiscoverScreenResponseModel!.recentActivity!.length),
        //upcoming events of nearby school or filtered schools
      ],
    );
  }

  void openDialog() {
    SearchResultsController searchController =
        Get.find<SearchResultsController>();
    Get.dialog(Dialog(
      child: SizedBox(
        height: 600,
        width: 600,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //filter input
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  // controller:  searchController,
                  decoration: InputDecoration(
                    hintText: 'Start typing!',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) async {
                    if (value.length >= 3) {
                      await searchController.getSearchResults(value);
                      // print(value);
                    }
                  },
                ),
              ),

              Obx(() => searchController.isLoading.value == false &&
                      searchController
                          .searchDialogResponseModel!.searchResults.isNotEmpty
                  ? Expanded(
                      child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 44,
                            mainAxisSpacing: 10.0,
                            crossAxisCount: 4,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          children: [
                          ...searchController
                              .searchDialogResponseModel!.searchResults
                              .map((e) {
                            return ElevatedButton(
                                onPressed: () {}, child: Text(e.displayValue));
                          })
                        ]))
                  : SizedBox(
                      height: 60,
                      width: double.infinity,
                      // child: Container(color: Colors.red)
                    )),

              // selection
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Close'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Apply filter logic here
                            },
                            child: Text('Apply'),
                          ),
                        ],
                      )
                    ],
                  ))
            ]),
      ),
    )

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
        );
  }
}
