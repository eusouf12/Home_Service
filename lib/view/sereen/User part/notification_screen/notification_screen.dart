import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Mark all as read",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationCard(
            icon: Icons.build,
            title: "Service update",
            subtitle:
                "Your plumbing request has a new offer from 3 providers.",
            time: "2 mins ago",
            isUnread: true,
          ),
          NotificationCard(
            icon: Icons.person,
            title: "Message",
            subtitle:
                "Alex Johnson sent you a message regarding the scheduled visit.",
            time: "15 mins ago",
            isUnread: true,
          ),
          NotificationCard(
            icon: Icons.settings,
            title: "System",
            subtitle:
                "Your subscription will renew in 3 days. Ensure your payment method is up to date.",
            time: "5 hours ago",
            isUnread: false,
          ),
          NotificationCard(
            icon: Icons.local_offer,
            title: "Promotional",
            subtitle:
                "Get 20% off your next cleaning service. Use code CLEAN20.",
            time: "Yesterday",
            isUnread: true,
          ),
          NotificationCard(
            icon: Icons.check_circle,
            title: "Job Completed",
            subtitle:
                "Your garden maintenance request has been marked as completed.",
            time: "2 days ago",
            isUnread: false,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon box
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.teal),
          ),

          const SizedBox(width: 12),

          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // unread dot
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}