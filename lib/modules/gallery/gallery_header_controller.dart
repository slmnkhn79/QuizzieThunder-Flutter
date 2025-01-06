import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/datepair_api.dart';
import 'package:quizzie_thunder/models/gallery_details_response_model.dart';
import 'package:quizzie_thunder/models/gallery_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class GalleryHeaderController extends GetxController {
  var arguments = Get.arguments;
  var test = Get.arguments[ARG_SCHOOL_ID];
  String schoolId = '';

  // String? selectedYear;
  // String? selectedMonth;

  DatepairApi datepairApi = DatepairApi();

  GalleryResponseModel? galleryResponseModel;
  GalleryDetailsResponseModel? galleryDetailsResponseModel;

  var eventSelectedDay = DateTime.now().obs;

  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;
  var selectedEventId = ''.obs;

  var isLoading = false.obs;
  var isLoadingGallery = true.obs;
  var isLoadingEventGallery = true.obs;

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

  List<String> year =[
    '2022','2023','2024','2025'
  ];

  @override
  void onInit() {
    if (arguments != null) {
      schoolId = arguments[ARG_SCHOOL_ID];
    }
    super.onInit();
  }


   @override
  void onReady() {
    getEventByDate();
    super.onReady();
  }


  

  void getEventByDate() async {
    eventSelectedDay.value = DateTime(selectedYear.value, selectedMonth.value,1);

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
  Future<void> getEventById() async {

    isLoadingEventGallery.value = true;
    var response = await datepairApi.getEventsById(selectedEventId.value);
    if (response.code == 200) {
      galleryDetailsResponseModel = response;
      isLoadingEventGallery.value = false;
    } else {
      isLoadingEventGallery.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
