// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:quizzie_thunder/modules/quiz_question/quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/timer_widget.dart';
// import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class QuizPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     QuizQuestionController controller = Get.find<QuizQuestionController>();
//     return WillPopScope(
//       onWillPop: _showExitDialog,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Obx(() => Text(controller.quiz.value?.title ?? '')),
//           actions: [TimerWidget()],
//         ),
//         body: Obx(() {
//           switch (controller.status.value) {
//             case QuizStatus.loading:
//               return LoadingWidget();
//             case QuizStatus.loaded:
//               return QuestionLayout();
//             case QuizStatus.error:
//               return ErrorRetryWidget();
//           }
//         }),
//       ),
//     );
//   }

//   Future<bool> _showExitDialog() async {
//     final result = await Get.defaultDialog(
//       title: 'Exit Quiz?',
//       content: Text('All progress will be lost!'),
//       actions: [
//         TextButton(onPressed: () => Get.back(result: false), child: Text('Cancel')),
//         TextButton(onPressed: () => Get.back(result: true), child: Text('Exit')),
//       ],
//     );
//     if (result) controller.resetQuiz();
//     return result ?? false;
//   }
// }