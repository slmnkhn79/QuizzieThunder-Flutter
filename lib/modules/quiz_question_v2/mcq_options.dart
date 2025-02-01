// import 'package:get/get.dart';
// import 'package:quizzie_thunder/models/quiz_question_response_model.dart';

// import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class MCQOptions extends StatelessWidget {
//   final Question question;

//   const MCQOptions({Key? key, required this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final DynamicQuizQuestionController controller = Get.find();

//     return Obx(() {
//       final selectedAnswer = controller.answers[question.id] as int?;

//       return Column(
//         children: question.options.asMap().entries.map((entry) {
//           final index = entry.key;
//           final option = entry.value;

//           return GestureDetector(
//             onTap: () => controller.handleAnswer(index),
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: selectedAnswer == index ? Colors.blue.withOpacity(0.2) : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: selectedAnswer == index ? Colors.blue : Colors.transparent,
//                   width: 2,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Radio<int>(
//                     value: index,
//                     groupValue: selectedAnswer,
//                     onChanged: (value) => controller.handleAnswer(value!),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       option,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: selectedAnswer == index ? Colors.blue : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }).toList(),
//       );
//     });
//   }
// }