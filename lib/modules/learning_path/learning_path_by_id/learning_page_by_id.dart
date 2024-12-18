import 'package:animated_gradient/animated_gradient.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/learning_path_by_id_controller.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class LearningPageById extends StatelessWidget {
  const LearningPageById({super.key});

  @override
  Widget build(BuildContext context) {
    LearningByIdController learningController =
        Get.find<LearningByIdController>();
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
            onRefresh: () async {
              //fill the refresh value
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: getLearningById(
                                  context, learningController))))),
            ))));
  }

  Container getLearningById(
      BuildContext context, LearningByIdController learningController) {
    return Container(
      child: learningController.isLoadingLearning.value
          ? const Center(
              child: CircularProgressIndicator(
              color: ThemeColor.white,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(learningController.learningPath!.paths!.pathName)
              ],
            ),
    );
  }
}
