// import 'package:get/get.dart';
// import 'package:get/utils.dart';
// import 'package:quizzie_thunder/models/quiz_question_response_model.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class LongAnswerWidget extends StatelessWidget {
//   final Question question;

//   const LongAnswerWidget({Key? key, required this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final DynamicQuizQuestionController controller = Get.find();

//     return Obx(() {
//       final answerText = controller.answers[question.id] as String? ?? '';

//       return TextField(
//         maxLines: 5,
//         decoration: InputDecoration(
//           hintText: 'Write your answer here...',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Colors.blue),
//           ),
//         ),
//         onChanged: (value) => controller.handleAnswer(value),
//         controller: TextEditingController(text: answerText),
//       );
//     });
//   }
// }