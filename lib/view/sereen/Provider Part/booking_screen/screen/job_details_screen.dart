import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: () => Get.back(),
          ),
          title: CustomText(
            text: "Job Details",
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Color(0xFF1E293B)),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              
              ///==================== Header Card ====================
              Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 6.w,
                                width: 6.w,
                                decoration: const BoxDecoration(color: Color(0xFF1E1E4B), shape: BoxShape.circle),
                              ),
                              SizedBox(width: 6.w),
                              CustomText(text: "ACTIVE JOB", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF475569)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: "EST. VALUE", fontSize: 9.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
                            CustomText(text: "\$450", fontSize: 24.sp, fontWeight: FontWeight.w900, color: const Color(0xFF1E293B)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: "AC Maintenance",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF1E293B),
                    ),
                    CustomText(
                      text: "Job ID: #SRV-90210",
                      fontSize: 12.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.calendar_month_outlined, color: const Color(0xFF1E1E4B), size: 20.sp),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "SCHEDULED DATE", fontSize: 9.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
                            CustomText(text: "Oct 24, 2023 • 10:00 AM", fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Customer & Location ====================
              CustomText(text: "CUSTOMER & LOCATION", fontSize: 12.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 10)),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28.r,
                            backgroundImage: const NetworkImage("https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=200"),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "John Doe", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 14.sp),
                                    SizedBox(width: 4.w),
                                    CustomText(text: "4.9 Rating  •  Customer since 2022", fontSize: 12.sp, color: const Color(0xFF94A3B8)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32.r), bottomRight: Radius.circular(32.r)),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1000",
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 48.w,
                          width: 48.w,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.location_on, color: const Color(0xFF1E1E4B), size: 28.sp),
                        ),
                        Positioned(
                          bottom: 16.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: const Color(0xFF1E293B), size: 16.sp),
                                SizedBox(width: 8.w),
                                CustomText(text: "1200 West Ave, Austin, TX", fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Job Description ====================
              CustomText(text: "JOB DESCRIPTION", fontSize: 12.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 10)),
                  ],
                ),
                child: CustomText(
                  text: "AC unit is making a loud buzzing sound and not cooling effectively in the master bedroom. Customer reported the unit was serviced 6 months ago but the noise started yesterday. Needs full inspection of the condenser and refrigerant levels.",
                  fontSize: 14.sp,
                  color: const Color(0xFF475569),
                  textAlign: TextAlign.start,
                  maxLines: 10,
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Problem Photos ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "PROBLEM PHOTOS", fontSize: 12.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
                  CustomText(text: "3 Photos", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _buildPhoto("https://images.unsplash.com/photo-1581094288338-2314dddb7bc3?auto=format&fit=crop&q=80&w=200"),
                  SizedBox(width: 12.w),
                  _buildPhoto("https://images.unsplash.com/photo-1517646287270-a5a9ca602e5c?auto=format&fit=crop&q=80&w=200"),
                  SizedBox(width: 12.w),
                  _buildPhoto("https://images.unsplash.com/photo-1454165833767-1314dddb7bc3?auto=format&fit=crop&q=80&w=200"),
                ],
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Action Buttons ====================
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline, color: const Color(0xFF1E1E4B), size: 18.sp),
                          SizedBox(width: 10.w),
                          CustomText(text: "Message", fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E4B)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E4B),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.navigation_outlined, color: Colors.white, size: 18.sp),
                          SizedBox(width: 10.w),
                          CustomText(text: "Get Directions", fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoto(String url) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
