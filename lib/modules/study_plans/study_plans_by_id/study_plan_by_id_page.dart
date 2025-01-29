import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/markdown_view.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_by_id/study_plan_by_id_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class StudyPlanByIdPage extends StatelessWidget {
  const StudyPlanByIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudyPlanByIdController studyPlanByIdController =
        Get.find<StudyPlanByIdController>();
    return Scaffold(
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
          "Learning Paths",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColor.white),
        ),
        backgroundColor: ThemeColor.headerOne,
        centerTitle: false,
        elevation: 0,
      ),
      body: Obx(() => RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : MediaQuery.of(context).size.width,
                  child: Container(
                    color: ThemeColor.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: getStudyPlanContainer(
                          context, studyPlanByIdController),
                    ),
                  )),
            ),
          ))),
    );
  }

  Container getStudyPlanContainer(
      BuildContext context, StudyPlanByIdController studyPlanByIdController) {
    return Container(
      child: studyPlanByIdController.isLoading.value
          ? SizedBox(
              width: MediaQuery.of(context).size.width > 600
                  ? 600
                  : MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: CircularProgressIndicator(
                color: ThemeColor.headerOne,
              )),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // formatText("**salman** this is test -**khan**"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: studyPlanByIdController.studyPlanResponseModel!
                      .plan!.planAttributes['data'].length,
                  itemBuilder: (context, index) {
                    final item = studyPlanByIdController
                        .studyPlanResponseModel!
                        .plan!
                        .planAttributes['data'][index];
                    switch (item['type']) {
                      case 'title':
                        return MainTitle(item['heading']);
                      case 'heading':
                        return SecondaryTitle(
                            item['heading'], item['content']);
                      case 'subheading':
                        return TertiaryTitle(
                            item['heading'], item['content']);
                      case 'content':
                        return Content(item['heading'], item['content']);
                      case 'material_title':
                        return MaterialTitle(
                            item['heading'], item['content']);
                      default:
                        return Container();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: ThemeColor.headerOne,
                      ),
                      child: Text('Complete Quiz',
                          style: TextStyle(color: ThemeColor.headerThree)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
