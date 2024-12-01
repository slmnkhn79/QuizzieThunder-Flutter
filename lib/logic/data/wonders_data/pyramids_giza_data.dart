import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/pyramids_giza_search_data.dart';

class PyramidsGizaData extends WonderData {
  PyramidsGizaData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.pyramidsGiza,
          title: AppStrings().pyramidsGizaTitle,
          subTitle: AppStrings().pyramidsGizaSubTitle,
          regionTitle: AppStrings().pyramidsGizaRegionTitle,
          videoId: 'lJKX3Y7Vqvs',
          startYr: -2600,
          endYr: -2500,
          artifactStartYr: -2800,
          artifactEndYr: -2300,
          artifactCulture: AppStrings().pyramidsGizaArtifactCulture,
          artifactGeolocation: AppStrings().pyramidsGizaArtifactGeolocation,
          lat: 29.9792,
          lng: 31.1342,
          unsplashCollectionId: 'CSEvB5Tza9E',
          pullQuote1Top: AppStrings().pyramidsGizaPullQuote1Top,
          pullQuote1Bottom: AppStrings().pyramidsGizaPullQuote1Bottom,
          pullQuote1Author: '',
          pullQuote2: AppStrings().pyramidsGizaPullQuote2,
          pullQuote2Author: AppStrings().pyramidsGizaPullQuote2Author,
          callout1: AppStrings().pyramidsGizaCallout1,
          callout2: AppStrings().pyramidsGizaCallout2,
          videoCaption: AppStrings().pyramidsGizaVideoCaption,
          mapCaption: AppStrings().pyramidsGizaMapCaption,
          historyInfo1: AppStrings().pyramidsGizaHistoryInfo1,
          historyInfo2: AppStrings().pyramidsGizaHistoryInfo2,
          constructionInfo1: AppStrings().pyramidsGizaConstructionInfo1,
          constructionInfo2: AppStrings().pyramidsGizaConstructionInfo2,
          locationInfo1: AppStrings().pyramidsGizaLocationInfo1,
          locationInfo2: AppStrings().pyramidsGizaLocationInfo2,
          highlightArtifacts: const [
            '543864',
            '546488',
            '557137',
            '543900',
            '543935',
            '544782',
          ],
          hiddenArtifacts: const [
            '546510',
            '543896',
            '545728',
          ],
          events: {
            -2575: AppStrings().pyramidsGiza2575bce,
            -2465: AppStrings().pyramidsGiza2465bce,
            -443: AppStrings().pyramidsGiza443bce,
            1925: AppStrings().pyramidsGiza1925ce,
            1979: AppStrings().pyramidsGiza1979ce,
            1990: AppStrings().pyramidsGiza1990ce,
          },
        );
}
