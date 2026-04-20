import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class CompletedLeadCard extends StatelessWidget {
  final Map<String, dynamic> lead;
  const CompletedLeadCard({required this.lead, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.providerCompletedLeadDetailsScreen),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: const Color(0xffF0F4F4),
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
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
                    lead['type'] == 'Plumbing' ? Icons.plumbing : Icons.flash_on,
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
                        text: "${lead['type']} - ${lead['client']}",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1E293B),
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text: "${lead['date']} • ${lead['time']}",
                        fontSize: 12.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      text: lead['amount'],
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF1E293B),
                    ),
                    SizedBox(height: 2.h),
                    CustomText(
                      text: lead['status'],
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF059669),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F4F4),
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
                      text: "View Details",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E1E4B),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F4F4),
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
                      text: "Download Invoice",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E1E4B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
