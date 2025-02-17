import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'quiz_result_controller.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizResultController quizResultController =
        Get.find<QuizResultController>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Good Job!",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Get.offNamedUntil('/',(route)=> route.i));
                  // Get.off(closeOverlays: true);
                  
                  // Get.back(closeOverlays: true);
                  Get.back();
                  // Get.offNamedUntil(page, predicate)
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: ThemeColor.darkGrey,
                ))
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: Obx(() => quizResultController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: ThemeColor.lightPink,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            quizResultController.quizName,
                            style: TextStyle(
                                color: ThemeColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          // Text(
                          //   quizResultController.quizCategoryName,
                          //   style: TextStyle(
                          //     color: ThemeColor.white,
                          //     fontSize: 12,
                          //   ),
                          // ),
                          Image.asset(
                            "assets/images/prize.png",
                            width: 200,
                            height: 200,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          // Text(
                          //   "You get +${quizResultController.correctAnswerCount * 10} Quiz Points",
                          //   style: TextStyle(
                          //       color: ThemeColor.white,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CORRECT ANSWER",
                                style: TextStyle(
                                    color: ThemeColor.grey_500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            // Text(
                            //     "${quizResultController.correctAnswerCount} questions",
                            //     style: TextStyle(
                            //         color: ThemeColor.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold)),
                          ],
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("COMPLETION",
                                style: TextStyle(
                                    color: ThemeColor.grey_500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            // Text(
                            //     "${quizResultController.completionPercentage}%",
                            //     style: TextStyle(
                            //         color: ThemeColor.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold)),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("SKIPPED",
                                style: TextStyle(
                                    color: ThemeColor.grey_500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text("${quizResultController.skipQuestionCount}",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("INCORRECT ANSWER",
                                style: TextStyle(
                                    color: ThemeColor.grey_500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            // Text("${quizResultController.incorrectAnswerCount}",
                            //     style: TextStyle(
                            //         color: ThemeColor.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold)),
                          ],
                        ))
                      ],
                    )
                  ],
                ))));
  }
}
