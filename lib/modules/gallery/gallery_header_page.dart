import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timelines/timelines.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryHeaderController galleryHeaderController =
        Get.find<GalleryHeaderController>();
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
          title: Obx(() => Text(
                galleryHeaderController.isLoading.value
                    ? "School Details"
                    : "School Details",
                // addPostController.quizCategoryName.isEmpty
                //     ? "Quizzes"
                //     : "${quizzesController.quizCategoryName} Quizzes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.white),
              )),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: false,
          elevation: 0,
        ),
        body: Obx(() => RefreshIndicator(
              onRefresh: () async {
                //fill the refresh value
              },
              child: galleryHeaderController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.headerOne,
                    ))
                  : SingleChildScrollView(
                      child: Center(
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width > 600
                              ? 600
                              : MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              TableCalendar(
                                daysOfWeekVisible: false,
                                headerStyle: HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                firstDay: DateTime(2000),
                                lastDay: DateTime(2025),
                                calendarStyle: CalendarStyle(
                                  outsideDaysVisible: false,
                                ),
                                focusedDay:
                                    galleryHeaderController.eventSelectedDay.value,
                                calendarFormat: CalendarFormat.twoWeeks,
                                onDaySelected: (selectedDay, focusedDay) {
                                  galleryHeaderController
                                      .getEventByDate(selectedDay);
                                },
                                selectedDayPredicate: (day) {
                                  return isSameDay(
                                      galleryHeaderController
                                          .eventSelectedDay.value,
                                      day);
                                },
                              ),
                              galleryHeaderController.isLoadingGallery.value
                                  ? Container()
                                  :
                          
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.height,
                                        child: FixedTimeline.tileBuilder(
                                          theme: TimelineTheme.of(context).copyWith(
                                            nodePosition: 0,
                                            connectorTheme:
                                                TimelineTheme.of(context)
                                                    .connectorTheme
                                                    .copyWith(
                                                      thickness: 5.0,
                                                    ),
                                            indicatorTheme:
                                                TimelineTheme.of(context)
                                                    .indicatorTheme
                                                    .copyWith(
                                                      size: 20.0,
                                                      position: 0.5,
                                                    ),
                                          ),
                                          builder: TimelineTileBuilder.fromStyle(
                                            contentsAlign: ContentsAlign.basic,
                                            contentsBuilder: (context, index) =>
                                                Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: (){

                                                },
                                                child: Card(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(20.0),
                                                        child: Text(
                                                          '${galleryHeaderController
                                                                  .galleryResponseModel!
                                                                  .gallery[index]
                                                                  .date.day}/${galleryHeaderController
                                                                  .galleryResponseModel!
                                                                  .gallery[index].date.month}/${galleryHeaderController
                                                                  .galleryResponseModel!
                                                                  .gallery[index].date.year}',
                                                          style: TextStyle(
                                                            color: Color(0xffb6b2b2),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(height: 1.0),
                                                      CachedNetworkImage(
                                                          imageUrl:
                                                              galleryHeaderController
                                                                  .galleryResponseModel!
                                                                  .gallery[index]
                                                                  .headerImageUrl),
                                                                  Divider(),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(galleryHeaderController
                                                            .galleryResponseModel!
                                                            .gallery[index]
                                                            .eventName),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            itemCount: galleryHeaderController
                                                .galleryResponseModel!
                                                .gallery
                                                .length,
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
            )));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
