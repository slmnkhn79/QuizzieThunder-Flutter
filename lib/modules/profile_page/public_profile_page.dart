import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/profile_page/public_profile_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:shimmer/shimmer.dart';

class PublicProfilePage extends StatelessWidget {
  const PublicProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final publicProfileController = Get.find<PublicProfileController>();

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
        body: Obx(() {
          return RefreshIndicator(
              onRefresh: () async {
                return publicProfileController.fetchProfileData();
              },
              child: publicProfileController.isLoading.value
                  ? Center(
                      child: const CircularProgressIndicator(
                        color: ThemeColor.headerOne,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width > 600
                              ? 600
                              : MediaQuery.of(context).size.width,
                          child: Container(
                            color: ThemeColor.headerThree,
                            child: Column(
                              children: [
                                Stack(
                                  // fit: StackFit.passthrough,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    CachedNetworkImage(
                                        height: 200,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        imageRenderMethodForWeb:
                                            ImageRenderMethodForWeb.HttpGet,
                                        imageUrl: publicProfileController
                                            .publicProfileScreenResponseModel!
                                            .userDetail!
                                            .headerImage!,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor: Colors.white,
                                                child: Image.asset(
                                                    height: 200,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                    "assets/images/placeholder.png")),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                              Icons.error,
                                              color: ThemeColor.red,
                                            )),
                                    Positioned(
                                      top: 120,
                                      left: 16,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                          publicProfileController
                                              .publicProfileScreenResponseModel!
                                              .userDetail!
                                              .profilePic!,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40
                                    // ,child: Container(color: ThemeColor.facebook_light_4,),
                                    ),
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  color: ThemeColor.facebook_light_4,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${publicProfileController.publicProfileScreenResponseModel!.userDetail!.firstname} ${publicProfileController.publicProfileScreenResponseModel!.userDetail!.lastname}",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              publicProfileController
                                                  .publicProfileScreenResponseModel!
                                                  .userDetail!
                                                  .school!
                                                  .schoolName!,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '${publicProfileController.publicProfileScreenResponseModel!.userDetail!.city}, ${publicProfileController.publicProfileScreenResponseModel!.userDetail!.state}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Rank ${publicProfileController.publicProfileScreenResponseModel!.userDetail!.rank}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: ThemeColor.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16,
                                      right: 16,
                                      bottom: 8),
                                  color: ThemeColor.facebook_light_4,
                                  child: Text(
                                    "About",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, left: 16, right: 16, bottom: 8),
                                  color: ThemeColor.facebook_light_4,
                                  child: Text(
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    // maxLines: 6,
                                    publicProfileController
                                        .publicProfileScreenResponseModel!
                                        .userDetail!
                                        .about!,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                skillsViewContainer(
                                    context, publicProfileController),
                                SizedBox(
                                  height: 10,
                                ),
                                interestsViewContainer(
                                    context, publicProfileController),
                                SizedBox(
                                  height: 10,
                                ),
                                schoolDetailsContainer(
                                    context, publicProfileController),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
        }));
  }

  Container skillsViewContainer(
      BuildContext context, PublicProfileController publicProfileController) {
    return Container(
      alignment: Alignment.topLeft,
      color: ThemeColor.facebook_light_4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skills',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 8),
                ...publicProfileController.publicProfileScreenResponseModel!
                    .otherAttributes!.keySkills!
                    .map((skill) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          skill['skill'],
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          skill['score'].toString(),
                          style: TextStyle(
                              fontSize: 16, color: ThemeColor.facebook_light_2),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container interestsViewContainer(
      BuildContext context, PublicProfileController publicProfileController) {
    return Container(
      alignment: Alignment.topLeft,
      color: ThemeColor.facebook_light_4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interests',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 8),
                ...publicProfileController.publicProfileScreenResponseModel!
                    .otherAttributes!.keyInterest!
                    .map((interest) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          interest['interest'],
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${interest['quiz_won']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' x quiz won',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ThemeColor.facebook_light_2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container schoolDetailsContainer(
      BuildContext context, PublicProfileController publicProfileController) {
    var school = publicProfileController
        .publicProfileScreenResponseModel!.userDetail!.school!;
    return Container(
      alignment: Alignment.topLeft,
      color: ThemeColor.facebook_light_4,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 8),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Education',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      CachedNetworkImage(imageUrl: school.logo!),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            school.schoolName!,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "${school.city!}, ${school.state!}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "${school.schoolType!}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
