import 'package:get/get.dart';

class ProviderController extends GetxController {
  final RxString responseSpeed = "1 hour".obs;
  final RxString acceptanceRate = "98%".obs;

  final RxList<String> servicesOffered = <String>[
    "Interior Design",
    "Home Painting",
    "Maintenance",
    "Lighting Install"
  ].obs;

  final RxMap<String, String> businessHours = <String, String>{
    "Mon - Fri": "8:00 AM - 6:00 PM",
    "Saturday": "9:00 AM - 4:00 PM",
    "Sunday": "Closed"
  }.obs;

  final RxList<Map<String, dynamic>> recentProjects = <Map<String, dynamic>>[
    {
      "image": "https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=2070&auto=format&fit=crop",
    },
    {
      "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop",
    },
    {
      "image": "https://images.unsplash.com/photo-1540518614846-7eded433c457?q=80&w=2057&auto=format&fit=crop",
    },
    {
      "image": "https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=2070&auto=format&fit=crop",
    },
  ].obs;

  final RxList<Map<String, dynamic>> galleryProjects = <Map<String, dynamic>>[
    {
      "title": "Modern Kitchen Renovation",
      "images": [
        "https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=2070&auto=format&fit=crop",
        "https://images.unsplash.com/photo-1556909211-36987daf7b4d?q=80&w=2070&auto=format&fit=crop",
        "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?q=80&w=2070&auto=format&fit=crop",
      ]
    },
    {
      "title": "Minimalist Bedroom Design",
      "images": [
        "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=2070&auto=format&fit=crop",
        "https://images.unsplash.com/photo-1540518614846-7eded433c457?q=80&w=2057&auto=format&fit=crop",
      ]
    },
  ].obs;

  final RxList<Map<String, dynamic>> customerReviews = <Map<String, dynamic>>[
    {
      "author": "Sarah Jenkins",
      "date": "2 days ago",
      "rating": 5,
      "text": "The interior design team was incredible. They truly transformed our living space into a modern sanctuary. Very responsive and professional.",
      "avatar": "https://i.pravatar.cc/150?img=5"
    }
  ].obs;
}
