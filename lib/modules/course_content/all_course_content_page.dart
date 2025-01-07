import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/books/all_books_controller.dart';
import 'package:quizzie_thunder/modules/course_content/all_course_content_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class AllCourseContentPage extends StatelessWidget {
  const AllCourseContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllCourseContentController allCourseContentController = Get.find<AllCourseContentController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Books",
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
              allCourseContentController.getAllCourseContent();
            },
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : MediaQuery.of(context).size.width,
                  child: Container(
                    color: ThemeColor.headerThree,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: allCourseContentController.isLoading.value
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: ThemeColor.white,
                              )),
                            )
                          : getAllCourseContainer(context, allCourseContentController),
                    ),
                  ),
                ),
              ),
            ))));
  }

  Column getAllCourseContainer(
      BuildContext context, AllCourseContentController allCourseContentController) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text("Filters"),
        ),
        Divider(),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
                itemCount:
                    allCourseContentController.allCourseContentResponseModel!.courses!.length,
                itemBuilder: (context, index) {
                  var item =
                      allCourseContentController.allCourseContentResponseModel!.courses![index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/courseById',
                          arguments: {ARG_COURSE_CONTENT_ID: item.id});
                    },
                    child: SizedBox(
                      height: 80.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.picture_as_pdf, color: Colors.amber[900],),
                              title: Text(item.topicName, style: TextStyle(color: ThemeColor.headerOne,  fontWeight:  FontWeight.bold)),
                              trailing: Text("Read..."),
                              subtitle: Text("${item.standard} Standard"),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
