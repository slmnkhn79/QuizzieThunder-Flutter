import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizzie_thunder/apis/search_api.dart';
import 'package:quizzie_thunder/models/search_dialog_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class SearchResultsController extends GetxController {
  SearchApi discoverApi = SearchApi();

  var isLoading = true.obs;

  SearchDialogResponseModel? searchDialogResponseModel;

  @override
  void onInit() {
    super.onInit();
  }

  void getSearchResults(String input) async {
    isLoading.value = true;
    var response = await discoverApi.getSearchDialogDetails(input);
    if (response.code == 200) {
      searchDialogResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}