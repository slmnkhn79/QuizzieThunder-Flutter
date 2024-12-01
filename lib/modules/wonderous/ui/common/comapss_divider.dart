import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizzie_thunder/assets.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/styles/styles.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';


class CompassDivider extends StatelessWidget {
  const CompassDivider({super.key, required this.isExpanded, this.duration, this.linesColor, this.compassColor});
  final bool isExpanded;
  final Duration? duration;
  final Color? linesColor;
  final Color? compassColor;

  @override
  Widget build(BuildContext context) {
    Duration duration = this.duration ?? 1500.ms;
    Widget buildHzAnimatedDivider({bool alignLeft = false}) {
      return TweenAnimationBuilder<double>(
        duration: duration,
        tween: Tween(begin: 0, end: isExpanded ? 1 : 0),
        curve: Curves.easeOut,
        child: Divider(height: 1, thickness: .5, color: linesColor ?? 
        ThemeColor.headerOne),
        builder: (_, value, child) {
          return Transform.scale(
            scaleX: value,
            alignment: alignLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: child!,
          );
        },
      );
    }

    return Row(
      children: [
        Expanded(child: buildHzAnimatedDivider()),
        Gap(16),
        TweenAnimationBuilder<double>(
          duration: duration,
          tween: Tween(begin: 0, end: isExpanded ? .5 : 0),
          curve: Curves.easeOutBack,
          builder: (_, value, child) => Transform.rotate(
            angle: value * pi * 2,
            child: child,
          ),
          child: SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                SvgPaths.compassFull,
                // colorFilter: (compassColor ?? ThemeColor.accent2).colorFilter,
              )),
        ),
        Gap(AppStyle().insets.sm),
        Expanded(child: buildHzAnimatedDivider(alignLeft: true)),
      ],
    );
  }
}