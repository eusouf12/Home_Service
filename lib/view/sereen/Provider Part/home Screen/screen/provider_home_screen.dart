import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/utils/app_images/app_images.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../controller/provider_home_controller.dart';
import '../widget/provider_navbar.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderHomeController());

    return Scaffold(
      body: CustomGradient(
        color1: const Color(0xFFF3F7F8),
        color2: const Color(0xFFF9FAFB),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),

                    ///==================== Header ====================
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24.r,
                          backgroundImage: const AssetImage(
                            AppImages.providerAvatar,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "WELCOME BACK",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF94A3B8),
                              ),
                              CustomText(
                                text: "Allneeda Provider",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            color: const Color(0xFF475569),
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    ///==================== Stats Grid ====================
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 1.4,
                      children: [
                        _buildStatCard(
                          "Offers Received",
                          "128",
                          "+12%",
                          Icons.assignment_outlined,
                          const Color(0xFFECFDF5),
                          const Color(0xFF059669),
                        ),
                        _buildStatCard(
                          "Accepted",
                          "94%",
                          "+3%",
                          Icons.check_circle_outline,
                          const Color(0xFFECFDF5),
                          const Color(0xFF059669),
                        ),
                        _buildStatCard(
                          "Response Speed",
                          "4.2m",
                          "Fast",
                          Icons.bolt,
                          const Color(0xFFEFF6FF),
                          const Color(0xFF2563EB),
                        ),
                        _buildStatCard(
                          "Wallet Balance",
                          "\$1,240",
                          "Stable",
                          Icons.account_balance_wallet_outlined,
                          const Color(0xFFF8FAFC),
                          const Color(0xFF64748B),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    ///==================== AI Insights Card ====================
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
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
                              Icon(
                                Icons.auto_awesome,
                                color: const Color(0xFF1E1E4B),
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              CustomText(
                                text: "AI Insights",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E1E4B),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text:
                                "You're in the top 5% of providers this week! Your response time is excellent.",
                            fontSize: 13.sp,
                            color: const Color(0xFF475569),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: const Color(0xFF1E1E4B),
                                  size: 18.sp,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "PRO TIP",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1E1E4B),
                                      ),
                                      SizedBox(height: 4.h),
                                      CustomText(
                                        text:
                                            "Adding more portfolio photos can increase leads by up to 20%.",
                                        fontSize: 12.sp,
                                        color: const Color(0xFF64748B),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    ///==================== Quick Actions ====================
                    CustomText(
                      text: "QUICK ACTIONS",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF94A3B8),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildActionButton(
                          "View Leads",
                          Icons.search,
                          Colors.white,
                          const Color(0xFF1E293B),
                        ),
                        _buildActionButton(
                          "Inbox",
                          Icons.mail_outline,
                          Colors.white,
                          const Color(0xFF1E293B),
                        ),
                        _buildActionButton(
                          "Boost",
                          Icons.rocket_launch,
                          const Color(0xFF1E1E4B),
                          Colors.white,
                          isDark: true,
                        ),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    ///==================== Recent Activity ====================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "RECENT ACTIVITY",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF94A3B8),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: CustomText(
                            text: "See All",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E1E4B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => Column(
                        children: controller.activities
                            .map((activity) => _buildActivityItem(activity))
                            .toList(),
                      ),
                    ),

                    SizedBox(height: 100.h), // Space for navbar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: const ProviderNavBar(currentIndex: 0),
      ),
      extendBody: true,
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String trend,
    IconData icon,
    Color trendBg,
    Color trendColor,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: const Color(0xFF1E1E4B), size: 20.sp),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: trendBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: CustomText(
                  text: trend,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: trendColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 10.sp,
                color: const Color(0xFF64748B),
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: value,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color bg,
    Color contentColor, {
    bool isDark = false,
  }) {
    return Column(
      children: [
        Container(
          height: 80.w,
          width: 80.w,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? bg.withOpacity(0.4)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
              if (!isDark)
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  offset: const Offset(-4, -4),
                ),
            ],
            border: Border.all(color: const Color(0xFFE2E8F0), width: 0.5),
          ),
          child: Icon(icon, color: contentColor, size: 28.sp),
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: label,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1E293B),
        ),
      ],
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    IconData icon;
    Color iconColor;
    Color iconBg;

    switch (activity["type"]) {
      case "lead":
        icon = Icons.person_add_outlined;
        iconColor = const Color(0xFF2563EB);
        iconBg = const Color(0xFFEFF6FF);
        break;
      case "payment":
        icon = Icons.account_balance_wallet_outlined;
        iconColor = const Color(0xFF059669);
        iconBg = const Color(0xFFECFDF5);
        break;
      default:
        icon = Icons.star_outline_rounded;
        iconColor = const Color(0xFFF59E0B);
        iconBg = const Color(0xFFFFFBEB);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 25,
            spreadRadius: 0,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: activity["title"],
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text:
                      "${activity['time']} • ${activity['location'] ?? activity['details'] ?? activity['from']}",
                  fontSize: 11.sp,
                  color: const Color(0xFF64748B),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          if (activity["type"] == "lead")
            CustomText(
              text: "View",
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E1E4B),
            )
          else if (activity["type"] == "payment")
            CustomText(
              text: activity["amount"],
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            )
          else
            Icon(Icons.more_vert, color: const Color(0xFF94A3B8), size: 20.sp),
        ],
      ),
    );
  }
}
