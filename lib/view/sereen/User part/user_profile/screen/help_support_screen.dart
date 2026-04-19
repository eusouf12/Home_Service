import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF334155)),
            onPressed: () => Get.back(),
          ),
          title: CustomText(text: "Help & Support", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                _buildSupportTile(
                  icon: Icons.help_outline,
                  title: "Help Center",
                  subtitle: "Find answers to FAQs",
                  onTap: () {},
                ),
                _buildSupportTile(
                  icon: Icons.report_problem_outlined,
                  title: "Report an Issue",
                  subtitle: "Let us know what went wrong",
                  onTap: () {},
                ),
                _buildSupportTile(
                  icon: Icons.headset_mic_outlined,
                  title: "Contact Support",
                  subtitle: "Talk to our friendly team",
                  onTap: () {},
                ),
                
                SizedBox(height: 40.h),
                CustomText(text: "Send us a message", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                SizedBox(height: 16.h),
                
                Container(
                  height: 150.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tell us how we can help you today...",
                          hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
                        ),
                        style: TextStyle(color: const Color(0xFF334155), fontSize: 14.sp),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.attach_file, color: const Color(0xFF94A3B8), size: 24.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  title: "Submit Request",
                  height: 52.h,
                  fillColor: const Color(0xFF1E8267),
                  textColor: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  borderRadius: 26.r,
                  onTap: () {},
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSupportTile({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: const BoxDecoration(color: Color(0xFFECFDF5), shape: BoxShape.circle),
              child: Icon(icon, color: const Color(0xFF1E8267), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title, fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                  SizedBox(height: 4.h),
                  CustomText(text: subtitle, fontSize: 12.sp, color: const Color(0xFF94A3B8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
