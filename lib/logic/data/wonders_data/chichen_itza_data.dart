import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/chichen_itza_search_data.dart';

class ChichenItzaData extends WonderData {
  ChichenItzaData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.chichenItza,
          title: AppStrings().chichenItzaTitle,
          subTitle: AppStrings().chichenItzaSubTitle,
          regionTitle: AppStrings().chichenItzaRegionTitle,
          videoId: 'Q6eBJjdca14',
          startYr: 550,
          endYr: 1550,
          artifactStartYr: 500,
          artifactEndYr: 1600,
          artifactCulture: AppStrings().chichenItzaArtifactCulture,
          artifactGeolocation: AppStrings().chichenItzaArtifactGeolocation,
          lat: 20.68346184201756,
          lng: -88.56769676930931,
          unsplashCollectionId: 'SUK0tuMnLLw',
          pullQuote1Top: AppStrings().chichenItzaPullQuote1Top,
          pullQuote1Bottom: AppStrings().chichenItzaPullQuote1Bottom,
          pullQuote1Author: '',
          pullQuote2: AppStrings().chichenItzaPullQuote2,
          pullQuote2Author: AppStrings().chichenItzaPullQuote2Author,
          callout1: AppStrings().chichenItzaCallout1,
          callout2: AppStrings().chichenItzaCallout2,
          videoCaption: AppStrings().chichenItzaVideoCaption,
          mapCaption: AppStrings().chichenItzaMapCaption,
          historyInfo1: AppStrings().chichenItzaHistoryInfo1,
          historyInfo2: AppStrings().chichenItzaHistoryInfo2,
          constructionInfo1: AppStrings().chichenItzaConstructionInfo1,
          constructionInfo2: AppStrings().chichenItzaConstructionInfo2,
          locationInfo1: AppStrings().chichenItzaLocationInfo1,
          locationInfo2: AppStrings().chichenItzaLocationInfo2,
          highlightArtifacts: const [
            '503940',
            '312595',
            '310551',
            '316304',
            '313151',
            '313256',
          ],
          hiddenArtifacts: const [
            '701645',
            '310555',
            '286467',
          ],
          events: {
            600: AppStrings().chichenItza600ce,
            832: AppStrings().chichenItza832ce,
            998: AppStrings().chichenItza998ce,
            1100: AppStrings().chichenItza1100ce,
            1527: AppStrings().chichenItza1527ce,
            1535: AppStrings().chichenItza1535ce,
          },
        );
}
