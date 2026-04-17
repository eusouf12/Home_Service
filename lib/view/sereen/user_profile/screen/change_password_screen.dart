import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E8267)),
          onPressed: () => Get.back(),
        ),
        title: CustomText(text: "Change Password", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              CustomText(text: "Update Security", fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
              SizedBox(height: 8.h),
              CustomText(
                text: "Enter your current password and choose a strong new one to keep your account secure.",
                fontSize: 13.sp,
                color: const Color(0xFF64748B),
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 32.h),

              _buildInputLabel("Current\nPassword"),
              _buildInputField("********"),
              
              _buildInputLabel("New\nPassword"),
              _buildInputField("Min. 8 characters"),
              
              _buildInputLabel("Confirm New\nPassword"),
              _buildInputField("Re-type new password"),

              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.shield_outlined, color: const Color(0xFF1E8267), size: 16.sp),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: CustomText(
                        text: "Your password must be at least 8 characters long and include a mix of letters, numbers, and symbols.",
                        fontSize: 11.sp,
                        color: const Color(0xFF475569),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48.h),
              CustomButton(
                title: "Update Password",
                height: 52.h,
                fillColor: const Color(0xFF1E8267),
                textColor: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                borderRadius: 26.r,
                onTap: () => Get.back(),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(text: label, fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF475569), textAlign: TextAlign.start),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: CustomTextField(
        textEditingController: TextEditingController(),
        fillColor: Colors.white,
        fieldBorderColor: Colors.transparent,
        hintText: hint,
        isPassword: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        inputTextStyle: TextStyle(color: const Color(0xFF1E293B), fontSize: 13.sp),
      ),
    );
  }
}
