import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import 'package:quizzie_thunder/modules/videos/all_videos_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class AllVideosPage extends StatelessWidget {
  const AllVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllVideosController allVideosController = Get.find<AllVideosController>();
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
      backgroundColor: ThemeColor.facebook_light_4,
      body: Obx(() => RefreshIndicator(
          onRefresh: () async {
            allVideosController.getAllVideos();
          },
          child: allVideosController.isLoading.value
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
                        child: getAllVideosContainer(
                            context, allVideosController)),
                  ),
                ))),
    );
  }

  Container getAllVideosContainer(
      BuildContext context, AllVideosController allVideosController) {
    return Container(
      color: ThemeColor.headerThree,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      Text("Filters",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: allVideosController
                      .allVideosReponseModel!.videos.length, // Number of cards
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = allVideosController
                        .allVideosReponseModel!.videos[index];
                    return Container(
                      height: 80.0,
                      // Adjust according to your needs
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0), // Space between cards
                      child: InkWell(
                        onTap: () {
                          //play the video in next page
                           Get.toNamed('/videoById',
                            arguments: {ARG_VIDEO_ID: item.id});
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
                                item.title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              subtitle: Text(" Duration : ${item.duration}"),
                              trailing: SizedBox(
                                  height: 100,
                                  width: 140,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                          imageUrl: item.thumbnail!),
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
          )),
    );
  }
}
