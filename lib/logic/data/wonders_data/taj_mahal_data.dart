import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';

part 'search/taj_mahal_search_data.dart';

class TajMahalData extends WonderData {
  TajMahalData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.tajMahal,
          title: AppStrings().tajMahalTitle,
          subTitle: AppStrings().tajMahalSubTitle,
          regionTitle: AppStrings().tajMahalRegionTitle,
          videoId: 'EWkDzLrhpXI',
          startYr: 1632,
          endYr: 1653,
          artifactStartYr: 1600,
          artifactEndYr: 1700,
          artifactCulture: AppStrings().tajMahalArtifactCulture,
          artifactGeolocation: AppStrings().tajMahalArtifactGeolocation,
          lat: 27.17405039840427,
          lng: 78.04211890065208,
          unsplashCollectionId: '684IRta86_c',
          pullQuote1Top: AppStrings().tajMahalPullQuote1Top,
          pullQuote1Bottom: AppStrings().tajMahalPullQuote1Bottom,
          pullQuote1Author: AppStrings().tajMahalPullQuote1Author,
          pullQuote2: AppStrings().tajMahalPullQuote2,
          pullQuote2Author: AppStrings().tajMahalPullQuote2Author,
          callout1: AppStrings().tajMahalCallout1,
          callout2: AppStrings().tajMahalCallout2,
          videoCaption: AppStrings().tajMahalVideoCaption,
          mapCaption: AppStrings().tajMahalMapCaption,
          historyInfo1: AppStrings().tajMahalHistoryInfo1,
          historyInfo2: AppStrings().tajMahalHistoryInfo2,
          constructionInfo1: AppStrings().tajMahalConstructionInfo1,
          constructionInfo2: AppStrings().tajMahalConstructionInfo2,
          locationInfo1: AppStrings().tajMahalLocationInfo1,
          locationInfo2: AppStrings().tajMahalLocationInfo2,
          highlightArtifacts: const [
            '453341',
            '453243',
            '73309',
            '24932',
            '56230',
            '35633',
          ],
          hiddenArtifacts: const [
            '24907',
            '453183',
            '453983',
          ],
          events: {
            1631: AppStrings().tajMahal1631ce,
            1647: AppStrings().tajMahal1647ce,
            1658: AppStrings().tajMahal1658ce,
            1901: AppStrings().tajMahal1901ce,
            1984: AppStrings().tajMahal1984ce,
            1998: AppStrings().tajMahal1998ce,
          },
        );
}
