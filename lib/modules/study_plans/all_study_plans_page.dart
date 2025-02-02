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
              : studyPlans(context, studyPlansAllController))),
    );
  }

  Center studyPlans(
      BuildContext context, StudyPlansAllController studyPlansAllController) {
    int columns = (MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width) ~/
        180; // 200px per card (adjust as needed)
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
                height: MediaQuery.of(context).size.height * 0.1,
                child: filterContainer(context, studyPlansAllController)),
            TextButton(
                onPressed: () {
                  studyPlansAllController.setSearchTermId('');
                },
                child: Text("Reset")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
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
                        color: AppUtils.getRandomCardBgColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4), // No border radius
                        ),
                        elevation: 4.0,
                        child: Center(
                          child: ListTile(
                            title: Text(item.planName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                )),
                            leading: Text(item.standard.standardName),
                            // trailing: Icon(Icons.not_started_outlined),
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

  SizedBox filterContainer(
      BuildContext context, StudyPlansAllController studyPlansAllController) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: studyPlansAllController.isSearchLoading.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                ],
              )
            :
            // GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 4, childAspectRatio: 3),
            //     itemCount: studyPlansAllController
            //         .searchResponseModel!.searchResults.length,
            //     itemBuilder: (context, index) {
            //       var item = studyPlansAllController
            //           .searchResponseModel!.searchResults[index];
            //       return InkWell(
            //         onTap: () {
            //           studyPlansAllController.setSearchTermId(item.id);
            //         },
            //         child: Container(
            //             margin:
            //                 EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            //             decoration: BoxDecoration(
            //                 color: ThemeColor.white,
            //                 borderRadius: BorderRadius.circular(2)),
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 2, vertical: 2),
            //             child: Text(
            //               item.displayValue,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   color: ThemeColor.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold),
            //             )),
            //       );
            //     },
            //   )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3,
                ),
                itemCount: studyPlansAllController
                    .searchResponseModel!.searchResults.length,
                itemBuilder: (context, index) {
                  final item = studyPlansAllController
                      .searchResponseModel!.searchResults[index];

// Determine if this item is currently selected
                  final bool isSelected =
                      studyPlansAllController.searchTermId == item.id;

                  return InkWell(
                    onTap: () {
                      studyPlansAllController.setSearchTermId(item.id);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue[50] // A subtle highlight color
                            : ThemeColor.white,
                        borderRadius: BorderRadius.circular(10),
                        // Highlight with a thicker, colored border if selected
                        border: Border.all(
                          color: isSelected
                              ? Colors.blueAccent
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                        // Subtle shadow
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Center the display text
                          Center(
                            child: Text(
                              item.displayValue,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.blueAccent
                                    : ThemeColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Optional check icon if selected
                          if (isSelected)
                            Positioned(
                              top: 6,
                              right: 6,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
