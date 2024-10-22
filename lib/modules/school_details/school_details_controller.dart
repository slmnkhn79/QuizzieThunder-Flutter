import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizzie_thunder/apis/school_details_api.dart';
import 'package:quizzie_thunder/models/school_details_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class SchoolController extends GetxController {

  SchoolDetailsApi schoolDetailsApi = SchoolDetailsApi();
  SchoolDetailsModel? schoolDetailsModel ;

  final arguments = Get.arguments;

  var isLoading = true.obs;
  // var eventId = ''.obs;
  // Uint8List? bytesData;
  // String filename ='';
  // var haveImage =false.obs;
  var schoolId = "NyEze2ZAwp";

  // EventDetailsResponseModel? eventDetailsResponseModel;

  @override
  void onInit() {
    if (arguments != null) {
      // print(arguments);
      schoolId = arguments[ARG_SCHOOL_DETAIL]  ?? "";
    }
    getSchoolDetails();
    super.onInit();
  }

  void getSchoolDetails() async {
    isLoading.value = true;
    var response = await schoolDetailsApi.getSchoolDetails(schoolId);
    
    if (response.code == 200) {
      schoolDetailsModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
