import 'package:flutter/material.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class EventDetailsPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primary,
      appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
      body: Placeholder(),
    );
  }
}