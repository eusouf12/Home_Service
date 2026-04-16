import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepGreen = Color(0xFF2D695A);
    const Color bgColor = Color(0xFFF3F6F8);
    
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomRoyelAppbar(leftIcon: true,titleName: "Request Details",),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEBEE),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CustomText(
                          text: "URGENT",
                          color: const Color(0xFFEF4444),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomText(
                        text: "Ref: #AN-81132",
                        color: const Color(0xFF9CA3AF),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: deepGreen.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.search, color: deepGreen, size: 20.sp),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Searching for Pros",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF111827),
                            ),
                            SizedBox(height: 2.h),
                            CustomText(
                              text: "Notifying top-rated experts nearby",
                              fontSize: 12.sp,
                              color: const Color(0xFF6B7280),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _SectionTitle(title: "WHAT IS THE PROBLEM?"),
            SizedBox(height: 8.h),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Kitchen sink leak",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF111827),
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "The kitchen sink is leaking from the pipe underneath. It seems to be dripping constantly when the water is turned on. Need help fixing it as soon as possible to avoid water damage.",
                    fontSize: 13.sp,
                    color: const Color(0xFF6B7280),
                    textAlign: TextAlign.left,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _SectionTitle(title: "PHOTOS & MEDIA"),
            SizedBox(height: 8.h),
            //photo show section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildImage("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?auto=format&fit=crop&q=80&w=300&h=300"),
                  SizedBox(width: 12.w),
                  _buildImage("https://www.thespruce.com/thmb/Pq87LkDjgfBicAbOnzE0YfTwkyU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-replace-ceiling-light-fixture-1824657-04-971e8a9b3723488ba4e435e269a8e726.jpg"),
                  SizedBox(width: 12.w),
                  _buildImage("https://images.unsplash.com/photo-1542013936693-884638332954?auto=format&fit=crop&q=80&w=300&h=300"),
                  SizedBox(width: 12.w),
                  _buildImage("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?auto=format&fit=crop&q=80&w=300&h=300"),
                  SizedBox(width: 12.w),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _SectionTitle(title: "SERVICE LOCATION"),
            SizedBox(height: 8.h),
            _buildCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    child: Image.network(
                      "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, color: deepGreen, size: 20.sp),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "123 Maplewood Ave",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF111827),
                            ),
                            SizedBox(height: 2.h),
                            CustomText(
                              text: "Springfield, IL 62704",
                              fontSize: 12.sp,
                              color: const Color(0xFF6B7280),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _SectionTitle(title: "PREFERRED SCHEDULE"),
            SizedBox(height: 8.h),
            _buildCard(
              child: Row(
                children: [
                  Container(
                    height: 50.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: deepGreen,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "OCT", fontSize: 10.sp, color: Colors.white70, fontWeight: FontWeight.w600),
                        CustomText(text: "12", fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Monday, October 12",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                      SizedBox(height: 2.h),
                      CustomText(
                        text: "Afternoon Window (PM)",
                        fontSize: 12.sp,
                        color: deepGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _SectionTitle(title: "BUDGET"),
            SizedBox(height: 8.h),
            _buildCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Estimated Budget",
                        fontSize: 12.sp,
                        color: const Color(0xFF6B7280),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: "\$150.00",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111827),
                          ),
                          CustomText(
                            text: " /Fixed",
                            fontSize: 12.sp,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.monetization_on_outlined, color: const Color(0xFF9CA3AF), size: 20.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            
            CustomButton(
              height: 48.h,
              title: "Edit Request",
              fillColor: deepGreen,
              textColor: Colors.white,
              borderRadius: 24.r,
              fontWeight: FontWeight.bold,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CustomText(
                  text: "Cancel Request",
                  color: const Color(0xFFEF4444),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child, EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.network(
        url,
        height: 80.h,
        width: 100.w, // Fixed width for horizontal scrolling list
        fit: BoxFit.cover,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF6B7280),
    );
  }
}
