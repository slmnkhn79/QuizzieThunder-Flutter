import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizzie_thunder/apis/event_details_api.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class AddPostController extends GetxController {
  EventDetailsApi eventDetailsApi = EventDetailsApi();

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

  void uploadEventDetails() async {
    isLoading.value = true;
    var response = await eventDetailsApi.postEventDetails(bytesData!,'file.jpg');
    print(response);
    if (response == 200) {
      
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
