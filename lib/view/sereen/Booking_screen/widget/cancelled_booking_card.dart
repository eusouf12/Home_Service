import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class CancelledBookingCard extends StatelessWidget {
  final String title;
  final String date;
  final String reason;
  final String? imageUrl;
  final VoidCallback? onRestartRequest;

  const CancelledBookingCard({
    super.key,
    required this.title,
    required this.date,
    required this.reason,
    this.imageUrl,
    this.onRestartRequest,
  });

  @override
  Widget build(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CustomNetworkImage(
                  imageUrl: imageUrl ?? AppConstants.resturentImage,
                  height: 64.h,
                  width: 64.w,
                ),
              ),
              SizedBox(width: 12.w),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title and cancelled status
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText(
                            text: title,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF101828),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEB), // Light red bg
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: CustomText(
                            text: "CANCELLED",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFEF4444), // Red text
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: date,
                      fontSize: 12.sp,
                      color: const Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: reason,
                      fontSize: 12.sp,
                      color: const Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Restart Request Button
          GestureDetector(
            onTap: onRestartRequest,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB), 
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh_rounded,
                    color: Color(0xFFEC5B13),
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: "Restart Request",
                    color: Color(0xFFEC5B13),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
