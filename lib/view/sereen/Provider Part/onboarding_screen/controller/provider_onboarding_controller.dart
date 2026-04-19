import 'package:get/get.dart';

class ProviderOnboardingController extends GetxController {
  // Account Info
  var fullName = "".obs;
  var email = "".obs;
  var phone = "".obs;

  // Business Profile
  var serviceCategories = ["Plumbing", "Electrical", "Cleaning", "Landscaping"].obs;
  var selectedCategories = <String>[].obs;
  var serviceRadius = 20.0.obs; // In miles/km

  // Monetization Plans
  var selectedPlan = "Subscription".obs;

  // Wallet
  var initialBalance = 0.0.obs;
  var selectedTopUp = 100.obs;

  // AI Agent Settings
  var isAiDraftingEnabled = true.obs;
  var isAutoResponseEnabled = false.obs;

  // Business Hours
  var businessHours = [
    {"day": "Mon - Fri", "hours": "08:00 AM - 05:00 PM"},
    {"day": "Sat", "hours": "09:00 AM - 01:00 PM"},
    {"day": "Sun", "hours": "Closed"},
  ].obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void addCategory(String category) {
    if (category.isNotEmpty && !serviceCategories.contains(category)) {
      serviceCategories.add(category);
      selectedCategories.add(category);
    }
  }

  void setPlan(String plan) {
    selectedPlan.value = plan;
  }

  void setTopUp(int amount) {
    selectedTopUp.value = amount;
  }

  void toggleAiDrafting(bool value) {
    isAiDraftingEnabled.value = value;
  }

  void toggleAutoResponse(bool value) {
    isAutoResponseEnabled.value = value;
  }
}
