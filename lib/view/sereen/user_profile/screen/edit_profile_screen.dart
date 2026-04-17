import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E8267)),
          onPressed: () => Get.back(),
        ),
        title: CustomText(text: "Edit Profile", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              
              // Profile Picture
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 110.w,
                      width: 110.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFF1F5F9), width: 4.w),
                        image: const DecorationImage(
                          image: NetworkImage("https://img.freepik.com/free-photo/headshot-portrait-happy-mixed-race-african-girl-wearing-glasses_114579-79848.jpg"), // Generic face
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E8267),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                        child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 16.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: CustomText(text: "Change\nPhoto", color: const Color(0xFF1E8267), fontSize: 12.sp, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
              ),
              
              SizedBox(height: 32.h),
              
              // Forms
              _buildInputLabel("Full Name"),
              _buildInputField("Sofia Richards"),
              
              _buildInputLabel("Email Address"),
              _buildInputField("sofia.richards@example.com"),
              
              _buildInputLabel("Phone Number"),
              _buildInputField("+1 (555) 000-1234"),
              
              _buildInputLabel("Bio"),
              Container(
                margin: EdgeInsets.only(bottom: 24.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 10)],
                ),
                child: CustomTextField(
                  fillColor: Colors.white,
                  fieldBorderColor: Colors.transparent,
                  textEditingController: TextEditingController(text: "Licensed esthetician specializing in natural skincare and holistic treatments. Dedicated to bringing out your inner glow."),
                  maxLines: 4,
                  inputTextStyle: TextStyle(color: const Color(0xFF334155), fontSize: 13.sp),
                ),
              ),
              
              // Interests
              CustomText(text: "INTERESTS & SPECIALTIES", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  _buildInterestChip("Hair", true),
                  _buildInterestChip("Skincare", true),
                  _buildInterestChip("Nails", false),
                  _buildInterestChip("Makeup", true),
                  _buildInterestChip("Lashes", false),
                  _buildInterestChip("Facials", false),
                  _buildInterestChip("+ Add", false),
                ],
              ),
              
              SizedBox(height: 48.h),
              
              // Button
              CustomButton(
                 title: "Save Changes",
                 height: 52.h,
                 fillColor: const Color(0xFF1E8267),
                 fontSize: 16.sp,
                 fontWeight: FontWeight.bold,
                 borderRadius: 26.r,
                 onTap: () => Get.back(),
              ),
              
              SizedBox(height: 24.h),
              
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline, color: const Color(0xFFEF4444), size: 16.sp),
                    SizedBox(width: 8.w),
                    CustomText(text: "Delete Account", color: const Color(0xFFEF4444), fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ],
                ),
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
      padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
      child: CustomText(text: label, fontSize: 10.sp, color: const Color(0xFF1E8267), fontWeight: FontWeight.w600),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Center(
        child: CustomTextField(
          textEditingController: TextEditingController(text: hint),
          fillColor: Colors.white,
          fieldBorderColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          inputTextStyle: TextStyle(color: const Color(0xFF1E293B), fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
  
  Widget _buildInterestChip(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E8267) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomText(
        text: title,
        color: isSelected ? Colors.white : const Color(0xFF475569),
        fontSize: 12.sp,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      ),
    );
  }
}
