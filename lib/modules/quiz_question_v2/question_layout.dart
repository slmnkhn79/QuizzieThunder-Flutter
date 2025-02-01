// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:get/get.dart';
// import 'package:quizzie_thunder/models/quiz_question_response_model.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/image_upload_widget.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/long_answer_widget.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/mcq_options.dart';
// import 'package:quizzie_thunder/modules/quiz_question_v2/question_text_widget.dart';
// import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class QuestionLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     QuizQuesion controller = Get.find<DynamicQuizQuestionController>();
//     return Column(
//       children: [
//         CircularProgressIndicator(),
//         Expanded(
//           child: PageView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller.questions.length,
//             controller: controller.pageController,
//             itemBuilder: (context, index) {
//               final question = controller.questions[index];
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     if (question.imageUrl != null)
//                       CachedNetworkImage(imageUrl: question.imageUrl!),
//                     QuestionText(question:  question.question, imageUrl: question.imageUrl!,),
//                     _getAnswerWidget(question),
//                     NavigationButtons(),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _getAnswerWidget(Question question) {
//     switch (question.questionType) {
//       case QuestionType.mcq:
//         return MCQOptions(question: question);
//       // case QuestionType.imageUpload:
//       //   return ImageUploadWidget(question: question);
//       // case QuestionType.longAnswer:
//       //   return LongAnswerWidget(question: question);
//       default:
//         return SizedBox.shrink();
//     }
//   }
// }