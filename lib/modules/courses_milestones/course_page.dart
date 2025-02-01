import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/models/courseV2_response_model.dart';
import 'package:quizzie_thunder/modules/courses_milestones/course_controller.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/markdown_view.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Course Details",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColor.white),
        ),
        backgroundColor: ThemeColor.headerOne,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: ThemeColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return courseController.isLoading.value
              ? SizedBox(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.headerOne,
                    ),
                  ),
                )
              : getContent(context, courseController);
        }),
      ),
    );
  }

  getContent(BuildContext context, CourseController courseController) {
    final course = courseController.coursev2responseModel!.data;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        return true; // Prevents the default scroll behavior
      },
      child: PageView.builder(
        controller: courseController.modulePageController,
        itemCount: course.modules.length,
        itemBuilder: (context, index) {
          final module = course.modules[index];
          return ModulePage(
            module: module,
            courseController: courseController,
          );
        },
      ),
    );
  }
}

class ModulePage extends StatelessWidget {
  final Module module;
  final CourseController courseController;
  ModulePage({required this.module, required this.courseController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 600
              ? 600
              : MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: module.content['data'].length,
                      itemBuilder: (context, index) {
                        var item = module.content['data'][index];
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
                    SizedBox(
                      // height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          //adding quiz question
                          if (module.quiz!.questions.isNotEmpty &&
                              !module.isCompleted) ...[
                            SizedBox(height: 16),
                            getQuizView(
                                quiz: module.quiz!, moduleIndex: module.order),
                          ],
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4),
                            child: SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  courseController.modulePageController
                                      .previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ThemeColor.headerOne,
                                ),
                                child: Text('Previous',
                                    style: TextStyle(
                                        color: ThemeColor.headerThree)),
                              ),
                            ),
                          ),
                          module.quiz!.questions.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 44,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        courseController.modulePageController
                                            .nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        backgroundColor: ThemeColor.headerOne,
                                      ),
                                      child: Text('Next',
                                          style: TextStyle(
                                              color: ThemeColor.headerThree)),
                                    ),
                                  ),
                                )
                              : Container(),
                          if (module.isCompleted &&
                              module.order <
                                  courseController.coursev2responseModel!.data!
                                          .modules.length -
                                      1) ...[
                            // SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    courseController.modulePageController
                                        .nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    backgroundColor: ThemeColor.headerOne,
                                  ),
                                  child: Text('Next',
                                      style: TextStyle(
                                          color: ThemeColor.headerThree)),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getQuizView({required Quiz quiz, required int moduleIndex}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quiz.questions.length + 1, // +1 for the submit button
      itemBuilder: (context, index) {
        if (index == quiz.questions.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  courseController.checkQuizAnswers(moduleIndex - 1);
                },
                style: TextButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: ThemeColor.headerOne,
                ),
                child: Text('Sumbit Quiz',
                    style: TextStyle(color: ThemeColor.headerThree)),
              ),
            ),
          );
        }

        final question = quiz.questions[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: AppUtils.getRandomCardBgColor(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${index + 1}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(question.text),
                  SizedBox(height: 8),
                  ...question.options.map<Widget>((option) {
                    // return Text('option');
                    return Obx(() {
                      return RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: courseController.selectedOptions[index],
                        onChanged: (value) {
                          courseController.selectOption(index, value!);
                        },
                      );
                    });
                  }).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class QuizPageView extends StatelessWidget {
  final Quiz quiz;
  final int moduleIndex;

  const QuizPageView(
      {super.key, required this.quiz, required this.moduleIndex});

  @override
  Widget build(BuildContext context) {
    final CourseController controller = Get.find<CourseController>();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quiz.questions.length + 1, // +1 for the submit button
      itemBuilder: (context, index) {
        if (index == quiz.questions.length) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Simulate quiz passing logic
                // controller.passQuiz(moduleIndex);
              },
              child: Text('Submit Quiz'),
            ),
          );
        }

        final question = quiz.questions[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${index + 1}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(question.text),
              SizedBox(height: 8),
              ...question.options.map<Widget>((option) {
                return Text('option');
                // return Obx(() {
                //   return RadioListTile<String>(
                //     title: Text(option),
                //     value: option,
                //     groupValue: controller.selectedOptions[index],
                //     onChanged: (value) {
                //       controller.selectOption(index, value!);
                //     },
                //   );
                // });
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
