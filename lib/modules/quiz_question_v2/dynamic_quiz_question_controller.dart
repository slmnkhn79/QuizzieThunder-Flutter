import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/quiz_question_api.dart';

class DynamicQuizQuestionController extends GetxController {
  // final QuizQuestionApi  _repository =QuizQuestionApi();
  // Rx<QuizStatus> status = QuizStatus.loading.obs;
  // RxInt currentQuestionIndex = 0.obs;
  // RxInt remainingTime = 0.obs;
  // RxMap<String, dynamic> answers = <String, dynamic>{}.obs;
  
  // @override
  // void onInit() {
  //   _loadQuiz();
  //   _startTimer();
  //   super.onInit();
  // }

  // void _loadQuiz() async {
  //   try {
  //     final quiz = await _repository.getQuiz();
  //     status.value = QuizStatus.loaded;
  //   } catch (e) {
  //     status.value = QuizStatus.error;
  //   }
  // }

  // void _startTimer() {
  //   if (quiz.timeLimit > 0) {
  //     remainingTime.value = quiz.timeLimit * 60;
  //     Timer.periodic(1.seconds, (timer) {
  //       if (remainingTime.value > 0) {
  //         remainingTime.value--;
  //       } else {
  //         timer.cancel();
  //         submitQuiz();
  //       }
  //     });
  //   }
  // }

  // void handleAnswer(dynamic answer) {
  //   answers[currentQuestion.id] = answer;
  // }

  // void submitQuiz() {
  //   // Handle submission logic
  // }
}