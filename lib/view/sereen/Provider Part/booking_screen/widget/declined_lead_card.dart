import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

import '../../../../../core/app_routes/app_routes.dart';

class DeclinedLeadCard extends StatelessWidget {
  final Map<String, dynamic> lead;
  const DeclinedLeadCard({required this.lead, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 56.w,
                width: 56.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Icons.cleaning_services,
                  color: const Color(0xFF1E1E4B),
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: lead['type'],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1E293B),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14.sp,
                          color: const Color(0xFF94A3B8),
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: lead['location'],
                          fontSize: 12.sp,
                          color: const Color(0xFF94A3B8),
                        ),
                      ],
                    ),
                    CustomText(
                      text: "Declined: ${lead['date']}",
                      fontSize: 12.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CustomText(
                  text: "DECLINED",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.red[800]!,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const Divider(color: Color(0xFFF1F5F9)),
          SizedBox(height: 12.h),
          CustomText(
            text: "Reason: ${lead['reason']}",
            fontSize: 12.sp,
            color: const Color(0xFF64748B),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.providerLeadDetailsScreen),
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F4F4),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: "View Details",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E1E4B),
                    ),
                  ),
                ),
              ),
              if (lead['type'].contains("Manhattan")) ...[
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: "Archive",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E1E4B),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
