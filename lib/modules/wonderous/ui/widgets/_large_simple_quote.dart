part of '../editorial_screen.dart';

class _LargeSimpleQuote extends StatelessWidget {
  const _LargeSimpleQuote({super.key, required this.text, required this.author});
  final String text;
  final String author;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: CenteredBox(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: AppStyle().insets.lg, vertical: AppStyle().insets.xl),
        child: Column(
          children: [
            FractionalTranslation(
              translation: Offset(0, .5),
              child: Text(
                '“',
                style: AppStyle().text.quote1.copyWith(
                  color: AppStyle().colors.accent1,
                  fontSize: 90 * AppStyle().scale,
                  height: .7,
                ),
              ),
            ),
            Text(
              text,
              style: AppStyle().text.quote2,
              textAlign: TextAlign.center,
            ),
            Gap(AppStyle().insets.md),
            Text(
              '- $author',
              style: AppStyle().text.quote2Sub.copyWith(color: AppStyle().colors.accent1),
            ),
          ],
        ),
      ),
    );
  }
}
