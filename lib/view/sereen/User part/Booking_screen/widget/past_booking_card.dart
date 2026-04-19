import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/utils/app_colors/app_colors.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class PastBookingCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String status;
  final String? imageUrl;
  final VoidCallback? onRateService;
  final VoidCallback? onRebook;

  const PastBookingCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    this.imageUrl,
    this.onRateService,
    this.onRebook,
  });

  @override
  Widget build(BuildContext context) {
    Color tagBgColor = const Color(0xFFE5EFEA); 
    Color tagTextColor = AppColors.primary;

    if (status.toUpperCase() == "CANCELLED") {
      tagBgColor = Colors.grey.shade200;
      tagTextColor = Colors.grey.shade700;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large Cover Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CustomNetworkImage(
              imageUrl: imageUrl ?? AppConstants.resturentImage,
              height: 160.h, // adjusted to be slightly proportional
              width: double.infinity,
            ),
          ),
          SizedBox(height: 16.h),

          // Tag and Date Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: tagBgColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: CustomText(
                  text: status.toUpperCase(),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: tagTextColor,
                ),
              ),
              CustomText(
                text: date,
                fontSize: 12.sp,
                color: const Color(0xFF9CA3AF), // Muted grey
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Title
          CustomText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111827),
          ),
          SizedBox(height: 8.h),

          // Description
          CustomText(
            text: description,
            fontSize: 13.sp,
            color: const Color(0xFF6B7280),
            fontWeight: FontWeight.w400,
            maxLines: 2,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20.h),

          // Buttons
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 48.h,
                  title: "Rate Service",
                  fillColor: AppColors.primary,
                  textColor: Colors.white,
                  borderRadius: 16.r,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  onTap: onRateService,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GestureDetector(
                  onTap: onRebook,
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5), // Subtle border
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: "Rebook",
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
