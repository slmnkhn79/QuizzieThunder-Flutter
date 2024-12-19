import 'package:animated_gradient/animated_gradient.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_all_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class AllStudyPlans extends StatelessWidget {
  const AllStudyPlans({super.key});

  @override
  Widget build(BuildContext context) {
    StudyPlansAllController studyPlansAllController =
        Get.find<StudyPlansAllController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Study Plans",
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
            studyPlansAllController.getAllStudyPlans();
          },
          child: studyPlansAllController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ThemeColor.white,
                ))
              : studyPlans(context, studyPlansAllController))),
    );
  }

  Center studyPlans(
      BuildContext context, StudyPlansAllController studyPlansAllController) {
        int columns = (MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width) ~/ 180; // 200px per card (adjust as needed)
    if (columns == 0) {
      columns = 1; // Ensure at least 1 column
    }
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        width: MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width,
        color: ThemeColor.headerThree,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *0.1,
              child: Text("Filters"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.8,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      // childAspectRatio: 3,
                      // crossAxisSpacing: 2,
                      childAspectRatio: 2),
                  itemCount: studyPlansAllController
                      .studyPlanResponseModel!.plans.length,
                  itemBuilder: (context, index) {
                    var item = studyPlansAllController
                        .studyPlanResponseModel!.plans[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/studyPlansById',
                            arguments: {ARG_STUDY_PLAN_ID: item.id});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4), // No border radius
                        ),
                        elevation: 4.0,
                        child: AnimatedGradient(
                          colors: AppUtils.getRandomGradient(index),
                          child: Center(
                            child: ListTile(
                              title: Text(item.planName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                  )),
                              leading: Text(item.standard.standardName),
                              trailing: Icon(Icons.not_started_outlined),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
