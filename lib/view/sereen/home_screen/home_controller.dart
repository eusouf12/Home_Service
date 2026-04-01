import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedFilterChipIndex = 0.obs;

  final List<String> categories = [
    "Plumbing",
    "Electrical",
    "HVAC",
    "Handyman",
  ];

  final List<String> filterChips = [
    "Leak repair",
    "Pipe cleaning",
    "Drainage",
    "Installation",
  ];

  final List<Map<String, dynamic>> providers = [
    {
      "name": "John Doe",
      "rating": 4.9,
      "distance": "1.2 km",
      "responseTime": "5 mins",
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Smith & Sons",
      "rating": 4.8,
      "distance": "2.5 km",
      "responseTime": "10 mins",
      "isVerified": true,
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
    },
  ];
}
