part of '../editorial_screen.dart';

class _Callout extends StatelessWidget {
  final String text;

  const _Callout({required this.text});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(color: AppStyle().colors.accent1, width: 1),
          Gap(AppStyle().insets.sm),
          Expanded(
            child: Text(
              text,
              style: AppStyle().text.callout,
            ),
          )
        ],
      ),
    );
  }
}
