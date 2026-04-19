import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/utils/app_colors/app_colors.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String requestId;
  final String date;
  final String topStatus; 
  final int activeStep;  
  final String? imageUrl;
  final VoidCallback? onMessage;
  final VoidCallback? onViewDetails;

  const BookingCard({
    super.key,
    required this.title,
    required this.requestId,
    required this.date,
    required this.topStatus,
    required this.activeStep,
    this.imageUrl,
    this.onMessage,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    // Generate right colors based on topStatus
    Color tagBgColor = const Color(0xFFE5EFEA); 
    Color tagTextColor = AppColors.primary;

    if (topStatus.toUpperCase() == "DRAFT" || topStatus.toUpperCase() == "CANCELLED") {
      tagBgColor = Colors.grey.shade200;
      tagTextColor = Colors.grey.shade700;
    } else if (topStatus.toUpperCase() == "MATCHING") {
      tagBgColor = const Color(0xFFFFF3E0); // light orange
      tagTextColor = Colors.orange;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
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
          // Top Row (Image, Details, Tag)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: imageUrl ?? AppConstants.resturentImage,
                height: 64.h,
                width: 64.w,
                boxShape: BoxShape.circle,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: title,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF101828),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: tagBgColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: CustomText(
                            text: topStatus.toUpperCase(),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tagTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    CustomText(
                      text: "Request ID: $requestId • $date",
                      fontSize: 12.sp,
                      color: const Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Progress Bar
          _buildProgressBar(),

          SizedBox(height: 24.h),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onMessage,
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC), 
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 18.sp),
                        SizedBox(width: 8.w),
                        CustomText(
                          text: "Message",
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomButton(
                  height: 48.h,
                  title: "View Details",
                  fillColor: const Color(0xFFFF6D4D),
                  textColor: Colors.white,
                  borderRadius: 25.r,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  onTap: onViewDetails,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final List<String> steps = ["SENT", "ACCEPT", "RESPONSE", "COMPLETE"];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background line
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 7.h, 
            child: Row(
              children: List.generate(3, (index) {
                bool isLineActive = index < activeStep;
                return Expanded(
                  child: Container(
                    height: 2.h,
                    color: isLineActive ? AppColors.primary : const Color(0xFFE9ECEF),
                  ),
                );
              }),
            ),
          ),
          
          // Steps
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              bool isPast = index < activeStep;
              bool isActive = index == activeStep;
              
              return SizedBox(
                width: 60.w,
                child: Column(
                  children: [
                    if (isActive)
                      Container(
                        height: 16.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withValues(alpha: 0.2), // Glowing ring
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: 8.h,
                          width: 8.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    else if (isPast)
                      Container(
                        height: 16.h,
                        width: 16.w,
                        alignment: Alignment.center,
                        child: Container(
                          height: 6.h,
                          width: 6.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    else
                       Container(
                        height: 16.h,
                        width: 16.w,
                        alignment: Alignment.center,
                        child: Container(
                          height: 4.h,
                          width: 4.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD1D5DB), // Grey
                          ),
                        ),
                      ),
                    SizedBox(height: 6.h),
                    CustomText(
                      text: steps[index],
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                      color: (isActive || isPast) ? AppColors.primary : const Color(0xFF101828),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
