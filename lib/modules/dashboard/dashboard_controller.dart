import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedTabIndex = 2.obs;

  void onItemTapped(int index) {
    selectedTabIndex.value = index;
  }
}
