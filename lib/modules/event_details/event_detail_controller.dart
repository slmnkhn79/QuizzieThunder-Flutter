import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/school_details_api.dart';
import 'package:quizzie_thunder/models/event_detail_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';



class EventDetailsController extends GetxController {
  SchoolDetailsApi eventDetailsApi = SchoolDetailsApi();

  var isLoading = true.obs;
  var eventId = ''.obs;

  EventDetailsResponseModel? eventDetailsResponseModel;

  @override
  void onInit() {
    // getEventDetails();
    super.onInit();
  }

  void getEventDetails() async {
    isLoading.value = true;
    var response = await eventDetailsApi.getEventDetails(eventId:eventId.value);
    if (response.code == 200) {
      eventDetailsResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
