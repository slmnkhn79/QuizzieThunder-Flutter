import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/button.dart';

class PopNavigatorUnderlay extends StatelessWidget {
  const PopNavigatorUnderlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: AppBtn.basic(
        onPressed: () => Navigator.of(context).pop(),
        semanticLabel: '',
        child: const SizedBox.expand(),
      ),
    );
  }
}
