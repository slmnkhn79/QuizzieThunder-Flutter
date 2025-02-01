import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/search/search_data.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';


part 'search/petra_search_data.dart';

class PetraData extends WonderData {
  PetraData()
      : super(
          searchData: _searchData, // included as a part from ./search/
          searchSuggestions: _searchSuggestions, // included as a part from ./search/
          type: WonderType.petra,
          title: AppStrings().petraTitle,
          subTitle: AppStrings().petraSubTitle,
          regionTitle: AppStrings().petraRegionTitle,
          videoId: 'ezDiSkOU0wc',
          startYr: -312,
          endYr: 100,
          artifactStartYr: -500,
          artifactEndYr: 500,
          artifactCulture: AppStrings().petraArtifactCulture,
          artifactGeolocation: AppStrings().petraArtifactGeolocation,
          lat: 30.328830750209903,
          lng: 35.44398203484667,
          unsplashCollectionId: 'qWQJbDvCMW8',
          pullQuote1Top: AppStrings().petraPullQuote1Top,
          pullQuote1Bottom: AppStrings().petraPullQuote1Bottom,
          pullQuote1Author: AppStrings().petraPullQuote1Author,
          pullQuote2: AppStrings().petraPullQuote2,
          pullQuote2Author: AppStrings().petraPullQuote2Author,
          callout1: AppStrings().petraCallout1,
          callout2: AppStrings().petraCallout2,
          videoCaption: AppStrings().petraVideoCaption,
          mapCaption: AppStrings().petraMapCaption,
          historyInfo1: AppStrings().petraHistoryInfo1,
          historyInfo2: AppStrings().petraHistoryInfo2,
          constructionInfo1: AppStrings().petraConstructionInfo1,
          constructionInfo2: AppStrings().petraConstructionInfo2,
          locationInfo1: AppStrings().petraLocationInfo1,
          locationInfo2: AppStrings().petraLocationInfo2,
          highlightArtifacts: const [
            '325900',
            '325902',
            '325919',
            '325884',
            '325887',
            '325891',
          ],
          hiddenArtifacts: const [
            '322592',
            '325918',
            '326243',
          ],
          events: {
            -1200: AppStrings().petra1200bce,
            -106: AppStrings().petra106bce,
            551: AppStrings().petra551ce,
            1812: AppStrings().petra1812ce,
            1958: AppStrings().petra1958ce,
            1989: AppStrings().petra1989ce,
          },
        );
}
