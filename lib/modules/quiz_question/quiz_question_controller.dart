import 'dart:async';

import 'package:get/get.dart';

import '../../apis/quiz_question_api.dart';
import '../../models/quiz_question_response_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizQuestionController extends GetxController {
  QuizQuestionApi quizQuestionApi = QuizQuestionApi();

  Timer? _timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;

  final arguments = Get.arguments;

  var allQuestions = <Question>[];

  var isLoading = false.obs;
  var questionCount = 0.obs;
  var optionSelectedIndex = (-1).obs;
  var solutionSelected = ''.obs;
  var isAnswerCorrect = (1).obs;
  Map<String, String> answerSelected = <String, String>{}.obs;
  int totalQuestions = 0;

  var quizId = "";
  var quizName = "";
  var quizCategoryName = "";

  var skipQuestionCount = 0;
  var correctAnswerCount = 0;
  var incorrectAnswerCount = 0;

  @override
  void onInit() {
    if (arguments != null) {
      quizId = arguments[ARG_QUIZ_ID];
      print(quizId);
      quizName = arguments[ARG_QUIZ_NAME] ?? "";
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
    }
    getAllQuizList();
    super.onInit();
  }

  @override
  void onReady() {
    _startQuizTimer(10);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  void getAllQuizList() async {
    isLoading.value = true;
    var response = await quizQuestionApi.getQuizQuestionList(quizId: quizId);
    if (response.code == 200) {
      allQuestions.clear();
      allQuestions.addAll(response.questions ?? List.empty());
      totalQuestions = response.quiz!.totalQuestions!;
      // print("-------------------------------------------------------------");
      // _startQuizTimer();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void prevQuestion() {
    print(questionCount);
    if (questionCount >= 1) {
      questionCount.value = questionCount.value - 1;
      print(questionCount);
    }
  }

  void nextQuestion(
      {bool isSkipped = false,
      int selectedOption = -1,
      String? prevQuestionId,
      String? solution}) async {
    _timer!.cancel();
    _startQuizTimer(10);
    if (isSkipped) {
      if (questionCount.value < totalQuestions - 1) {
        questionCount.value += 1;
        skipQuestionCount += 1;
        print(skipQuestionCount);
      }
    } else {
      answerSelected.update(prevQuestionId!, (value) => solution!,
          ifAbsent: () => solution!);
      if (questionCount.value < totalQuestions - 1) {
        questionCount.value += 1;
      }
    }
    // isAnswerCorrect.value = -1;
    // optionSelectedIndex.value = selectedOption;
    // if (isSkipped) {
    //   isAnswerCorrect.value = -1;
    //   optionSelectedIndex.value = -1;
    //   skipQuestionCount++;
    // } else {
    //   // await Future.delayed(Duration(seconds: 1));
    //   if (allQuestions[questionCount.value].correctOptionIndex ==
    //       selectedOption) {
    //     isAnswerCorrect.value = 1;
    //     // await Future.delayed(Duration(seconds: 1));
    //     correctAnswerCount++;
    //   } else {
    //     isAnswerCorrect.value = 0;
    //     // await Future.delayed(Duration(seconds: 1));
    //     incorrectAnswerCount++;
    //   }
    // }
    if (questionCount.value == totalQuestions - 1) {
      // endQuiz();
    } else {
      // isAnswerCorrect.value = -1;
      // optionSelectedIndex.value = -1;
      // questionCount.value += 1;
    }

    //save the previous result
    // if (!isSkipped) {
    //   var response = await quizQuestionApi.postQuizQuestionList(
    //       quizId: quizId, questionId: prevQuestionId, solution: solution);
    //   if (response.code == 200) {
    //   } else {
    //     isLoading.value = false;
    //     AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    //   }
    // }

    //get the next question
    // if (questionCount <= 10) {
    //   isLoading.value = true;
    //   var response = await quizQuestionApi.getQuizQuestionList(quizId: quizId);
    //   if (response.code == 200) {
    //     // allQuestions.clear();
    //     allQuestions.addAll(response.questions ?? List.empty());
    //     print("-------------------------------------------------------------");
    //     print("allQuestions ${allQuestions}");
    //     isLoading.value = false;
    //   } else {
    //     isLoading.value = false;
    //     AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    //   }
    // }
    // else
    // {
    //   AppUtils.showSnackBar("Warn", status: MessageStatus.NORMAL);
    // }
  }

  void endQuiz() {
    _timer!.cancel();
    Get.offAndToNamed(AppRoutes.quizResultPage, arguments: {
      ARG_QUIZ_ID: quizId,
      ARG_QUIZ_NAME: quizName,
      ARG_QUIZ_CATEGORY_NAME: quizCategoryName,
      // ARG_SKIPPED_QUESTIONS_COUNT: skipQuestionCount,
      // ARG_CORRECT_ANSWER_COUNT: correctAnswerCount,
      // ARG_INCORRECT_ANSWER_COUNT: incorrectAnswerCount,
      ARG_ANS_MAP: answerSelected
    });
  }

  void _startQuizTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        if(questionCount.value == totalQuestions - 1){
          endQuiz();
        }else{
        nextQuestion(isSkipped: true);
        timer.cancel();
        }
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  void _startQuestionTimer(int seconds) {}
}
