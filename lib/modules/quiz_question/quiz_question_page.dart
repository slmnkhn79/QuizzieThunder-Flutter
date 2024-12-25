import 'dart:async';

import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_detail/quiz_detail_controller.dart';

import '../../theme/colors_theme.dart';
import 'quiz_question_controller.dart';

class QuizQuestionPage extends StatelessWidget {
  const QuizQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizQuestionController quizQuestionController =
        Get.find<QuizQuestionController>();
    return WillPopScope(
      onWillPop: () async {
        return await showEndQuizAlertDialog(quizQuestionController);
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  showEndQuizAlertDialog(quizQuestionController);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: ThemeColor.white,
                )),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  quizQuestionController.quizName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  quizQuestionController.quizCategoryName,
                  style: TextStyle(fontSize: 12, color: ThemeColor.white),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: ThemeColor.primary,
          body: Obx(() => quizQuestionController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ThemeColor.white,
                ))
              : Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          quizQuestionController.time.value,
                          style: TextStyle(
                              color: ThemeColor.grey_500,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "QUESTION ${quizQuestionController.questionCount.value + 1 } OF ${quizQuestionController.totalQuestions}",
                          style: TextStyle(
                              color: ThemeColor.grey_500,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${quizQuestionController.allQuestions[quizQuestionController.questionCount.value].question}",
                          style: TextStyle(
                              color: ThemeColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 44,
                        ),
                        optionContainerList(quizQuestionController),
                        Spacer(),
                        // quizQuestionController.questionCount >= 1 ?
                        // SizedBox(
                        //     width: double.infinity,
                        //     height: 44,
                        //     child: ElevatedButton(
                        //       onPressed: () {
                        //         quizQuestionController.prevQuestion(
                        //             );
                        //       },
                        //       style: TextButton.styleFrom(
                        //         textStyle: TextStyle(
                        //             fontSize: 16, fontWeight: FontWeight.w500),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(12)),
                        //         backgroundColor: ThemeColor.primaryDark,
                        //       ),
                        //       child: Text("Prev",
                        //           style: TextStyle(color: ThemeColor.white)),
                        //     ))
                        //     : Container(),
                            SizedBox(height: 5,),
                        quizQuestionController.questionCount >= 0 && quizQuestionController.questionCount < quizQuestionController.totalQuestions-1 ? SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                quizQuestionController.nextQuestion(
                                    isSkipped: true);
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: ThemeColor.primaryDark,
                              ),
                              child: Text("Next",
                                  style: TextStyle(color: ThemeColor.white)),
                            )): Container(),
                            SizedBox(height: 5,),
                        quizQuestionController.questionCount.value == quizQuestionController.totalQuestions -1 ? 
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                quizQuestionController.endQuiz();
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: ThemeColor.red,
                              ),
                              child: Text("Submit",
                                  style: TextStyle(color: ThemeColor.white)),
                            )):Container()
                      ],
                    ),
                  ),
                ))),
    );
  }

  Column optionContainerList(QuizQuestionController quizQuestionController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: quizQuestionController
          .allQuestions[quizQuestionController.questionCount.value].options
          .asMap()
          .entries
          .map((entry) =>
              optionContainer(entry.key, entry.value, quizQuestionController, quizQuestionController
          .allQuestions[quizQuestionController.questionCount.value].id!))
          .toList(),
    );
  }

  Column optionContainer(int index, String optionName,
      QuizQuestionController quizQuestionController , String questionId) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            quizQuestionController.nextQuestion(selectedOption: index, prevQuestionId: quizQuestionController.allQuestions[quizQuestionController.questionCount.value].id, solution: optionName);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                // color: (quizQuestionController.optionSelectedIndex.value ==
                //             index &&
                //         quizQuestionController.isAnswerCorrect.value == -1)
                //     ? ThemeColor.lightPrimary.withOpacity(0.4)
                //     : (quizQuestionController.optionSelectedIndex.value ==
                //                 index &&
                //             quizQuestionController.isAnswerCorrect.value == 1)
                //         ? ThemeColor.vibrantGreen
                //         : (quizQuestionController.optionSelectedIndex.value ==
                //                     index &&
                //                 quizQuestionController.isAnswerCorrect.value ==
                //                     0)
                //             ? ThemeColor.white
                //             : ThemeColor.white,
                color: quizQuestionController.answerSelected.containsKey(questionId) 
                        && quizQuestionController.answerSelected.getOrElse(questionId,()=>'') == optionName
                ?ThemeColor.vibrantGreen 
                :  ThemeColor.white,
                border: Border.all(
                    color: (quizQuestionController.optionSelectedIndex.value ==
                                index &&
                            quizQuestionController.isAnswerCorrect.value == 0)
                        ? ThemeColor.coralRed
                        : quizQuestionController.optionSelectedIndex.value ==
                                index
                            ? Colors.transparent
                            : ThemeColor.lightPrimary.withOpacity(0.4),
                    width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              optionName,
              style: TextStyle(
                  color: (quizQuestionController.optionSelectedIndex.value ==
                              index &&
                          quizQuestionController.isAnswerCorrect.value == 1)
                      ? ThemeColor.white
                      : (quizQuestionController.optionSelectedIndex.value ==
                                  index &&
                              quizQuestionController.isAnswerCorrect.value == 0)
                          ? ThemeColor.coralRed
                          : ThemeColor.black,
                  fontSize: 14,
                  fontWeight:
                      quizQuestionController.optionSelectedIndex.value == index
                          ? FontWeight.bold
                          : FontWeight.normal),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Future<bool> showEndQuizAlertDialog(
      QuizQuestionController quizQuestionController) {
    Completer<bool> completer = Completer<bool>();
    Get.defaultDialog(
        title: "Exit Quiz",
        middleText: "Are you sure you want to exit the current quiz?",
        backgroundColor: ThemeColor.white,
        titleStyle: TextStyle(fontSize: 18, color: ThemeColor.black),
        middleTextStyle: TextStyle(fontSize: 16, color: ThemeColor.textPrimary),
        titlePadding: const EdgeInsets.all(16),
        contentPadding: const EdgeInsets.all(16),
        radius: 8,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back(result: true);
            },
            icon: Icon(
              Icons.close,
              size: 16,
              color: ThemeColor.accent,
            ),
            label: Text(
              "No",
              style: TextStyle(
                  color: ThemeColor.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColor.white,
              side: BorderSide(color: ThemeColor.lightPrimary, width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.back(result: true);
              quizQuestionController.endQuiz();
              
            },
            icon: Icon(
              Icons.check,
              size: 16,
              color: ThemeColor.white,
            ),
            label: Text(
              "Yes",
              style: TextStyle(
                  color: ThemeColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColor.primary,
              side: BorderSide(color: ThemeColor.accent, width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ]);
    return completer.future;
  }
}
