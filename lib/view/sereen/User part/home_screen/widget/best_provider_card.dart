import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_text/custom_text.dart';

class BestProviderCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final int jobsCompleted;
  final double rating;
  final int reviews;
  final String distance;
  final String responseTime;
  final bool isVerified;
  final VoidCallback? onCall;
  final VoidCallback? onMessage;
  final VoidCallback? onRequest;
  final VoidCallback? onTabViewProvider;
  final VoidCallback? onTabAddFavourite;

  const BestProviderCard({
    super.key,
    required this.name,
    required this.jobsCompleted,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.responseTime,
    this.isVerified = true,
    this.onCall,
    this.onMessage,
    this.onRequest,
    this.imageUrl,
    this.onTabViewProvider,
    this.onTabAddFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      margin: EdgeInsets.only(right: 16.w),
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
          /// Top
          Row(
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

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Verified + Fav
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isVerified)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.primary,
                                  size: 12.sp,
                                ),
                                SizedBox(width: 2.w),
                                CustomText(
                                  text: "Verified",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        GestureDetector(onTap: onTabAddFavourite,child: Icon(Icons.favorite_border, color: AppColors.primary)),
                      ],
                    ),

                    SizedBox(height: 4.h),

                    CustomText(
                      text: name,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),

                    SizedBox(height: 2.h),

                    CustomText(
                      text: "$jobsCompleted jobs completed",
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// Rating + Distance + View
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 14.sp),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: "$rating ($reviews)",
                    fontSize: 11.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10.w),
                  Icon(Icons.access_time, color: Colors.grey, size: 14.sp),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: distance,
                    fontSize: 11.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
              CustomText(
                text: "View Service Plans >",
                fontSize: 11.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ],
          ),

          SizedBox(height: 6.h),

          CustomText(
            text: "Responds in $responseTime",
            fontSize: 10.sp,
            color: AppColors.primary,
          ),

          SizedBox(height: 16.h),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 38.h,
                  title: "Call",
                  fillColor: AppColors.primary,
                  textColor: Colors.white,
                  borderRadius: 12.r,
                  fontSize: 12.sp,
                  icon: Icon(Icons.call, color: Colors.white, size: 16.sp),
                  onTap: onCall,
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: CustomButton(
                  height: 38.h,
                  title: "Message",
                  fillColor: AppColors.primary,
                  textColor: Colors.white,
                  borderRadius: 12.r,
                  fontSize: 12.sp,
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  onTap: onMessage,
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: CustomButton(
                  height: 38.h,
                  title: "Request",
                  fillColor: AppColors.brownColor,
                  textColor: Colors.white,
                  borderRadius: 12.r,
                  fontSize: 11.sp,
                  icon: Icon(
                    Icons.request_quote_outlined,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  onTap: onRequest,
                ),
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
