import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:table_calendar/table_calendar.dart';

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
                          galleryHeaderController.isLoadingGallery.value ? Container() :
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: galleryHeaderController.galleryResponseModel!.gallery.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading: Icon(Icons.timeline),
                                  title: Text(galleryHeaderController.galleryResponseModel!.gallery[index].date.toString()),

                                ),
                              );
                            },
                          ),
                        ],
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
