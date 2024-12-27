// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/logic/data/wonder_type.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/great_wall_data.dart';
import 'package:quizzie_thunder/logic/data/wonders_data/taj_mahal_data.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/lazy_indexed_stack.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/editorial_screen.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';

class SchoolDetails extends StatelessWidget {
  // FileData _fileData = FileData();

  const SchoolDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolController schoolController = Get.find<SchoolController>();

    // PlatformFile? objFile;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ThemeColor.white,
            )),
        // title: Obx(() => Text(
        //       schoolController.isLoading.value
        //           ? "School Details"
        //           : schoolController.schoolDetailsModel!.school.name!,
        //       style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //           color: ThemeColor.white),
        //     )
        //     ),
        
        backgroundColor: ThemeColor.headerOne,
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: ThemeColor.facebook_light_4,
      body: Obx(
        () => schoolController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 600
                        ? 600
                        : MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.width,
                    child: Container(
                      color: ThemeColor.headerThree,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text("Editorial Screem"),
                            // ColoredBox(
                            //   child: WonderEditorialScreen(GreatWallData(), contentPadding: EdgeInsets.all(16)))
                            ColoredBox(
                              color: Colors.black,
                              child: LazyIndexedStack(
                                index: 0,
                                children: [
                                  WonderEditorialScreen(
                                      WonderData(
                                        searchData : [], // included as a part from ./search/
                                        searchSuggestions : [],
                                        type : WonderType.tajMahal,
                                        title : schoolController.schoolDetailsModel!.school.name!,                                 
                                        subTitle : schoolController.schoolDetailsModel!.school.schoolType,
                                        regionTitle :"${schoolController.schoolDetailsModel!.school.city} ${schoolController.schoolDetailsModel!.school.state}",
                                        photo1 : schoolController.schoolDetailsModel!.school.photo1,
                                        photo2: schoolController.schoolDetailsModel!.school.photo2,
                                        photo3 : schoolController.schoolDetailsModel!.school.photo3,
                                        headerPhoto:  schoolController.schoolDetailsModel!.school.headerImageUrl,

                                        startYr : schoolController.schoolDetailsModel!.school.startYear,
                                        endYr : schoolController.schoolDetailsModel!.school.endYear,
                                        artifactStartYr : 1600,
                                        artifactEndYr : 1700,
                                        artifactCulture : AppStrings().tajMahalArtifactCulture,
                                        artifactGeolocation : AppStrings().tajMahalArtifactGeolocation,
                                        lat : 27.17405039840427,
                                        lng : 78.04211890065208,
                                        unsplashCollectionId : '684IRta86_c',
                                        pullQuote1Top :schoolController.schoolDetailsModel!.school.pullQuote1Top,
                                        pullQuote1Bottom : schoolController.schoolDetailsModel!.school.pullQuote1Bottom,
                                        pullQuote1Author : '',
                                        pullQuote2 :schoolController.schoolDetailsModel!.school.pullQuote2,
                                        pullQuote2Author : AppStrings().tajMahalPullQuote2Author,
                                        callout1 :AppStrings().tajMahalCallout1,
                                        callout2 :schoolController.schoolDetailsModel!.school.callout2,                                        
                                        videoCaption :schoolController.schoolDetailsModel!.school.videoCaption,
                                        videoId : schoolController.schoolDetailsModel!.school.videoId,
                                        mapCaption :"",
                                        historyInfo1 :schoolController.schoolDetailsModel!.school.description,
                                        historyInfo2 :schoolController.schoolDetailsModel!.school.historyInfo2,
                                        constructionInfo1 : schoolController.schoolDetailsModel!.school.constructionInfo1,
                                        constructionInfo2 : schoolController.schoolDetailsModel!.school.constructionInfo2,
                                        locationInfo1 :schoolController.schoolDetailsModel!.school.locationInfo1,
                                        locationInfo2 :schoolController.schoolDetailsModel!.school.locationInfo2,
                                        highlightArtifacts : const [
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
                                      ),
                                      contentPadding: EdgeInsets.all(16)),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
