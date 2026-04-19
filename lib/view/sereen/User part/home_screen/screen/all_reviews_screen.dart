import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import '../controller/provider_controller.dart';
import '../widget/provider_profile_widgets.dart';

class AllReviewsScreen extends StatelessWidget {
  AllReviewsScreen({super.key});

  final ProviderController controller = Get.find<ProviderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: CustomRoyelAppbar(
        titleName: "Customer Reviews",
        leftIcon: true,
      ),
      body: Obx(() {
        final reviews = controller.customerReviews;
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: CustomerReviewCard(
                authorName: review["author"],
                timeText: review["date"],
                content: review["text"],
                rating: review["rating"],
                avatarUrl: review["avatar"],
              ),
            );
          },
        );
      }),
    );
  }
}
