import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/colosseum_search_data.dart';

class ColosseumData extends WonderData {
  ColosseumData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.colosseum,
          title: AppStrings().colosseumTitle,
          subTitle: AppStrings().colosseumSubTitle,
          regionTitle: AppStrings().colosseumRegionTitle,
          videoId: 'GXoEpNjgKzg',
          startYr: 70,
          endYr: 80,
          artifactStartYr: 0,
          artifactEndYr: 500,
          artifactCulture: AppStrings().colosseumArtifactCulture,
          artifactGeolocation: AppStrings().colosseumArtifactGeolocation,
          lat: 41.890242126393495,
          lng: 12.492349361871392,
          unsplashCollectionId: 'VPdti8Kjq9o',
          pullQuote1Top: AppStrings().colosseumPullQuote1Top,
          pullQuote1Bottom: AppStrings().colosseumPullQuote1Bottom,
          pullQuote1Author: '',
          pullQuote2: AppStrings().colosseumPullQuote2,
          pullQuote2Author: AppStrings().colosseumPullQuote2Author,
          callout1: AppStrings().colosseumCallout1,
          callout2: AppStrings().colosseumCallout2,
          videoCaption: AppStrings().colosseumVideoCaption,
          mapCaption: AppStrings().colosseumMapCaption,
          historyInfo1: AppStrings().colosseumHistoryInfo1,
          historyInfo2: AppStrings().colosseumHistoryInfo2,
          constructionInfo1: AppStrings().colosseumConstructionInfo1,
          constructionInfo2: AppStrings().colosseumConstructionInfo2,
          locationInfo1: AppStrings().colosseumLocationInfo1,
          locationInfo2: AppStrings().colosseumLocationInfo2,
          highlightArtifacts: const [
            '251350',
            '255960',
            '247993',
            '250464',
            '251476',
            '255960',
          ],
          hiddenArtifacts: const [
            '245376',
            '256570',
            '286136',
          ],
          events: {
            70: AppStrings().colosseum70ce,
            82: AppStrings().colosseum82ce,
            1140: AppStrings().colosseum1140ce,
            1490: AppStrings().colosseum1490ce,
            1829: AppStrings().colosseum1829ce,
            1990: AppStrings().colosseum1990ce,
          },
        );
}
