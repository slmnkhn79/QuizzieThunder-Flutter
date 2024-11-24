import 'package:exprollable_page_view/exprollable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.page,
  });

  final int page;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: PageContentScrollController.of(context),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: HeroFlutterLogo(
            color: ThemeColor.facebook_light_1,
            tag: page,
            size: 400,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}

class HeroFlutterLogo extends StatelessWidget {
  const HeroFlutterLogo({
    super.key,
    required this.color,
    required this.tag,
    required this.size,
    required this.onTap,
  });

  final int tag;
  final Color color;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: FlutterLogo(
            size: size,
          ),
        ),
      ),
    );
  }
}