import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/christ_redeemer_search_data.dart';

class ChristRedeemerData extends WonderData {
  ChristRedeemerData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.christRedeemer,
          title: AppStrings().christRedeemerTitle,
          subTitle: AppStrings().christRedeemerSubTitle,
          regionTitle: AppStrings().christRedeemerRegionTitle,
          videoId: 'k_615AauSds',
          startYr: 1922,
          endYr: 1931,
          artifactStartYr: 1600,
          artifactEndYr: 2100,
          artifactCulture: '',
          artifactGeolocation: AppStrings().christRedeemerArtifactGeolocation,
          lat: -22.95238891944396,
          lng: -43.21045520611561,
          unsplashCollectionId: 'dPgX5iK8Ufo',
          pullQuote1Top: AppStrings().christRedeemerPullQuote1Top,
          pullQuote1Bottom: AppStrings().christRedeemerPullQuote1Bottom,
          pullQuote1Author: '',
          pullQuote2: AppStrings().christRedeemerPullQuote2,
          pullQuote2Author: AppStrings().christRedeemerPullQuote2Author,
          callout1: AppStrings().christRedeemerCallout1,
          callout2: AppStrings().christRedeemerCallout2,
          videoCaption: AppStrings().christRedeemerVideoCaption,
          mapCaption: AppStrings().christRedeemerMapCaption,
          historyInfo1: AppStrings().christRedeemerHistoryInfo1,
          historyInfo2: AppStrings().christRedeemerHistoryInfo2,
          constructionInfo1: AppStrings().christRedeemerConstructionInfo1,
          constructionInfo2: AppStrings().christRedeemerConstructionInfo2,
          locationInfo1: AppStrings().christRedeemerLocationInfo1,
          locationInfo2: AppStrings().christRedeemerLocationInfo2,
          highlightArtifacts: const [
            '501319',
            '764815',
            '502019',
            '764814',
            '764816',
          ],
          hiddenArtifacts: const [
            '501302',
            '157985',
            '227759',
          ],
          events: {
            1850: AppStrings().christRedeemer1850ce,
            1921: AppStrings().christRedeemer1921ce,
            1922: AppStrings().christRedeemer1922ce,
            1926: AppStrings().christRedeemer1926ce,
            1931: AppStrings().christRedeemer1931ce,
            2006: AppStrings().christRedeemer2006ce,
          },
        );
}
