// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/learning_path_by_id_controller.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/markdownl_view.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

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
    // var content = learningController.learningPath!.paths!.content;
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
                // formatText("**salman** this is test -**khan**"),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: learningController
                        .learningPath!.paths!.content['data'].length,
                    itemBuilder: (context, index) {
                      final item = learningController
                          .learningPath!.paths!.content['data'][index];
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
                          return Content(
                              item['heading'], item['content']);
                        case 'material_title':
                          return MaterialTitle(
                              item['heading'], item['content']);
                        default:
                          return Container();
                      }
                    },
                  ),
                )
              ],
            ),
    );
  }
}
