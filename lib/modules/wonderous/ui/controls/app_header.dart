

import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/circle_buttons.dart';
import 'package:quizzie_thunder/styles/styles.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/app_icons.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(
      {super.key,
      this.title,
      this.subtitle,
      this.showBackBtn = true,
      this.isTransparent = false,
      this.onBack,
      this.trailing,
      this.backIcon = AppIcons.prev,
      this.backBtnSemantics});
  final String? title;
  final String? subtitle;
  final bool showBackBtn;
  final AppIcons backIcon;
  final String? backBtnSemantics;
  final bool isTransparent;
  final VoidCallback? onBack;
  final Widget Function(BuildContext context)? trailing;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isTransparent ? Colors.transparent : ThemeColor.black,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          // height: 64 * $styles.scale,
          height: 64 * 0.5,
          child: Stack(
            children: [
              MergeSemantics(
                child: Semantics(
                  header: true,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Text(
                            title!.toUpperCase(),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            style:AppStyle().text.h4.copyWith(
                              color: AppStyle().colors.offWhite,
                              fontWeight: FontWeight.w500,
                            ),
                            // style:  TextStyle(fontFamily: 'Tenor', fontWeight:FontWeight.w500, color: ThemeColor.white,fontSize: 14, height:23, wordSpacing: 5 ),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!.toUpperCase(),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            style: 
                              TextStyle(fontFamily: 'Tenor',fontSize: 16,height: 16.38)
                            
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Row(children: [
                    Gap(16 * 1),
                    if (showBackBtn)
                      BackBtn(
                        onPressed: onBack,
                        icon: backIcon,
                        semanticLabel: backBtnSemantics,
                      ),
                    Spacer(),
                    if (trailing != null) trailing!.call(context),
                    Gap(AppStyle().insets.sm),
                    //if (showBackBtn) Container(width: $styles.insets.lg * 2, alignment: Alignment.centerLeft, child: child),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}