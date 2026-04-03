import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedFilterChipIndex = 0.obs;

  final List<String> categories = [
    "Plumbing",
    "Electrical Services",
    "HVAC",
    "Handyman",
  ];

  final List<String> filterChips = [
    "Leak repair",
    "Drain cleaning",
    "Pipe installation & repair",
    "Water heater",
  ];

  final List<Map<String, dynamic>> bestProviders = [
    {
      "name": "Air-Plumbing",
      "rating": 4.9,
      "reviews": 254,
      "distance": "0.8 mi away",
      "travelDistance": "0.7 miles",
      "jobsCompleted": 375,
      "responseTime": "5 mins",
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Pro Fixers",
      "rating": 4.7,
      "reviews": 120,
      "distance": "1.2 mi away",
      "travelDistance": "1.0 miles",
      "jobsCompleted": 200,
      "responseTime": "10 mins",
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
    },
  ];

  final List<Map<String, dynamic>> topTrending = [
    {
      "name": "Smart Plumbing",
      "rating": 4.8,
      "reviews": 180,
      "distance": "0.5 mi away",
      "travelDistance": "0.8 miles away",
      "jobsCompleted": 320,
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/3.jpg",
    },
    {
      "name": "Elite Plumbing",
      "rating": 4.8,
      "reviews": 180,
      "distance": "0.8 mi away",
      "travelDistance": "1.2 miles away",
      "jobsCompleted": 280, // Note: Figma says "Fast response | 0.8 mi away" for Elite Plumbing. Let's adjust jobsCompleted string to that
      "fastResponse": true,
      "availableNow": true,
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/4.jpg",
    },
  ];
}
