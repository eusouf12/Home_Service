import 'package:get/get.dart';

class ProviderHomeController extends GetxController {
  // Stats
  var offersReceived = 128.obs;
  var offersReceivedTrend = "+12%".obs;
  
  var acceptedRate = 94.obs;
  var acceptedRateTrend = "+3%".obs;
  
  var responseSpeed = "4.2m".obs;
  
  var walletBalance = 1240.obs;

  // Recent Activity
  var activities = [
    {
      "type": "lead",
      "title": "New Lead: Home Repair",
      "time": "2 minutes ago",
      "location": "Brooklyn, NY",
      "actionLabel": "View"
    },
    {
      "type": "payment",
      "title": "Payment Received",
      "time": "1 hour ago",
      "details": "Order #8421",
      "amount": "+\$450.00"
    },
    {
      "type": "review",
      "title": "New 5-Star Review",
      "time": "3 hours ago",
      "from": "Sarah J.",
      "rating": 5
    },
  ].obs;
}
