import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import '../controller/provider_analytics_controller.dart';

class ProviderAnalyticsScreen extends StatelessWidget {
  const ProviderAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProviderAnalyticsController controller = Get.put(ProviderAnalyticsController());

    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 70.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                  ],
                ),
                child: Icon(Icons.arrow_back, color: const Color(0xFF1E293B), size: 20.sp),
              ),
            ),
          ),
          title: Row(
            children: [
              Container(
                height: 44.w,
                width: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E4B),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF1E1E4B).withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Icon(Icons.analytics_outlined, color: Colors.white, size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Provider Analytics", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                  CustomText(text: "Allneeda Pro Dashboard", fontSize: 11.sp, color: const Color(0xFF94A3B8)),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(Icons.calendar_today_outlined, color: const Color(0xFF1E1E4B), size: 20.sp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              
              ///==================== Time Switcher ====================
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Obx(
                  () => Row(
                    children: [
                      _buildTabItem("Week", index: 0, controller: controller),
                      _buildTabItem("Month", index: 1, controller: controller),
                      _buildTabItem("Year", index: 2, controller: controller),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 24.h),
              
              ///==================== Stats Grid ====================
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.6,
                children: [
                  _buildStatCard("LEADS RECEIVED", "1,284", "+12%", true),
                  _buildStatCard("LEADS ACCEPTED", "856", "+8%", true),
                  _buildStatCard("CONVERSION", "67%", "+6%", true),
                  _buildStatCard("AVG RATING", "4.9", "0.1%", false),
                ],
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Performance Chart ====================
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Weekly Performance", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                            CustomText(text: "Average 122 leads per day", fontSize: 12.sp, color: const Color(0xFF94A3B8)),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12.r)),
                          child: CustomText(text: "This Week", fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF475569)),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(80.h),
                        _buildBar(120.h),
                        _buildBar(60.h),
                        _buildBar(160.h, isHighlighted: true),
                        _buildBar(130.h, isDark: true),
                        _buildBar(90.h),
                        _buildBar(50.h),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
                          .map((d) => CustomText(text: d, fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)))
                          .toList(),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Recent Activity ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Recent Activity", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                  CustomText(text: "View All", fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E4B)),
                ],
              ),
              SizedBox(height: 16.h),
              _buildActivityRow(
                Icons.check,
                "New Lead Accepted",
                "Residential Cleaning • 2h ago",
                "\$450.00",
                "CONFIRMED",
                const Color(0xFFECFDF5),
                const Color(0xFF059669),
              ),
              SizedBox(height: 12.h),
              _buildActivityRow(
                Icons.more_horiz,
                "Lead Pending",
                "Plumbing Repair • 5h ago",
                "Review",
                "AWAITING",
                const Color(0xFFFFF7ED),
                const Color(0xFFEA580C),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, {required int index, required ProviderAnalyticsController controller}) {
    bool isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E1E4B) : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, String trend, bool isPositive) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: label, fontSize: 10.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: value, fontSize: 22.sp, fontWeight: FontWeight.w900, color: const Color(0xFF1E293B)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isPositive ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(isPositive ? Icons.trending_up : Icons.trending_down, size: 10.sp, color: isPositive ? const Color(0xFF059669) : Colors.red[600]),
                    SizedBox(width: 2.w),
                    CustomText(text: trend, fontSize: 10.sp, fontWeight: FontWeight.bold, color: isPositive ? const Color(0xFF059669) : Colors.red[600]!),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, {bool isHighlighted = false, bool isDark = false}) {
    return Container(
      height: height,
      width: 40.w,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E4B) : (isHighlighted ? const Color(0xFF94A3B8) : const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  Widget _buildActivityRow(IconData icon, String title, String subtitle, String trailTop, String trailSub, Color bg, Color content) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12.r)),
            child: Icon(icon, color: content, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: title, fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                CustomText(text: subtitle, fontSize: 12.sp, color: const Color(0xFF94A3B8)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(text: trailTop, fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
              CustomText(text: trailSub, fontSize: 10.sp, fontWeight: FontWeight.w900, color: content),
            ],
          ),
        ],
      ),
    );
  }
}
