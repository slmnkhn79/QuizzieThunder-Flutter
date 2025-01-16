import 'package:get/get.dart';
import 'package:quizzie_thunder/apis/search_api.dart';
import 'package:quizzie_thunder/models/search_dialog_response_model.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/enums/snackbar_status.dart';

class SearchResultsController extends GetxController {
  SearchApi searchApi = SearchApi();

  var isLoading = true.obs;

  SearchDialogResponseModel? searchDialogResponseModel;


  Future<void> getSearchResults(String input) async {
    isLoading.value = true;
    var response = await searchApi.getSearchDialogDetails(input);
    if (response.code == 200) {
      print("response was 200");
      searchDialogResponseModel = response;
      isLoading.value = false;
    } else {
      print("response was not 200");
      isLoading.value = false;
      // AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}