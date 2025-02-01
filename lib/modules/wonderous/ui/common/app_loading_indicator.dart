

import 'package:flutter/material.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.value, this.color});
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final progress = (value == null || value! < .05) ? null : value;

    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        color: color ?? ThemeColor.headerOne,
        value: progress,
        strokeWidth: 1.0,
      ),
    );
  }
}