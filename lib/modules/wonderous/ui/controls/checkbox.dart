import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/utils/app_haptics.dart';
import 'package:quizzie_thunder/styles/styles.dart';


class SimpleCheckbox extends StatelessWidget {
  const SimpleCheckbox({super.key, required this.active, required this.onToggled, required this.label});
  final bool active;
  final String label;
  final Function(bool? onToggle) onToggled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppStyle().corners.sm)),
          ),
          child: Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppStyle().corners.sm))),
              value: active,
              visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.5),
              checkColor: AppStyle().colors.black.withOpacity(0.75),
              activeColor: AppStyle().colors.white.withOpacity(0.75),
              onChanged: (bool? active) {
                AppHaptics.mediumImpact();
                onToggled.call(active);
              }),
        ),
        Gap(AppStyle().insets.xs),
        Text(label, style: AppStyle().text.body.copyWith(color: AppStyle().colors.offWhite)),
      ],
    );
  }
}
