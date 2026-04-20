import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';

class ProviderLeadDetailsScreen extends StatelessWidget {
  final bool isCompleted;
  const ProviderLeadDetailsScreen({this.isCompleted = false, super.key});

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
            text: isCompleted ? "Completed Lead Details" : "Lead Details",
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share_outlined, color: Color(0xFF1E293B)),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              
              ///==================== Issue Media ====================
              CustomText(
                text: "ISSUE MEDIA",
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF94A3B8),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 120.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildMediaImage("https://images.unsplash.com/photo-1581094288338-2314dddb7bc3?auto=format&fit=crop&q=80&w=500"),
                    _buildMediaImage("https://images.unsplash.com/photo-1517646287270-a5a9ca602e5c?auto=format&fit=crop&q=80&w=500"),
                    _buildMediaImage("https://images.unsplash.com/photo-1454165833767-1314dddb7bc3?auto=format&fit=crop&q=80&w=500"),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Stats Row ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem(Icons.business_center, "CATEGORY", "HVAC"),
                  _buildStatItem(Icons.priority_high, "URGENCY", "Urgent"),
                  _buildStatItem(Icons.payments_outlined, "EST. VALUE", "\$450.00"),
                ],
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Customer Description ====================
              CustomText(
                text: "CUSTOMER DESCRIPTION",
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF94A3B8),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.format_quote, color: const Color(0xFFE2E8F0), size: 48.sp),
                    ),
                    CustomText(
                      text: "My central AC unit started making a loud rattling noise this morning and the air coming out isn't cold anymore. It's an older Trane model. Need someone to take a look as soon as possible before the weekend heatwave.",
                      fontSize: 14.sp,
                      color: const Color(0xFF475569),
                      textAlign: TextAlign.start,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Approximate Location ====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "APPROXIMATE LOCATION",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF94A3B8),
                  ),
                  CustomText(
                    text: "~2.5 mile radius",
                    fontSize: 10.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.network(
                  "https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1000",
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              
              SizedBox(height: 32.h),
              
              ///==================== Preferred Schedule ====================
              CustomText(
                text: "PREFERRED SCHEDULE",
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF94A3B8),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 56.w,
                      width: 56.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: "OCT", fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                          CustomText(text: "24", fontSize: 18.sp, fontWeight: FontWeight.w900, color: const Color(0xFF1E293B)),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: isCompleted ? "Thursday" : "Tomorrow, Thursday",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E293B),
                          ),
                          CustomText(
                            text: "Morning Window: 8:00 AM - 11:00 AM",
                            fontSize: 12.sp,
                            color: const Color(0xFF64748B),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.calendar_month_outlined, color: const Color(0xFF94A3B8), size: 24.sp),
                  ],
                ),
              ),
              
              SizedBox(height: 40.h),
              
              ///==================== Footer Card ====================
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48.w,
                          width: 48.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.plumbing, color: const Color(0xFF1E1E4B), size: 24.sp),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Plumbing Service",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF1E293B),
                              ),
                              CustomText(
                                text: "Received 5m ago",
                                fontSize: 11.sp,
                                color: const Color(0xFF94A3B8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "LOCATION", fontSize: 8.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
                              CustomText(text: "2 miles away", fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "ESTIMATE", fontSize: 8.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
                              CustomText(text: "\$150 - \$200", fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    if (isCompleted)
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: CustomText(
                          text: "Completed",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF475569),
                        ),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(text: "Decline", fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 52.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E4B),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(text: "Accept Lead", fontSize: 15.sp, fontWeight: FontWeight.w800, color: Colors.white),
                                  SizedBox(width: 8.w),
                                  Icon(Icons.bolt, color: Colors.white, size: 18.sp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaImage(String url) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1E293B), size: 20.sp),
          SizedBox(height: 8.h),
          CustomText(text: label, fontSize: 8.sp, fontWeight: FontWeight.w900, color: const Color(0xFF94A3B8)),
          CustomText(text: value, fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ],
      ),
    );
  }
}
