import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/event_details/post_detail_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class PostDetailsPage extends StatelessWidget {
  final String eventId;
  const PostDetailsPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    PostDetailController eventDetailsController =
        Get.find<PostDetailController>();
    eventDetailsController.postId = eventId;
    return Scaffold(
        backgroundColor: ThemeColor.primary,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.white,
              )),
          title: Text(
            "Details", //add the event name here

            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              eventDetailsController.getPostDetails();
            },
            child: eventDetailsController.isLoading.value
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
                          child: Column(
                            children: [
                              Text(eventDetailsController
                                  .postDetailsResponseModel!.post.title!)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))));
  }
}
