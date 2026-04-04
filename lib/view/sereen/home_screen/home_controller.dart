import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedFilterChipIndex = 0.obs;

  final List<String> categories = [
    "Plumbing",
    "Electrical Services",
    "HVAC Services",
    "Handyman Services",
    "Appliance Repair",
    "Roofing Services",
    "Painting Services",
  ];

  final Map<String, List<String>> _subCategories = {
     "Plumbing": [
      "Leak repair",
      "Drain cleaning",
      "Pipe installation & repair",
      "Water heater services",
      "Bathroom & plumbing",
      "Emergency plumbing",
    ],
    "Electrical Services": [
      "Electrical Wiring & Rewiring",
      "Circuit Breaker Installation & Repair",
      "Lighting Installation (Indoor / Outdoor)",
      "Ceiling Fan Installation",
      "Electrical Panel Upgrade",
      "Outlet & Switch Installation",
      "Generator Installation & Repair",
      "EV Charger Installation",
      "Smart Home Electrical Setup",
      "Electrical Safety Inspection",
      "Power Backup Systems (UPS / Inverter)",
    ],
    "HVAC Services": [
      "Air Conditioner Installation",
      "AC Repair & Maintenance",
      "Furnace Installation & Repair",
      "Heat Pump Installation",
      "Duct Installation & Cleaning",
      "Thermostat Installation (Smart Thermostat)",
      "Ventilation System Installation",
      "Indoor Air Quality Solutions",
      "Refrigerant Recharge",
      "HVAC System Inspection",
      "HVAC Maintenance Plans",
    ],
    "Handyman Services": [
      "Furniture Assembly",
      "Door & Window Repair",
      "Curtain / Blind Installation",
      "Shelf & Wall Mount Installation",
      "TV Mounting",
      "Minor Plumbing Repairs",
      "Minor Electrical Fixes",
      "Caulking & Sealing",
      "Gutter Cleaning",
      "Home Maintenance & Small Repairs",
    ],
    "Appliance Repair": [
      "Refrigerator Repair",
      "Washing Machine Repair",
      "Dryer Repair",
      "Dishwasher Repair",
      "Oven / Stove Repair",
      "Microwave Repair",
      "Water Heater Repair",
      "Garbage Disposal Repair",
      "Freezer Repair",
      "Air Purifier Repair",
      "Small Appliance Repair",
    ],
    "Roofing Services": [
      "Roof Installation",
      "Roof Repair",
      "Roof Replacement",
      "Roof Inspection",
      "Leak Detection & Repair",
      "Shingle Roof Services",
      "Metal Roof Installation",
      "Flat Roof Services",
      "Roof Waterproofing",
      "Gutter Installation & Repair",
      "Roof Cleaning",
    ],
    "Painting Services": [
      "Interior Painting",
      "Exterior Painting",
      "Wall Texture Painting",
      "Decorative Painting",
      "Cabinet Painting",
      "Fence & Deck Painting",
      "Commercial Painting",
      "Wallpaper Installation & Removal",
      "Wall Repair & Surface Preparation",
      "Spray Painting",
    ],
  };

  RxList<String> filterChips = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _updateFilterChips();
    ever(selectedCategoryIndex, (_) => _updateFilterChips());
    ever(selectedFilterChipIndex, (_) => _shuffleProviders());
  }

  void _updateFilterChips() {
    selectedFilterChipIndex.value = 0;
    if (selectedCategoryIndex.value >= 0 && selectedCategoryIndex.value < categories.length) {
      String selectedCat = categories[selectedCategoryIndex.value];
      filterChips.value = _subCategories[selectedCat] ?? [];
    } else {
      filterChips.value = [];
    }
    _shuffleProviders();
  }

  void _shuffleProviders() {
    if (bestProviders.isNotEmpty) {
      var newList = bestProviders.toList();
      newList.shuffle();
      bestProviders.value = newList;
    }
    if (topTrending.isNotEmpty) {
      var newList = topTrending.toList();
      newList.shuffle();
      topTrending.value = newList;
    }
  }

  RxList<Map<String, dynamic>> bestProviders = <Map<String, dynamic>>[
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
  ].obs;

  RxList<Map<String, dynamic>> topTrending = <Map<String, dynamic>>[
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
  ].obs;
}
