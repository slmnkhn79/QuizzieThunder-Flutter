import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/discover/event_card.dart';
import 'package:quizzie_thunder/modules/discover/school_discover_controller.dart';
import 'package:quizzie_thunder/models/all_quiz_response_model.dart';
import 'package:quizzie_thunder/modules/discover/search_controller.dart';
import 'package:quizzie_thunder/modules/home/post_card/post_card.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import 'discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

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
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        //fiters the current feed for the applied filted
        floatingActionButton: Obx(() => Visibility(
            visible: discoverController.selectedTabIndex == 0,
            child: Padding(
              child: FloatingActionButton(
                backgroundColor: ThemeColor.primary,
                foregroundColor: ThemeColor.lightSalmon,
                onPressed: () {
                  openDialog();
                },
                child: Icon(Icons.filter_alt_outlined),
              ),
              padding: EdgeInsets.only(bottom: 44.0),
            ))),
        backgroundColor: ThemeColor.primary,
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
                      child: Column(children: [
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
                                    discoverController.selectedTabIndex.value =
                                        0;
                                  },
                                  child: discoverController
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
                                            "Schools",
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
                                            "Schools",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ThemeColor.white
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    discoverController.selectedTabIndex.value =
                                        1;
                                  },
                                  child: discoverController
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
                                            "Quiz",
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
                                            "Quiz",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ThemeColor.white
                                                    .withOpacity(0.6),
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
                      discoverController.selectedTabIndex == 0
                          ? schoolDicover(schoolDiscoverController)
                          : quizDiscover(discoverController)
                    ])),
            )));
  }

  Column quizDiscover(DiscoverController discoverController) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.quizDetailPage, arguments: {
                    ARG_QUIZ_DETAIL: Quiz(
                        id: discoverController
                            .discoverScreenResponseModel?.topPicQuiz?.id,
                        title: discoverController
                            .discoverScreenResponseModel?.topPicQuiz?.title,
                        description: discoverController
                            .discoverScreenResponseModel
                            ?.topPicQuiz
                            ?.description,
                        category: Category(
                            id: discoverController.discoverScreenResponseModel
                                ?.topPicQuiz?.category?.id,
                            title: discoverController
                                .discoverScreenResponseModel
                                ?.topPicQuiz
                                ?.category
                                ?.title,
                            createdAt: discoverController
                                .discoverScreenResponseModel
                                ?.topPicQuiz
                                ?.category
                                ?.createdAt,
                            updatedAt: discoverController
                                .discoverScreenResponseModel
                                ?.topPicQuiz
                                ?.category
                                ?.updatedAt),
                        createdAt: discoverController
                            .discoverScreenResponseModel?.topPicQuiz?.createdAt,
                        updatedAt:
                            discoverController.discoverScreenResponseModel?.topPicQuiz?.updatedAt)
                  });
                },
                child: Stack(children: [
                  Image.asset(
                    "assets/images/top_pick_bg.png",
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
                                "${discoverController.discoverScreenResponseModel?.topPicQuiz?.title}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.burgundy)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${discoverController.discoverScreenResponseModel?.topPicQuiz?.category?.title} - 10 Questions",
                                style: TextStyle(
                                    fontSize: 12, color: ThemeColor.burgundy))
                          ])),
                ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: discoverController
                              .discoverScreenResponseModel?.weekTopRank !=
                          null,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                  "${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.profilePic}",
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
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.firstname} ${discoverController.discoverScreenResponseModel?.weekTopRank?.user?.lastname}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColor.white),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "${discoverController.discoverScreenResponseModel?.weekTopRank?.points} points",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: ThemeColor.white),
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
                      itemCount: discoverController
                          .discoverScreenResponseModel?.quizCategories?.length,
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
                                  ARG_QUIZ_CATEGORY_ID: discoverController
                                      .discoverScreenResponseModel
                                      ?.quizCategories?[index]
                                      .id,
                                  ARG_QUIZ_CATEGORY_NAME: discoverController
                                      .discoverScreenResponseModel
                                      ?.quizCategories?[index]
                                      .title
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    "${discoverController.discoverScreenResponseModel?.quizCategories?[index].title}",
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
                                    "${discoverController.discoverScreenResponseModel?.quizCategories?[index].quizCount} Quizzes",
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
          height: 24,
        ),
      ],
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
              color: ThemeColor.primaryDark,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            color: ThemeColor.lightPrimary,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  onChanged: (value) {
                    // SearchResultsController searchController = Get.find<SearchResultsController>();
                    searchController.getSearchResults(value);
                    print(value);
                  },
                ),
              ),
              //results value
              // SingleChildScrollView(
              // child:
              // ListView.builder(itemBuilder: (context, index){
              //   SearchResultsController searchController = Get.find<SearchResultsController>();
              //   return ElevatedButton(onPressed: (){}, child:
              //   Text(
              //     searchController.searchDialogResponseModel!.searchResults[index].displayValue
              //   ));
              // }
              // ,itemCount:10
              // //  searchController.searchDialogResponseModel!.searchResults!.length,
              // ),

              // Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Column(children: [
              //       Text('Results'),
              //       if (searchController.searchDialogResponseModel != null &&
              //           searchController.isLoading == false &&
              //           searchController.searchDialogResponseModel!
              //                   .searchResults!.length >
              //               0)
              //         ...searchController
              //             .searchDialogResponseModel!.searchResults!
              //             .map((e) => Text(e.displayValue))
              //     ])), // ),

              // selection
              Text("One"),
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
              ),
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
