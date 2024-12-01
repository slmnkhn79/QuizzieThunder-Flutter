part of '../editorial_screen.dart';

class _TitleText extends StatelessWidget {
  const _TitleText(this.data, {super.key, required this.scroller});
  final WonderData data;
  // final dynamic data;
  final ScrollController scroller;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: DefaultTextColor(
        color: AppStyle().colors.offWhite,
        child: StaticTextScale(
          child: Center(
            child: SizedBox(
              width: AppStyle().sizes.maxContentWidth1,
              child: Column(
                children: [
                  Gap(AppStyle().insets.md),
                  Gap(30),

                  /// Sub-title row
                  SeparatedRow(
                    padding: EdgeInsets.symmetric(horizontal: AppStyle().insets.sm),
                    separatorBuilder: () => Gap(AppStyle().insets.sm),
                    children: [
                      Expanded(
                        child: Divider(
                          color: data.type.fgColor,
                        ).animate().scale(curve: Curves.easeOut, delay: 500.ms),
                      ),
                      Semantics(
                        header: true,
                        sortKey: OrdinalSortKey(1),
                        child: Text(
                          data.subTitle.toUpperCase(),
                          style: AppStyle().text.title2,
                        ).animate().fade(delay: 100.ms),
                      ),
                      Expanded(
                        child: Divider(
                          color: data.type.fgColor,
                        ).animate().scale(curve: Curves.easeOut, delay: 500.ms),
                      ),
                    ],
                  ),
                  Gap(AppStyle().insets.md),

                  /// Wonder title text
                  Semantics(
                    sortKey: OrdinalSortKey(0),
                    child: AnimatedBuilder(
                        animation: scroller,
                        builder: (_, __) {
                          final yPos = ContextUtils.getGlobalPos(context)?.dy ?? 0;
                          bool enableHero = yPos > -100;
                          // return WonderTitleText(data, enableHero: enableHero);
                          return Text("Wonder Title Text");
                        }),
                  ),
                  Gap(AppStyle().insets.xs),

                  /// Region
                  Text(
                    data.regionTitle.toUpperCase(),
                    style: AppStyle().text.title1,
                    textAlign: TextAlign.center,
                  ),
                  Gap(AppStyle().insets.md),

                  /// Compass divider
                  ExcludeSemantics(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppStyle().insets.sm),
                      child: AnimatedBuilder(
                        animation: scroller,
                        builder: (_, __) => CompassDivider(
                          isExpanded: scroller.position.pixels <= 0,
                          linesColor: data.type.fgColor,
                          compassColor: AppStyle().colors.offWhite,
                        ),
                      ),
                    ),
                  ),
                  Gap(AppStyle().insets.sm),

                  /// Date
                  Text(
                    // $strings.titleLabelDate(StringUtils.formatYr(data.startYr), StringUtils.formatYr(data.endYr)),
                    "title Label Date",
                    style: AppStyle().text.h4,
                    textAlign: TextAlign.center,
                  ),
                  Gap(AppStyle().insets.sm),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
