import 'package:get/get.dart';

class ProviderBookingController extends GetxController {
  var selectedTab = 0.obs;

  var activeLeads = [
    {
      "type": "Plumbing Service",
      "received": "5m ago",
      "distance": "2 miles away",
      "estimate": "\$150 - \$200",
      "expiring": "04:59",
      "icon": "plumbing"
    },
    {
      "type": "Electrical Repair",
      "received": "12m ago",
      "distance": "4.5 miles away",
      "estimate": "\$300 - \$450",
      "expiring": "12:20",
      "icon": "electrical"
    }
  ].obs;

  var completedLeads = [
    {
      "type": "Plumbing",
      "client": "John Doe",
      "date": "Oct 24, 2023",
      "time": "2:30 PM",
      "amount": "\$145.00",
      "status": "PAID"
    },
    {
      "type": "Electrical",
      "client": "Sarah Smith",
      "date": "Oct 22, 2023",
      "time": "10:15 AM",
      "amount": "\$280.00",
      "status": "PAID"
    },
    {
      "type": "HVAC",
      "client": "Mike Wilson",
      "date": "Oct 19, 2023",
      "time": "4:45 PM",
      "amount": "\$1,200.00",
      "status": "PAID"
    },
    {
      "type": "Painting",
      "client": "Alice Brown",
      "date": "Oct 15, 2023",
      "time": "9:00 AM",
      "amount": "\$450.00",
      "status": "PAID"
    }
  ].obs;

  var declinedLeads = [
    {
      "type": "Deep Home Clean...",
      "location": "Brooklyn, NY",
      "date": "Oct 12, 2023",
      "reason": "Service area mismatch"
    },
    {
      "type": "Plumbing Repair",
      "location": "Queens, NY",
      "date": "Oct 10, 2023",
      "reason": "Schedule conflict"
    },
    {
      "type": "Electrical Installat...",
      "location": "Manhattan, NY",
      "date": "Oct 08, 2023",
      "reason": "Customer budget too low"
    }
  ].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
