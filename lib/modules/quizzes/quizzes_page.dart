import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/quiz_item_container.dart';
import 'quizzes_controller.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizzesController quizzesController = Get.find<QuizzesController>();
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
            quizzesController.quizCategoryName.isEmpty
                ? "Quizzes"
                : "${quizzesController.quizCategoryName} Quizzes",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor:  ThemeColor.headerOne,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.headerThree,
        body: Obx(() => quizzesController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: ThemeColor.white,
              ))
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 600
                          ? 600
                          : MediaQuery.of(context).size.width,
                      
                      child: Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 12),
                        decoration: BoxDecoration(
                            color: ThemeColor.lighterPrimary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ThemeColor.headerTwo,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        quizzesController
                                            .selectedTabIndex.value = 0;
                                             quizzesController.filterQuiz();
                                      },
                                      child: quizzesController
                                                  .selectedTabIndex.value ==
                                              0
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: ThemeColor.headerOne,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Daily",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Daily",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        quizzesController
                                            .selectedTabIndex.value = 1;
                                             quizzesController.filterQuiz();
                                      },
                                      child: quizzesController
                                                  .selectedTabIndex.value ==
                                              1
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: ThemeColor.headerOne,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Weekly",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Weekly",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        quizzesController
                                            .selectedTabIndex.value = 2;
                                            quizzesController.filterQuiz();
                                      },
                                      child: quizzesController
                                                  .selectedTabIndex.value ==
                                              2
                                          ?
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: ThemeColor.headerOne,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Monthly",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                          : Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              child: Text(
                                                "Monthly",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: ThemeColor
                                                        .facebook_light_4,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 8);
                                },
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: quizzesController.allQuizzes.length,
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 24),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.quizDetailPage,
                                            arguments: {
                                              // ARG_QUIZ_DETAIL: homeController
                                              //     .homeScreenResponseModel
                                              //     ?.quizzes?[index],
                                              ARG_QUIZ_ID: quizzesController
                                                  .allQuizzes[index].id
                                              // ?.mostPlayedQuiz!.id
                                            });
                                      },
                                      child: QuizItemContainer(
                                        dataObj:
                                            quizzesController.allQuizzes[index],
                                        quizCategoryName: quizzesController
                                                .quizCategoryName.isEmpty
                                            ? ""
                                            : quizzesController
                                                .quizCategoryName,
                                      ));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )));
  }
}
