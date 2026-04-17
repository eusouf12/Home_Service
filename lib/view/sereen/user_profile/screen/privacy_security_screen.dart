import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

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
          title: CustomText(text: "Privacy & Security", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                CustomText(text: "SECURITY SETTINGS", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
                SizedBox(height: 12.h),
                _buildContainer([
                  _buildTile(Icons.lock_outline, "Change Password", onTap: () => Get.toNamed(AppRoutes.changePasswordScreen)),
                  Divider(color: const Color(0xFFF1F5F9), height: 1.h),
                  _buildTile(Icons.devices, "Logged-in Devices", subtitle: "3 active sessions", onTap: () {}),
                ]),
                
                SizedBox(height: 32.h),
                CustomText(text: "LEGAL & PRIVACY", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
                SizedBox(height: 12.h),
                _buildContainer([
                  _buildTile(Icons.description_outlined, "Privacy Policy", onTap: () => Get.toNamed(AppRoutes.legalPoliciesScreen)),
                  Divider(color: const Color(0xFFF1F5F9), height: 1.h),
                  _buildTile(Icons.gavel_outlined, "Terms of Service", onTap: () => Get.toNamed(AppRoutes.legalPoliciesScreen)),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile(IconData icon, String title, {String? subtitle, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: const Color(0xFFECFDF5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: const Color(0xFF1E8267), size: 18.sp),
      ),
      title: CustomText(text: title, fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B), textAlign: TextAlign.start),
      subtitle: subtitle != null ? CustomText(text: subtitle, fontSize: 11.sp, color: const Color(0xFF94A3B8), textAlign: TextAlign.start) : null,
      trailing: Icon(Icons.chevron_right, color: const Color(0xFFCBD5E1), size: 20.sp),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    );
  }
}
