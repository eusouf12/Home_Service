import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class CreateBookingCompletedScreen extends StatelessWidget {
  const CreateBookingCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Icon Circle
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120.w,
                    width: 120.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F0EE),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 60.w,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2D695A),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.w,
                    right: -10.w,
                    child: Container(
                      height: 16.w,
                      width: 16.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD3E3DF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -5.w,
                    child: Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFB8D3CC),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              // Title
              CustomText(
                text: "Your service has been\ncompleted",
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF101828),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),

              // Subtitle
              CustomText(
                text: "Please complete your payment\ndirectly with the service provider.",
                fontSize: 14.sp,
                color: const Color(0xFF6B7280),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(),

              // Buttons
              CustomButton(
                height: 56.h,
                title: "Go to Dashboard",
                fillColor: const Color(0xFF2D695A),
                textColor: Colors.white,
                borderRadius: 25.r,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                onTap: () {
                  Get.offAllNamed(AppRoutes.bookingScreen);
                },
              ),
              SizedBox(height: 32.h),

              // Service Provider Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48.w,
                    width: 48.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://i.pravatar.cc/150?img=11"), // placeholder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "SERVICE PROVIDER",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF9CA3AF),
                      ),
                      CustomText(
                        text: "Alex's Home Repair",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
