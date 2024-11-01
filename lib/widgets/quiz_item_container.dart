import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';
import '../models/all_quiz_response_model.dart';

class QuizItemContainer extends StatelessWidget {
  final Quiz? dataObj;
  final String? quizCategoryName;

  const QuizItemContainer(
      {super.key, required this.dataObj, this.quizCategoryName = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColor.grey_300),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${dataObj?.title}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.black)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                      quizCategoryName?.isEmpty == true
                          ? "${dataObj?.category?.title}- ${dataObj?.standard} - ${dataObj?.level},${dataObj?.id}"
                          : "$quizCategoryName - ",
                      style: TextStyle(fontSize: 12, color: ThemeColor.grey))
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: ThemeColor.primaryDark,
            size: 16,
          )
        ],
      ),
    );
  }
}
