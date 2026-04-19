import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class LegalPoliciesScreen extends StatelessWidget {
  const LegalPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E8267)),
            onPressed: () => Get.back(),
          ),
          title: CustomText(text: "Legal & Policies", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Privacy Policy", fontSize: 24.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E8267)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(4.r)),
                      child: CustomText(text: "V2.4.0", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(text: "Last Updated: October 24, 2023", fontSize: 11.sp, color: const Color(0xFF94A3B8)),
                
                SizedBox(height: 32.h),
                _buildSectionTitle("1. Information We Collect"),
                _buildParagraph("We collect information that you provide directly to us when you create an account, use our services, or communicate with us. This may include your name, email address, phone number, and payment information."),
                _buildParagraph("Automatically collected data includes your IP address, browser type, operating system, and usage patterns on the Allneeda platform."),
      
                SizedBox(height: 24.h),
                _buildSectionTitle("2. How We Use Your Data"),
                _buildParagraph("Your data allows us to provide, maintain, and improve our services. We use it to:"),
                _buildBulletList(["Process transactions and send related information.", "Send technical notices, updates, and security alerts.", "Respond to your comments and questions.", "Personalize your experience with relevant recommendations."]),
      
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    border: Border(left: BorderSide(color: const Color(0xFF1E8267), width: 4.w)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "IMPORTANT NOTE", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E8267)),
                      SizedBox(height: 8.h),
                      CustomText(text: "We never sell your personal data to third parties for marketing purposes. Your trust is our priority.", fontSize: 12.sp, color: const Color(0xFF475569), textAlign: TextAlign.start, maxLines: 3),
                    ],
                  ),
                ),
      
                SizedBox(height: 24.h),
                _buildSectionTitle("3. Data Security"),
                _buildParagraph("We implement a variety of security measures to maintain the safety of your personal information. We use advanced encryption and secure socket layer (SSL) technology to protect sensitive data during transmission."),
                
                SizedBox(height: 24.h),
                _buildSectionTitle("4. Your Rights"),
                _buildParagraph("Depending on your location, you may have the right to access, correct, or delete your personal data. You can manage most of these settings directly within the Account Settings section of the app."),
                
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: CustomText(text: title, fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B), textAlign: TextAlign.start),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: CustomText(text: text, fontSize: 12.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start, maxLines: 10),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: EdgeInsets.only(bottom: 12.h, left: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h, right: 8.w),
              child: Container(width: 4.w, height: 4.w, decoration: const BoxDecoration(color: Color(0xFF64748B), shape: BoxShape.circle)),
            ),
            Expanded(child: CustomText(text: item, fontSize: 12.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start, maxLines: 3)),
          ],
        ),
      )).toList(),
    );
  }
}
