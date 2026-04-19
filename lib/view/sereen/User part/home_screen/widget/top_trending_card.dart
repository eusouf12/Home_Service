import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../components/custom_text/custom_text.dart';

class TopTrendingCard extends StatelessWidget {

  final String? imageUrl;
  final VoidCallback? onTabViewProvider;
  final VoidCallback? onRequestTap;
  final bool isFastResponse;
  final bool isAvailableNow;
  final bool isVerified;
  final String name;
  final String distance;
  final String travelDistance;
  final String jobsCompleted;
  final String rating;
  final String reviews;

  const TopTrendingCard({
    Key? key,
    this.imageUrl,
    this.onTabViewProvider,
    this.onRequestTap,
    this.isFastResponse = false,
    this.isAvailableNow = false,
    this.isVerified = false,
    required this.name,
    required this.distance,
    required this.travelDistance,
    required this.jobsCompleted,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color goldColor = const Color(0xFFB18042);
    Color tealColor = AppColors.primary; 

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section: Icon, Texts, Verified Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               GestureDetector(
                onTap: onTabViewProvider,
                child: CustomNetworkImage(
                  imageUrl: imageUrl ?? AppConstants.girlsPhoto,
                  height: 50.h,
                  width: 50.w,
                  boxShape: BoxShape.circle,
                ),
              ),
             SizedBox(width: 12.w),
              
              // Name and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E293B),
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: isFastResponse
                          ? "Fast response l $distance"
                          : "$jobsCompleted jobs completed ",
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ),
              
              // Verified Badge
              if (isVerified)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9), // Light green
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xFFC8E6C9)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: const Color(0xFF2E7D32), size: 12.sp),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Verified",
                        color: const Color(0xFF2E7D32),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Bottom Section
          isAvailableNow
              ? // View 2: Rating and Time vertically separated, large button on right
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18.sp),
                            SizedBox(width: 6.w),
                            CustomText(
                              text: "$rating ($reviews) Rating",
                              fontSize: 13.sp,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.access_time_filled, color: tealColor, size: 18.sp),
                            SizedBox(width: 6.w),
                            CustomText(
                              text: "Available now",
                              fontSize: 13.sp,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onRequestTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: goldColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.flash_on, color: Colors.white, size: 18.sp),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "Instant Request",
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : // View 1: Rating, distance, button aligned centrally in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18.sp),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: "$rating ($reviews)",
                          fontSize: 13.sp,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey.shade400, size: 18.sp),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: travelDistance,
                          fontSize: 13.sp,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onRequestTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: tealColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.phone_in_talk, color: Colors.white, size: 16.sp),
                            SizedBox(width: 6.w),
                            CustomText(
                              text: "Request",
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
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
