import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';

class ProviderLeadSuccessScreen extends StatelessWidget {
  const ProviderLeadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF1E293B)),
            onPressed: () => Get.back(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              
              ///==================== Success Icon ====================
              Container(
                height: 120.w,
                width: 120.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(15.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E4B),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 60.sp),
                ),
              ),
              
              SizedBox(height: 40.h),
              
              ///==================== Success Texts ====================
              CustomText(
                text: "Lead Accepted!",
                fontSize: 28.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1E293B),
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: "You've successfully claimed this lead. The customer is waiting for your response.",
                fontSize: 14.sp,
                color: const Color(0xFF64748B),
                maxLines: 2,
              ),
              
              SizedBox(height: 48.h),
              
              ///==================== Next Steps ====================
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "NEXT STEPS",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF1E1E4B),
                ),
              ),
              SizedBox(height: 16.h),
              
              _buildStepCard(
                icon: Icons.chat_bubble_outline,
                title: "Message Customer",
                subtitle: "Introduce yourself and start the chat",
                onTap: () => Get.toNamed(AppRoutes.messagesScreen),
              ),
              SizedBox(height: 16.h),
              _buildStepCard(
                icon: Icons.assignment_outlined,
                title: "View Job Details",
                subtitle: "Review requirements and location",
                onTap: () => Get.toNamed(AppRoutes.jobDetailsScreen),
              ),
              
              const Spacer(),
              
              ///==================== Action Buttons ====================
              Container(
                height: 56.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E4B),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: InkWell(
                  onTap: () => _showCompletionDialog(context),
                  borderRadius: BorderRadius.circular(30.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Mark as Completed", fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                      SizedBox(width: 8.w),
                      Icon(Icons.check_circle_outline, color: Colors.white, size: 20.sp),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 56.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: InkWell(
                  onTap: () => Get.offAllNamed(AppRoutes.providerHomeScreen),
                  borderRadius: BorderRadius.circular(30.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Go to Dashboard", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF475569)),
                      SizedBox(width: 8.w),
                      Icon(Icons.grid_view_outlined, color: const Color(0xFF475569), size: 18.sp),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFF1E1E4B), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title, fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                  CustomText(text: subtitle, fontSize: 12.sp, color: const Color(0xFF94A3B8)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: const Color(0xFFCBD5E1), size: 24.sp),
          ],
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: const Color(0xFF1E1E4B), size: 32.sp),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: "Mark as Completed?",
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1E293B),
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: "Are you sure this service is finished? This will notify the customer and move the request to your completed history.",
                fontSize: 13.sp,
                color: const Color(0xFF64748B),
                maxLines: 4,
              ),
              SizedBox(height: 32.h),
              Container(
                height: 52.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E4B),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: InkWell(
                  onTap: () {
                    Get.back(); // close dialog
                    Get.back(); // go back to bookings
                  },
                  borderRadius: BorderRadius.circular(16.r),
                  child: Center(
                    child: CustomText(text: "Yes, Complete", fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(text: "Not Yet", fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
