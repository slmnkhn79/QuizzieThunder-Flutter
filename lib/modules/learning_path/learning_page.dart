import 'package:animated_gradient/animated_gradient.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    LearningController learningController = Get.find<LearningController>();
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
                              child: learningController.pageIsLearningPath.value
                                  ? getLearningPaths(
                                      learningController, context)
                                  : getLearningById())))),
            ))));
  }

  Center getLearningPaths(
      LearningController learningController, BuildContext context) {
    int columns = (MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width) ~/
        180; // 200px per card (adjust as needed)
    if (columns == 0) {
      columns = 1; // Ensure at least 1 column
    }
    return learningController.isLoadingLearningPaths.value
        ? Center(
            child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width > 600
                ? 600
                : MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: ThemeColor.headerOne,
                  ),
                ]),
          ))
        : Center(
            child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            width: MediaQuery.of(context).size.width > 600
                ? 600
                : MediaQuery.of(context).size.width,
            color: ThemeColor.headerThree,
            child: Column(
              children: [
                filterContainer(context, learningController),
                getLearningPathGrid(context, learningController, columns),
              ],
            ),
          ));

    // return Container(
    //   child: SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     child: learningController.isLoadingLearningPaths.value
    //         ? Center(
    //             child: CircularProgressIndicator(
    //             color: ThemeColor.headerOne,
    //           ))
    //         : Padding(
    //             padding:
    //                 const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.1,
    //                   child: Text("Filters"),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height - 0.7,
    //                   child: GridView.builder(
    //                       gridDelegate:
    //                           SliverGridDelegateWithFixedCrossAxisCount(
    //                               crossAxisCount: columns,
    //                               // childAspectRatio: 3,
    //                               // crossAxisSpacing: 2,
    //                               mainAxisSpacing: 2),
    //                       itemCount:
    //                           learningController.learningPaths!.paths.length,
    //                       itemBuilder: (context, index) {
    //                         var item =
    //                             learningController.learningPaths!.paths[index];
    //                         return InkWell(
    //                           onTap: () {
    //                             Get.toNamed('/learningsPathById',
    //                                 arguments: {ARG_LEARNING_PATH_ID: item.id});
    //                           },
    //                           child: Card(
    //                             // child: Text(item.pathName),
    //                             child: SizedBox(
    //                               height: 50,
    //                               child: ListTile(
    //                                 tileColor: AppUtils.getRandomCardBgColor(),
    //                                 title: Text(item.pathName),
    //                                 onTap: () {
    //                                   Get.toNamed('/learningsPathById',
    //                                       arguments: {
    //                                         ARG_LEARNING_PATH_ID: item.id
    //                                       });
    //                                 },
    //                               ),
    //                             ),
    //                           ),
    //                         );
    //                       }),
    //                 )
    //               ],
    //             ),
    //           ),
    //   ),
    // );
  }

  Container getLearningById() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("Learning By ID")],
      ),
    );
  }

  SizedBox filterContainer(
      BuildContext context, LearningController learningController) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Text("Filters"),
    );
  }

  SizedBox getLearningPathGrid(BuildContext context,
      LearningController learningController, int columns) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: 2,
              // crossAxisSpacing: 2,
              ),
          itemCount: learningController.learningPaths!.paths.length,
          itemBuilder: (context, index) {
            var item = learningController.learningPaths!.paths[index];
            return InkWell(
              onTap: () {
                Get.toNamed('/learningsPathById',
                    arguments: {ARG_LEARNING_PATH_ID: item.id});
              },
              child: Card(
                color: AppUtils.getRandomCardBgColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // No border radius
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  tileColor: AppUtils.getRandomCardBgColor(),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(item.pathName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Get.toNamed('/learningsPathById',
                        arguments: {ARG_LEARNING_PATH_ID: item.id});
                  },
                ),
              ),
            );
          }),
    );
  }
}
