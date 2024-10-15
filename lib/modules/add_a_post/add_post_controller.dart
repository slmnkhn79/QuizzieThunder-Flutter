



import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddPostController extends GetxController {
  // EventDetailsApi eventDetailsApi = EventDetailsApi();

  var isLoading = true.obs;
  // var eventId = ''.obs;

  // EventDetailsResponseModel? eventDetailsResponseModel;

  @override
  void onInit() {
    // getEventDetails();
    super.onInit();
  }

  void getEventDetails() async {
    isLoading.value = true;
    // var response = await eventDetailsApi.getEventDetails(eventId:eventId.value);
    // if (response.code == 200) {
    //   eventDetailsResponseModel = response;
    //   isLoading.value = false;
    // } else {
    //   isLoading.value = false;
    //   AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    // }
  }
}
