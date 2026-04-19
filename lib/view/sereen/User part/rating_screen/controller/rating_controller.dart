import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  RxInt rating = 5.obs;
  RxList<String> selectedTags = <String>[].obs;
  RxBool recommendProvider = true.obs;
  TextEditingController commentController = TextEditingController();

  List<String> allTags = [
    "Professional",
    "On time",
    "Affordable",
    "High quality work",
    "Friendly",
    "Clean work area",
    "Fast service",
    "Good communication"
  ];

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  void submitReview() {
    // Add logic to submit the review
    Get.back();
    Get.snackbar("Success", "Review submitted successfully!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
