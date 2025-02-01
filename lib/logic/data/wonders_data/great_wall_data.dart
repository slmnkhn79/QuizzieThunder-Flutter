import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/great_wall_search_data.dart';

class GreatWallData extends WonderData {
  GreatWallData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.greatWall,
          title: AppStrings().greatWallTitle,
          subTitle: AppStrings().greatWallSubTitle,
          regionTitle: AppStrings().greatWallRegionTitle,
          videoId: 'do1Go22Wu8o',
          startYr: -700,
          endYr: 1644,
          artifactStartYr: -700,
          artifactEndYr: 1650,
          artifactCulture: AppStrings().greatWallArtifactCulture,
          artifactGeolocation: AppStrings().greatWallArtifactGeolocation,
          lat: 40.43199751120627,
          lng: 116.57040708482984,
          unsplashCollectionId: 'Kg_h04xvZEo',
          pullQuote1Top: AppStrings().greatWallPullQuote1Top,
          pullQuote1Bottom: AppStrings().greatWallPullQuote1Bottom,
          pullQuote1Author: '', //No key because it doesn't generate for empty values
          pullQuote2: AppStrings().greatWallPullQuote2,
          pullQuote2Author: AppStrings().greatWallPullQuote2Author,
          callout1: AppStrings().greatWallCallout1,
          callout2: AppStrings().greatWallCallout2,
          videoCaption: AppStrings().greatWallVideoCaption,
          mapCaption: AppStrings().greatWallMapCaption,
          historyInfo1: AppStrings().greatWallHistoryInfo1,
          historyInfo2: AppStrings().greatWallHistoryInfo2,
          constructionInfo1: AppStrings().greatWallConstructionInfo1,
          constructionInfo2: AppStrings().greatWallConstructionInfo2,
          locationInfo1: AppStrings().greatWallLocationInfo1,
          locationInfo2: AppStrings().greatWallLocationInfo2,
          highlightArtifacts: const [
            '79091',
            '781812',
            '40213',
            '40765',
            '57612',
            '666573',
          ],
          hiddenArtifacts: const [
            '39918',
            '39666',
            '39735',
          ],
          events: {
            -700: AppStrings().greatWall700bce,
            -214: AppStrings().greatWall214bce,
            -121: AppStrings().greatWall121bce,
            556: AppStrings().greatWall556ce,
            618: AppStrings().greatWall618ce,
            1487: AppStrings().greatWall1487ce,
          },
        );
}
