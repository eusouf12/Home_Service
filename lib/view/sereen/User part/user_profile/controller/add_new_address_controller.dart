import 'package:get/get.dart';

class AddNewAddressController extends GetxController {
  var selectedLabel = "Home".obs;
  var isDefault = false.obs;

  void selectLabel(String label) {
    selectedLabel.value = label;
  }

  void toggleDefault(bool value) {
    isDefault.value = value;
  }
}
