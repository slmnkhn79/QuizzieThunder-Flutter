import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_by_id/study_plan_by_id_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class StudyPlanByIdPage extends StatelessWidget {
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
                    color: ThemeColor.headerThree,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          ? Center(
              child: CircularProgressIndicator(
              color: ThemeColor.headerOne,
            ))
          : Text(studyPlanByIdController.studyPlanResponseModel!.plan!.id),
    );
  }
}
