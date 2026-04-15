import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
