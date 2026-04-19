import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

import '../../../../../core/app_routes/app_routes.dart' show AppRoutes;

class LogoutSuccessScreen extends StatelessWidget {
  const LogoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 80.w,
                width: 80.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFECFDF5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: const Color(0xFF1E8267),
                  size: 40.sp,
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: "Logged Out",
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: "You have been successfully logged out of your account.",
                fontSize: 14.sp,
                color: const Color(0xFF64748B),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(),
              CustomButton(
                title: "Log In Again",
                height: 52.h,
                fillColor: const Color(0xFF1E8267),
                textColor: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                borderRadius: 26.r,
                onTap: () {
                  Get.toNamed(AppRoutes.homeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
