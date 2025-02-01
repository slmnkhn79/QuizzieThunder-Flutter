import 'package:quizzie_thunder/logic/common/string_utils.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/themed_text.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/styles/styles.dart';



class TimelineEventCard extends StatelessWidget {
  const TimelineEventCard({super.key, required this.year, required this.text, this.darkMode = false});
  final int year;
  final String text;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: EdgeInsets.only(bottom: AppStyle().insets.sm),
        child: DefaultTextColor(
          color: darkMode ? Colors.white : Colors.black,
          child: Container(
            color: darkMode ? AppStyle().colors.greyStrong : AppStyle().colors.offWhite,
            padding: EdgeInsets.all(AppStyle().insets.sm),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  /// Date
                  SizedBox(
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${year.abs()}', style: AppStyle().text.h3.copyWith(fontWeight: FontWeight.w400, height: 1)),
                        Text(StringUtils.getYrSuffix(year), style: AppStyle().text.bodySmall),
                      ],
                    ),
                  ),

                  /// Divider
                  Container(width: 1, color: darkMode ? Colors.white : AppStyle().colors.black),

                  Gap(AppStyle().insets.sm),

                  /// Text content
                  Expanded(
                    child: Focus(child: Text(text, style: AppStyle().text.body)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
