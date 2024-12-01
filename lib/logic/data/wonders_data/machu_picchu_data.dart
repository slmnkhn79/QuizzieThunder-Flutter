import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';

part 'search/machu_picchu_search_data.dart';

class MachuPicchuData extends WonderData {
  MachuPicchuData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.machuPicchu,
          title: AppStrings().machuPicchuTitle,
          subTitle: AppStrings().machuPicchuSubTitle,
          regionTitle: AppStrings().machuPicchuRegionTitle,
          videoId: 'cnMa-Sm9H4k',
          startYr: 1450,
          endYr: 1572,
          artifactStartYr: 1200,
          artifactEndYr: 1700,
          artifactCulture: AppStrings().machuPicchuArtifactCulture,
          artifactGeolocation: AppStrings().machuPicchuArtifactGeolocation,
          lat: -13.162690683637758,
          lng: -72.54500778824891,
          unsplashCollectionId: 'wUhgZTyUnl8',
          pullQuote1Top: AppStrings().machuPicchuPullQuote1Top,
          pullQuote1Bottom: AppStrings().machuPicchuPullQuote1Bottom,
          pullQuote1Author: AppStrings().machuPicchuPullQuote1Author,
          pullQuote2: AppStrings().machuPicchuPullQuote2,
          pullQuote2Author: AppStrings().machuPicchuPullQuote2Author,
          callout1: AppStrings().machuPicchuCallout1,
          callout2: AppStrings().machuPicchuCallout2,
          videoCaption: AppStrings().machuPicchuVideoCaption,
          mapCaption: AppStrings().machuPicchuMapCaption,
          historyInfo1: AppStrings().machuPicchuHistoryInfo1,
          historyInfo2: AppStrings().machuPicchuHistoryInfo2,
          constructionInfo1: AppStrings().machuPicchuConstructionInfo1,
          constructionInfo2: AppStrings().machuPicchuConstructionInfo2,
          locationInfo1: AppStrings().machuPicchuLocationInfo1,
          locationInfo2: AppStrings().machuPicchuLocationInfo2,
          highlightArtifacts: const [
            '313295',
            '316926',
            '309944',
            '309436',
            '309960',
            '316873',
          ],
          hiddenArtifacts: const [
            '308120',
            '309960',
            '313341',
          ],
          events: {
            1438: AppStrings().machuPicchu1438ce,
            1572: AppStrings().machuPicchu1572ce,
            1867: AppStrings().machuPicchu1867ce,
            1911: AppStrings().machuPicchu1911ce,
            1964: AppStrings().machuPicchu1964ce,
            1997: AppStrings().machuPicchu1997ce,
          },
        );
}
