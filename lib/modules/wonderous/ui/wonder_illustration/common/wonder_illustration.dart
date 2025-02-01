
import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/chichen_itza_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/christ_redeemer_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/colosseum_illustration.dart';

import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/common/wonder_illustration_config.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/great_wall_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/machu_picchu_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/petra_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/pyramids_giza_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/taj_mahal_illustration.dart';


/// Convenience class for showing an illustration when all you have is the type.
class WonderIllustration extends StatelessWidget {
  const WonderIllustration(
    this.type,
    this.data,
     {super.key, required this.config});
  final WonderIllustrationConfig config;
  final WonderType type;
  final WonderData data;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      WonderType.chichenItza => ChichenItzaIllustration(config: config),
      WonderType.christRedeemer => ChristRedeemerIllustration(config: config),
      WonderType.colosseum => ColosseumIllustration(config: config),
      WonderType.greatWall => GreatWallIllustration(config: config),
      WonderType.machuPicchu => MachuPicchuIllustration(config: config),
      WonderType.petra => PetraIllustration(config: config),
      WonderType.pyramidsGiza => PyramidsGizaIllustration(config: config),
      WonderType.tajMahal => TajMahalIllustration(config: config, wdata: data)
    };
  }
}
