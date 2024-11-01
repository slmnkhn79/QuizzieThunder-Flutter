import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/school_details_api.dart';
import 'package:quizzie_thunder/models/school_details_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class AddSchoolController extends GetxController {
  SchoolDetailsApi eventDetailsApi = SchoolDetailsApi();
  SchoolDetailsModel? schoolDetailsModel ;

  var isLoading = true.obs;
  // var eventId = ''.obs;
  Uint8List? bytesData;
  String filename ='';
  var haveImage =false.obs;

  // EventDetailsResponseModel? eventDetailsResponseModel;

  @override
  void onInit() {
    // getEventDetails();
    super.onInit();
  }

  void uploadSchoolDetails() async {
    isLoading.value = true;
    var response = await eventDetailsApi.postSchoolDetails(schoolDetailsModel!);
    var result =json.decode(response);
    if (response.isNotEmpty) {
      String photoUrl = result['url'];
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
