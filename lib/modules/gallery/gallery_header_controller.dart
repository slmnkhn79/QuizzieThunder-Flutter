import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/datepair_api.dart';
import 'package:quizzie_thunder/models/gallery_date_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class GalleryHeaderController extends GetxController {
    final arguments = Get.arguments;
    String schoolId = '';

    DatepairApi datepairApi = DatepairApi();
    GalleryDatesResponseModel? galleryDatesResponse;
    var isLoading = false.obs;

  @override
  void onInit(){
    
    if(arguments != null){
      schoolId = arguments[ARG_SCHOOL_ID];
    }
    getAllDates();
    super.onInit();
  }
  void getAllDates() async{
    isLoading.value = true;
    var response = await datepairApi.getEventDatesDetail();
    if (response.code == 200) {
      galleryDatesResponse = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}