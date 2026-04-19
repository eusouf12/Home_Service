import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/utils/ToastMsg/toast_message.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class OverviewRatingScreen extends StatelessWidget {
  const OverviewRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: CustomRoyelAppbar(titleName: "", leftIcon: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // Profile Info
            Center(
              child: Column(
                children: [
                  CustomNetworkImage(
                    imageUrl: AppConstants.girlsPhoto, // using sample
                    height: 80.w,
                    width: 80.w,
                    boxShape: BoxShape.circle,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Michael Chen",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1E293B),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.verified, color: Colors.blue, size: 20.sp),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: const Color(0xFFFF6D4D),
                        size: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "Professional Plumbing & Heating",
                    fontSize: 13.sp,
                    color: const Color(0xFF64748B),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // Share Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomText(
                    text: "Share your great \nexperience\n& earn credits!",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                  SizedBox(height: 24.h),

                  // Icons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSquareIcon(
                        AppConstants.girlsPhoto,
                        const Color(0xFFF1F5F9),
                        isImage: true,
                      ),
                      SizedBox(width: 12.w),
                      _buildSquareIcon(
                        Icons.phone_iphone,
                        const Color(0xFFFCE7F3),
                        iconColor: const Color(0xFFDB2777),
                      ),
                      SizedBox(width: 12.w),
                      _buildSquareIcon(
                        Icons.flutter_dash,
                        const Color(0xFFDBEAFE),
                        iconColor: const Color(0xFF3B82F6),
                      ), // Using dash as placeholder for twitter
                    ],
                  ),

                  SizedBox(height: 30.h),

                  // Copy Link Button
                  CustomButton(
                    onTap: () {
                      showCustomSnackBar("Link Copied!", isError: false);
                    },
                    title: "Copy Referral Link",
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(Icons.link, color: Colors.white, size: 20.sp),
                    ),
                    fillColor: const Color(0xFF1B4332), // Dark green color
                    textColor: Colors.white,
                    height: 50.h,
                    borderRadius: 24.r,
                  ),

                  SizedBox(height: 24.h),

                  // Social Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleIcon(
                        Icons.arrow_forward_ios,
                        Colors.white,
                        iconColor: const Color(0xFF64748B),
                        isBorder: true,
                      ),
                      _buildCircleIcon(Icons.facebook, const Color(0xFF1877F2)),
                      _buildCircleIcon(
                        Icons.wechat,
                        const Color(0xFF25D366),
                      ), // using wechat as placeholder for whatsapp
                      _buildCircleIcon(Icons.message, const Color(0xFF0078FF)),
                      _buildCircleIcon(
                        Icons.close,
                        Colors.black,
                      ), // Using close as placeholder for X
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),

      // Bottom custom nav structure
      bottomNavigationBar: Container(
        color: const Color(0xFFF3F4F6),
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 30.h,
          top: 10.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavUser(
              Icons.home,
              "HOME",
              () => Get.offAllNamed(AppRoutes.homeScreen),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(
                  onTap: () {},
                  title: "Share & Earn",
                  fillColor: const Color(0xFF1B4332),
                  textColor: Colors.white,
                  height: 50.h,
                  borderRadius: 24.r,
                ),
              ),
            ),
            _buildBottomNavUser(Icons.person, "ACCOUNT", () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareIcon(
    dynamic iconOrImage,
    Color bgColor, {
    Color? iconColor,
    bool isImage = false,
  }) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: isImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                iconOrImage,
                height: 32.w,
                width: 32.w,
                fit: BoxFit.cover,
              ),
            )
          : Icon(iconOrImage, color: iconColor, size: 20.sp),
    );
  }

  Widget _buildCircleIcon(
    IconData icon,
    Color bgColor, {
    Color? iconColor,
    bool isBorder = false,
  }) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: isBorder ? Border.all(color: const Color(0xFFE2E8F0)) : null,
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: iconColor ?? Colors.white, size: 20.sp),
    );
  }

  Widget _buildBottomNavUser(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.w,
        width: 60.w,
        decoration: const BoxDecoration(
          color: Color(0xFF1E293B),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20.sp),
            SizedBox(height: 2.h),
            CustomText(
              text: label,
              fontSize: 8.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
