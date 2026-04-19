import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class BecomeProviderScreen extends StatelessWidget {
  const BecomeProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Get.back(),
        ),
        title: CustomText(text: "Become a Provider", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  image: const DecorationImage(
                    image: NetworkImage("https://img.freepik.com/free-photo/side-view-man-holding-vacuum-cleaner_23-2149492196.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: "Start offering services\non Allneeda",
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0F172A),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),

              _buildFeatureTile(
                icon: Icons.people_outline,
                title: "Reach more customers",
                subtitle: "Connect with thousands of local clients searching for your expertise",
              ),
              _buildFeatureTile(
                icon: Icons.access_time,
                title: "Flexible working hours",
                subtitle: "You are the boss. Work whenever you want, on your own terms",
              ),
              _buildFeatureTile(
                icon: Icons.payments_outlined,
                title: "Earn income",
                subtitle: "Secure direct payments and grow your professional business",
              ),

              SizedBox(height: 40.h),
              CustomButton(
                title: "Register as Provider",
                height: 52.h,
                fillColor: const Color(0xFF1E8267),
                textColor: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                borderRadius: 26.r,
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: "By joining, you agree to Allneeda's Terms of Service",
                fontSize: 10.sp,
                color: const Color(0xFF94A3B8),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTile({required IconData icon, required String title, required String subtitle}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: const Color(0xFF1E8267), size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: title, fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                SizedBox(height: 4.h),
                CustomText(
                  text: subtitle,
                  fontSize: 11.sp,
                  color: const Color(0xFF64748B),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
