import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/profile_api.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/constants.dart';
import 'quiz_detail_controller.dart';

class QuizDetailPage extends StatelessWidget {


  const QuizDetailPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    QuizDetailController quizDetailController =
        Get.find<QuizDetailController>();
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
          backgroundColor: ThemeColor.headerOne,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.headerThree,
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              quizDetailController.getQuizDetail(quizDetailController.quizId);
            },
            child: quizDetailController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: ThemeColor.headerOne,
                  ))
                : SingleChildScrollView(
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height < 600
                            ? 600
                            : MediaQuery.of(context).size.height - 50,
                        width: MediaQuery.of(context).size.width > 600
                            ? 600
                            : MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/quiz_detail_bg.png",
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: ThemeColor.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // quizDetailController
                                          //         .quizCategoryName.isEmpty
                                          //     ? "${quizDetailController.quizDetail?.category?.title.toString().toUpperCase()}"
                                          //     : quizDetailController.quizCategoryName
                                          quizDetailController
                                              .quizDetailResponseModel!
                                              .quizDetail
                                              .categoryName
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: ThemeColor.grey_500,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${quizDetailController.quizDetailResponseModel!.quizDetail.quizName}",
                                          style: TextStyle(
                                              color: ThemeColor.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 12),
                                            decoration: BoxDecoration(
                                                color: ThemeColor.candyPink,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              "The more you answer correctly, higher is the score. Higher the score, better is the rank. All the best!",
                                              style: TextStyle(
                                                  color: ThemeColor.black,
                                                  fontSize: 12),
                                            )),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: ThemeColor.lighterPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        ThemeColor.accent,
                                                    radius: 14,
                                                    child: Icon(
                                                      Icons
                                                          .question_mark_rounded,
                                                      color: ThemeColor.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                      quizDetailController
                                                          .quizDetailResponseModel!
                                                          .quizDetail
                                                          .numQuestions
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              ThemeColor.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              )),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                  child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        ThemeColor.lightPink,
                                                    radius: 14,
                                                    child: Icon(
                                                      Icons.extension_rounded,
                                                      color: ThemeColor.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                      "+${quizDetailController.quizDetailResponseModel!.quizDetail.points} points",
                                                      style: TextStyle(
                                                          color:
                                                              ThemeColor.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        Text(
                                          "DESCRIPTION",
                                          style: TextStyle(
                                              color: ThemeColor.grey_500,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${quizDetailController.quizDetailResponseModel!.quizDetail.quizDescription}",
                                          style: TextStyle(
                                            color: ThemeColor.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 44,
                                        ),
                                        quizDetailController
                                                      .quizDetailResponseModel!
                                                      .quizDetail
                                                      .isPlayed 
                                                      ? Container(padding: EdgeInsets.only(top:5),
                                                        height: 44,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: ThemeColor.red,
                                                          borderRadius: BorderRadius.circular(12.0)
                                                        ),

                                                        
                                                        child: Text("You have already played the quiz",
                                                        textAlign: TextAlign.center,
                                                        style:TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                          color: ThemeColor.white
                                                          )),
                                                      )
                                                      : Container(),
                                        !quizDetailController
                                                      .quizDetailResponseModel!
                                                      .quizDetail
                                                      .isPlayed ?
                                        SizedBox(
                                            width: double.infinity,
                                            height: 44,
                                            child: ElevatedButton(
                                              onPressed: quizDetailController
                                                      .quizDetailResponseModel!
                                                      .quizDetail
                                                      .isPlayed
                                                  ? () {}
                                                  : () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .quizQuestionPage,
                                                          arguments: {
                                                            ARG_QUIZ_ID:
                                                                quizDetailController.quizDetailResponseModel!
                                                                    .quizDetail
                                                                    ?.id,
                                                            ARG_QUIZ_NAME:
                                                                quizDetailController.quizDetailResponseModel!
                                                                    .quizDetail
                                                                    ?.quizName,
                                                            ARG_QUIZ_CATEGORY_NAME: quizDetailController.quizDetailResponseModel!
                                                                    .quizDetail
                                                                    .categoryName
                                                                    .isEmpty
                                                                ? "${quizDetailController.quizDetail?.category?.title.toString().toUpperCase()}"
                                                                : quizDetailController
                                                                    .quizCategoryName
                                                                    .toString()
                                                                    .toUpperCase()
                                                          });
                                                          quizDetailController.dispose();
                                                    },
                                              style: TextButton.styleFrom(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                backgroundColor:
                                                quizDetailController
                                                      .quizDetailResponseModel!
                                                      .quizDetail
                                                      .isPlayed ? ThemeColor.red:
                                                    ThemeColor.headerOne,
                                              ),
                                              child: Text("Start Quiz",
                                                  style: TextStyle(
                                                      color: ThemeColor.white)),
                                            )):Container(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))));
  }
}
