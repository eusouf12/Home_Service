import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_nav_bar/navbar.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_show_popup/custom_show_popup.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        bottomNavigationBar: const CustomNavBar(currentIndex: 4),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  // App Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "My Account",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1E293B),
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, right: 6.w),
                                child: Icon(
                                  Icons.notifications_none,
                                  size: 28.sp,
                                  color: const Color(0xFF475569),
                                ),
                              ),
                              Positioned(
                                top: 2.h,
                                right: 2.w,
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          Icon(
                            Icons.settings_outlined,
                            size: 28.sp,
                            color: const Color(0xFF475569),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Profile Info
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 100.w,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4.w,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: CustomNetworkImage(
                                      imageUrl:
                                          "https://img.freepik.com/free-photo/handsome-young-man-with-new-stylish-haircut_176420-31559.jpg",
                                      boxShape: BoxShape.circle,
                                      height: 100.w,
                                      width: 100.w,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2.w),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              CustomText(
                                text: "Alex Johnson",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "+1 (202) 555-0198",
                                fontSize: 13.sp,
                                color: const Color(0xFF64748B),
                              ),
                              CustomText(
                                text: "alex.johnson@email.com",
                                fontSize: 13.sp,
                                color: const Color(0xFF64748B),
                              ),
                              SizedBox(height: 16.h),
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppRoutes.editProfileScreen),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: const Color(0xFFE2E8F0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.02),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        size: 16.sp,
                                        color: const Color(0xFF334155),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomText(
                                        text: "Edit Profile",
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF334155),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // My Bookings
                  _buildSectionHeader(
                    "My Bookings",
                    onViewAll: () {
                      Get.toNamed(AppRoutes.bookingScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(
                        Icons.calendar_month,
                        "Upcoming",
                        "3",
                        const Color(0xFFEFF6FF),
                        Colors.blue,
                      ),
                      _buildStatCard(
                        Icons.history,
                        "Past",
                        "12",
                        const Color(0xFFF1F5F9),
                        const Color(0xFF64748B),
                      ),
                      _buildStatCard(
                        Icons.cancel_outlined,
                        "Cancelled",
                        "1",
                        const Color(0xFFFEF2F2),
                        Colors.red,
                      ),
                      _buildStatCard(
                        Icons.person_outline,
                        "Queue",
                        "2",
                        const Color(0xFFEEF2FF),
                        Colors.indigo,
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Referral Banner
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E8267),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1E8267).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.inventory_2_outlined,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "REFERRAL REWARDS",
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "Earn up to\n\$20",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomText(
                            text: "Invite\nFriends",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E8267),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Saved Providers
                  _buildSectionHeader(
                    "Saved Providers",
                    onViewAll: () {
                      Get.toNamed(AppRoutes.savedProviderScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSavedProviderCard(
                          "Bravo Barber",
                          "https://img.freepik.com/free-photo/handsome-man-barbershop-shaving-beard_1303-26242.jpg",
                        ),
                        SizedBox(width: 16.w),
                        _buildSavedProviderCard(
                          "Pro Plumbing",
                          "https://www.steadyfloplumbing.com/wp-content/uploads/2023/10/plumbing-services-1920w.jpg",
                        ),
                        SizedBox(width: 16.w),
                        _buildSavedProviderCard(
                          "Elite Movers",
                          "https://img.freepik.com/free-photo/sports-car-driving-asphalt-road-night-generative-ai_188544-8052.jpg",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Payment Methods
                  _buildSectionHeader(
                    "Payment Methods",
                    actionText: "Add New",
                    onViewAll: () {},
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: CustomText(
                                  text: "VISA",
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "**** 3456",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1E293B),
                                  ),
                                  CustomText(
                                    text: "Primary",
                                    fontSize: 10.sp,
                                    color: const Color(0xFF10B981),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFECFDF5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.money,
                                  color: const Color(0xFF10B981),
                                  size: 16.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: "Cash",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                              ),
                              SizedBox(width: 16.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Payment History
                  _buildSectionHeader(
                    "Payment History",
                    onViewAll: () {
                      Get.toNamed(AppRoutes.paymentHistoryScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Plumbing Service",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E293B),
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "Completed • 10 Apr 2025",
                                fontSize: 11.sp,
                                color: const Color(0xFF94A3B8),
                              ),
                            ],
                          ),
                        ),
                        CustomText(
                          text: "\$120.00",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF10B981),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Saved Addresses
                  _buildSectionHeader(
                    "Saved Addresses",
                    actionText: "Add New",
                    onViewAll: () {
                      Get.toNamed(AppRoutes.savedAddressScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFECFDF5),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.home,
                                  color: const Color(0xFF10B981),
                                  size: 16.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Home",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1E293B),
                                  ),
                                  SizedBox(height: 2.h),
                                  CustomText(
                                    text: "123 Main St,\nAlexandria",
                                    fontSize: 10.sp,
                                    color: const Color(0xFF94A3B8),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF7ED),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.business,
                                  color: Color(0xFFF97316),
                                  size: 16.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Office",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1E293B),
                                  ),
                                  SizedBox(height: 2.h),
                                  CustomText(
                                    text: "456 Market",
                                    fontSize: 10.sp,
                                    color: const Color(0xFF94A3B8),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Become a Provider
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.becomeProviderScreen);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.storefront_outlined,
                            color: Colors.indigo,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: "Become a Provider",
                            color: Colors.indigo,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // List Tiles
                  _buildListTile(
                    Icons.notifications_none,
                    "Notifications",
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                  ),
                  _buildListTile(
                    Icons.lock_outline,
                    "Privacy & Security",
                    onTap: () {
                      Get.toNamed(AppRoutes.privacySecurityScreen);
                    },
                  ),
                  _buildListTile(
                    Icons.help_outline,
                    "Help & Support",
                    onTap: () {
                      Get.toNamed(AppRoutes.helpSupportScreen);
                    },
                  ),

                  SizedBox(height: 30.h),

                  // Logout
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: AppColors.white,
                          insetPadding: EdgeInsets.all(8),
                          contentPadding: EdgeInsets.all(8),
                          content: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: CustomShowDialog(
                              textColor: AppColors.black,
                              title: "Logout Your Account",
                              discription: "Are You Sure Logout",
                              showColumnButton: true,
                              showCloseButton: true,
                              rightOnTap: () {
                                Navigator.of(ctx).pop();
                              },
                              leftOnTap: () async {
                                // SocketApi.dispose();
                                //await SharePrefsHelper.logout();
                                // messageController.currentUserId = " ";
                                Get.offAllNamed(AppRoutes.logoutSuccessScreen);
                              },
                            ),
                          ),
                        ),
                      );
                    },

                    child: Center(
                      child: CustomText(
                        text: "Logout",
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: CustomText(
                      text: "Version 2.4.0 (Build\n108)",
                      color: const Color(0xFF94A3B8),
                      fontSize: 10.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    String title, {
    String actionText = "View All",
    VoidCallback? onViewAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1E293B),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: CustomText(
            text: actionText,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E8267),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String title,
    String count,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      width: 75.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 16.sp),
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: title,
            fontSize: 10.sp,
            color: const Color(0xFF64748B),
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: count,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E293B),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedProviderCard(String title, String imageUrl) {
    return Container(
      width: 140.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  height: 80.h,
                  width: double.infinity,
                  boxShape: BoxShape.rectangle,
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 14.sp),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: CustomText(
              text: title,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF475569), size: 18.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomText(
                text: title,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
                textAlign: TextAlign.start,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF94A3B8),
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
