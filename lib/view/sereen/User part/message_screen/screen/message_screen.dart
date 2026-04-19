import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/utils/app_colors/app_colors.dart';
import 'package:home_service/utils/app_const/app_const.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';
import 'package:home_service/view/components/custom_nav_bar/navbar.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final List<Map<String, dynamic>> messages = [
    {
      "name": "Isabella Montgomery",
      "image": AppConstants.girlsPhoto,
      "time": "Yesterday,\n5:37 PM",
      "message": "The portfolio rebalancing is complete as discussed earlier.",
      "isVerified": true,
      "unread": true,
    },
    {
      "name": "Jonathan Vance",
      "image":
          "https://img.freepik.com/free-photo/portrait-handsome-young-man-studio_23-2148858348.jpg",
      "time": "Mon, Apr 22",
      "message": "The quarterly luxury market Report looks great,",
      "isVerified": true,
      "unread": false,
      "attachment": true,
    },
    {
      "name": "Elena Rossi",
      "image":
          "https://img.freepik.com/free-photo/headshot-portrait-happy-mixed-race-african-girl-wearing-glasses_114579-79848.jpg",
      "time": "Mon, Apr 22",
      "message": "I've attached th...",
      "isVerified": true,
      "unread": false,
      "showArchive": true,
    },
    {
      "name": "Elena Rossi",
      "image":
          "https://img.freepik.com/free-photo/headshot-portrait-happy-mixed-race-african-girl-wearing-glasses_114579-79848.jpg",
      "time": "Mon, Apr 22",
      "message": "MON, 'AR\n25, 7.1D1...",
      "isVerified": true,
      "unread": false,
      "showArchive": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        bottomNavigationBar: const CustomNavBar(currentIndex: 2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: const SizedBox.shrink(),
          title: CustomText(
            text: "MESSAGES",
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E293B),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit_square,
                color: const Color(0xFF1E293B),
                size: 18.sp,
              ),
            ),
            SizedBox(width: 8.w),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.h, right: 10.w),
                  child: Icon(
                    Icons.notifications_none,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),
                Positioned(
                  top: 0.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: CustomText(
                      text: '2',
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
      
                // Search Bar
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomTextField(
                    hintText: "Search specialists or conversations...",
                    fillColor: Colors.white,
                    fieldBorderColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                    hintStyle: TextStyle(
                      color: const Color(0xFF94A3B8),
                      fontSize: 13.sp,
                    ),
                    fieldBorderRadius: 25.r,
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: const Color(0xFF94A3B8),
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
      
                // AI Concierge Card
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF161616),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Icon
                      Stack(
                        children: [
                          Container(
                            height: 52.w,
                            width: 52.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD4AF37), // Gold
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.black,
                              size: 28.sp,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 14.w,
                              width: 14.w,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF161616),
                                  width: 2.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: "AI\nConcierge",
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 2,
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: const Color(0xFFD4AF37),
                                    ),
                                  ),
                                  child: CustomText(
                                    text: "PRIORITY",
                                    color: const Color(0xFFD4AF37),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                CustomText(
                                  text: "ACTIVE",
                                  color: const Color(0xFFD4AF37),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.chevron_right,
                                  color: const Color(0xFF94A3B8),
                                  size: 18.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              text: '"How can I assist your luxury...',
                              color: const Color(0xFF94A3B8),
                              fontSize: 11.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                SizedBox(height: 24.h),
      
                // Messages List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    bool isUnread = msg['unread'] ?? false;
      
                    return GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.inboxScreen),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile Image Column
                          CustomNetworkImage(
                            imageUrl: msg['image'],
                            height: 52.w,
                            width: 52.w,
                            boxShape: BoxShape.circle,
                          ),
                          SizedBox(width: 12.w),
      
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text: msg['name'],
                                        color: const Color(0xFF1E293B),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    CustomText(
                                      text: msg['time'],
                                      color: const Color(0xFF94A3B8),
                                      fontSize: 10.sp,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                if (msg['isVerified'] == true)
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: const Color(0xFF10B981),
                                        size: 12.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      CustomText(
                                        text: "Verified",
                                        color: const Color(0xFF10B981),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                SizedBox(height: 6.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text: msg['message'],
                                        color: isUnread
                                            ? const Color(0xFF1E293B)
                                            : const Color(0xFF64748B),
                                        fontSize: 12.sp,
                                        fontWeight: isUnread
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
                  },
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
