import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/datepair_api.dart';
import 'package:quizzie_thunder/models/gallery_date_response_model.dart';
import 'package:quizzie_thunder/models/gallery_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class GalleryHeaderController extends GetxController {
  final arguments = Get.arguments;
  String schoolId = '';

  // String? selectedYear;
  // String? selectedMonth;

  DatepairApi datepairApi = DatepairApi();

  GalleryResponseModel? galleryResponseModel;

  var eventSelectedDay = DateTime.now().obs;

  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;

  var isLoading = false.obs;
  var isLoadingGallery = true.obs;

  List<dynamic> months = [
    {"month_name": "Jan", "month": 1},
    {"month_name": "Feb", "month": 2},
    {"month_name": "Mar", "month": 3},
    {"month_name": "Apr", "month": 4},
    {"month_name": "May", "month": 5},
    {"month_name": "Jun", "month": 6},
    {"month_name": "July", "month": 7},
    {"month_name": "Aug", "month": 8},
    {"month_name": "Sept", "month": 9},
    {"month_name": "Oct", "month": 10},
    {"month_name": "Nov", "month": 11},
    {"month_name": "Dec", "month": 12}
  ];

  @override
  void onInit() {
    if (arguments != null) {
      schoolId = arguments[ARG_SCHOOL_ID];
    }
    super.onInit();
  }

  void updateMonth(int month) {
    selectedMonth.value = month;
  }

  void updateYear(int year) {
    selectedYear.value = year;
  }

  void getEventByDate(DateTime selectedDay) async {
    eventSelectedDay.value = selectedDay;
    print(eventSelectedDay.value);
    isLoadingGallery.value = true;
    var response = await datepairApi.getEventsByDate(eventSelectedDay.value,schoolId);
    if (response.code == 200) {
      galleryResponseModel = response;
      isLoadingGallery.value = false;
    } else {
      isLoadingGallery.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
