import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class TimerWidget extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//       DynamicQuizQuestionController controller = Get.find<DynamicQuizQuestionController>();
//     return Obx(() {
//       final minutes = (controller.remainingTime.value ~/ 60).toString().padLeft(2, '0');
//       final seconds = (controller.remainingTime.value % 60).toString().padLeft(2, '0');
//       return Chip(
//         label: Text('$minutes:$seconds'),
//         backgroundColor: controller.remainingTime.value < 60 ? Colors.red : null,
//       );
//     });
//   }
// }