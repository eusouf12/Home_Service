import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/utils/app_images/app_images.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        color1: const Color(0xFFF3F7F8),
        color2: const Color(0xFFF9FAFB),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              
              ///==================== Logo ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 32.w,
                    width: 32.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E1E4B),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(6.w),
                    child: Image.asset(AppImages.providerLogoIcon, color: Colors.white),
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: "Allneeda",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ],
              ),
              
              SizedBox(height: 40.h),
              
              ///==================== Provider Image Card ====================
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 320.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      border: Border.all(color: Colors.white, width: 4.w),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.providerWelcome),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                  
                  ///==================== Status Badge ====================
                  Positioned(
                    bottom: -20.h,
                    right: -10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.w),
                            decoration: const BoxDecoration(
                              color: Color(0xFFECFDF5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.verified_outlined, color: const Color(0xFF059669), size: 18.sp),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: "STATUS",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF94A3B8),
                              ),
                              CustomText(
                                text: "Ready to Grow",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              ///==================== Welcome Text ====================
              CustomText(
                text: "Welcome as\nProvider",
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: "Grow your business and reach more customers in your area with ease.",
                fontSize: 14.sp,
                color: const Color(0xFF64748B),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              ///==================== Action Button ====================
              CustomButton(
                title: "Continue to Setup",
                height: 56.h,
                fillColor: const Color(0xFF1E1E4B),
                textColor: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                borderRadius: 28.r,
                isImageRight: true,
                icon: Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
                onTap: () {
                  Get.toNamed(AppRoutes.providerOnboardingScreen);
                },
              ),
              
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
