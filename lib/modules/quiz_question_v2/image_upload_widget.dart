// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:quizzie_thunder/models/quiz_question_response_model.dart';

// import 'package:quizzie_thunder/modules/quiz_question_v2/dynamic_quiz_question_controller.dart';
// import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

// class ImageUploadWidget extends StatelessWidget {
//   final Question question;

//   const ImageUploadWidget({Key? key, required this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final DynamicQuizQuestionController controller = Get.find();

//     return Obx(() {
//       final imageFile = controller.answers[question.id] as File?;

//       return Column(
//         children: [
//           if (imageFile != null)
//             Container(
//               margin: const EdgeInsets.only(bottom: 16),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.file(
//                   imageFile,
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ElevatedButton(
//             onPressed: () async {
//               final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//               if (pickedFile != null) {
//                 controller.handleAnswer(File(pickedFile.path));
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: Text(
//               imageFile == null ? 'Upload Image' : 'Change Image',
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }