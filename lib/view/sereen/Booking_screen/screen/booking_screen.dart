import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_nav_bar/navbar.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../controller/booking_controller.dart';
import '../widget/booking_card.dart';
import '../widget/past_booking_card.dart';
import '../widget/cancelled_booking_card.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: const CustomNavBar(currentIndex: 1),
        appBar: CustomRoyelAppbar(
          leftIcon: false,
          titleName: "My Requests",
          
        ),
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 0) {
                  return _buildUpcomingList();
                } else if (controller.selectedTab.value == 1) {
                  return _buildCompletedList();
                } else {
                  return _buildCancelledList();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F9),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Obx(
        () => Row(
          children: [
            _buildTabItem(title: "Upcoming", index: 0),
            _buildTabItem(title: "Past", index: 1),
            _buildTabItem(title: "Cancelled", index: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    bool isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF6D4D) : Colors.transparent,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFFFF6D4D).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: title,
            color: isSelected ? Colors.white : const Color(0xFF6B7280),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ).copyWith(bottom: 100.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return BookingCard(
          title: index == 1
              ? "Deep Home Cleaning"
              : index == 2
              ? "Emergency Plumbing"
              : "Electrical Repair",
          requestId: index == 1
              ? "#88291"
              : index == 2
              ? "#88292"
              : "#88293",
          imageUrl: index == 1
              ? null
              : index == 0
              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ610ot-BgDuM9FyyP8Yruf8rmtPQ011DfZg&s"
              : "https://goendlessenergy.com/wp-content/uploads/emergency-plumber-fixing-a-pipe-1024x680.webp",
          date: index == 1
              ? "June 24"
              : index == 2
              ? "June 25"
              : "June 26",
          topStatus: index == 1
              ? "MATCHING"
              : index == 2
              ? "DRAFT"
              : "IN PROGRESS",
          activeStep: index == 1
              ? 1
              : index == 2
              ? 0
              : 2,
          onMessage: () {},
          onViewDetails: () {
            Get.toNamed(AppRoutes.bookingDetailsScreen);
          },
        );
      },
    );
  }

  Widget _buildCompletedList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ).copyWith(bottom: 100.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return PastBookingCard(
          title: index == 0
              ? "House Painting"
              : index == 1
              ? "Window Cleaning"
              : "Lawn Mowing",
          description:
              "Full interior painting for 3-bedroom apartment with premium finish.",
          date: "May 15, 2023",
          status: "COMPLETED",
          imageUrl: index == 1
              ? "https://b2406121.smushcdn.com/2406121/wp-content/uploads/2025/05/wc-1-scaled.jpeg?lossy=1&strip=1&webp=1"
              : "https://media.istockphoto.com/id/1461683093/photo/man-painting-wall-with-light-blue-dye-indoors-back-view.jpg?s=612x612&w=0&k=20&c=TDg87xVDJh-VA4zVClGlMnqpdqTh2QcZ--raihCv9XU=",
          onRateService: () {},
          onRebook: () {
            Get.toNamed(AppRoutes.createRequestScreen);
          },
        );
      },
    );
  }

  Widget _buildCancelledList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ).copyWith(bottom: 100.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return CancelledBookingCard(
          title: index == 0
              ? "Gutter Cleaning"
              : index == 1
              ? "Deep Home Cleaning"
              : "Light Fixture Repair",
          date: index == 0
              ? "Oct 24, 2023 • 2:00 PM"
              : index == 1
              ? "Sep 12, 2023 • 9:00 AM"
              : "Aug 05, 2023 • 4:30 PM",
          reason: index == 0
              ? "Reason: Technician unavailable at requested time"
              : index == 1
              ? "Reason: User cancelled - change of plans"
              : "Reason: Duplicate request",
          imageUrl: index == 0
              ? null
              : index == 1
              ? "https://www.hourmaid.com/wp-content/uploads/2019/01/deep-clean.jpeg"
              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlmu7UlT-AE0BAE7UI8t_6MljfiBWD0UEX4g&s",
          onRestartRequest: () {},
        );
      },
    );
  }
}
