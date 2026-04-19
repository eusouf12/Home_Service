import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../controller/provider_onboarding_controller.dart';

class ProviderOnboardingScreen extends StatelessWidget {
  const ProviderOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderOnboardingController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Provider Onboarding",
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1E293B),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            ///==================== Account Info Section ====================
            _buildSection(
              title: "Account Info",
              icon: Icons.person_outline,
              children: [
                _buildLabel("Full Name"),
                CustomTextField(
                  hintText: "John Doe",
                  fillColor: const Color(0xFFF1F5F9),
                  fieldBorderRadius: 12.r,
                  hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
                ),
                SizedBox(height: 16.h),
                _buildLabel("Email Address"),
                CustomTextField(
                  hintText: "john@example.com",
                  fillColor: const Color(0xFFF1F5F9),
                  fieldBorderRadius: 12.r,
                  hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
                ),
                SizedBox(height: 16.h),
                _buildLabel("Phone Number"),
                CustomTextField(
                  hintText: "+1 (555) 000-0000",
                  fillColor: const Color(0xFFF1F5F9),
                  fieldBorderRadius: 12.r,
                  hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
                ),
              ],
            ),

            ///==================== Business Profile Section ====================
            _buildSection(
              title: "Business Profile",
              icon: Icons.business_outlined,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80.w,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(Icons.add_a_photo_outlined, color: const Color(0xFF94A3B8), size: 32.sp),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Business Logo", fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                          CustomText(text: "Upload a high-resolution logo for your business.", fontSize: 12.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _buildLabel("Service Categories"),
                Obx(() => Wrap(
                  spacing: 8.w,
                  runSpacing: 10.h,
                  children: [
                    ...controller.serviceCategories.map((cat) {
                      final isSelected = controller.selectedCategories.contains(cat);
                      return GestureDetector(
                        onTap: () => controller.toggleCategory(cat),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF1E1E4B) : const Color(0xFFE2E8F0).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: CustomText(
                            text: cat,
                            fontSize: 14.sp,
                            color: isSelected ? Colors.white : const Color(0xFF1E1E4B),
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: () => _showAddCategoryDialog(controller),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 18.sp, color: const Color(0xFF1E1E4B)),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "Add",
                              fontSize: 14.sp,
                              color: const Color(0xFF1E1E4B),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 24.h),
                _buildLabel("Service Radius"),
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(
                      image: NetworkImage("https://mintcdn.com/radarlabs/CuPuqjYnZpb8PqvH/images/maps/static-map.png?fit=max&auto=format&n=CuPuqjYnZpb8PqvH&q=85&s=1b71ee148eb196568482981ca7e1b782"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
                      child: CustomText(text: "20 mi radius", fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            ///==================== Document Upload Section ====================
            _buildSection(
              title: "Document Upload",
              icon: Icons.upload_file_outlined,
              children: [
                _buildUploadTile("Government ID", "Required"),
                SizedBox(height: 12.h),
                _buildUploadTile("Business License", "Optional"),
              ],
            ),

            ///==================== Monetization Plans Section ====================
            _buildSection(
              title: "Monetization Plans",
              icon: Icons.payments_outlined,
              children: [
                _buildRadioTile("Pay Per Lead", "12.5% commission", controller),
                _buildRadioTile("Subscription", "19.99/month unlimited", controller),
                _buildRadioTile("Hybrid", "9.99/mo + 5% per lead", controller),
              ],
            ),

            ///==================== Wallet Section ====================
            _buildSection(
              title: "Wallet",
              icon: Icons.account_balance_wallet_outlined,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      CustomText(text: "INITIAL BALANCE", fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF94A3B8)),
                      SizedBox(height: 8.h),
                      CustomText(text: "\$0.00", fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [10, 50, 100].map((amount) {
                    return Obx(() => GestureDetector(
                      onTap: () => controller.setTopUp(amount),
                      child: Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: controller.selectedTopUp.value == amount ? const Color(0xFF1E1E4B) : Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: CustomText(
                          text: "\$$amount",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: controller.selectedTopUp.value == amount ? Colors.white : const Color(0xFF1E293B),
                        ),
                      ),
                    ));
                  }).toList(),
                ),
              ],
            ),

            ///==================== AI Agent Settings Section ====================
            _buildSection(
              title: "AI Agent Settings",
              icon: Icons.smart_toy_outlined,
              children: [
                _buildSwitchTile("AI Drafting/Reply", "Suggests best replies to chats", controller.isAiDraftingEnabled, controller.toggleAiDrafting),
                _buildSwitchTile("Auto-Response", "Replies instantly when you're busy", controller.isAutoResponseEnabled, controller.toggleAutoResponse),
              ],
            ),

            ///==================== Operations Section ====================
            _buildSection(
              title: "Operations",
              icon: Icons.calendar_today_outlined,
              children: [
                _buildLabel("Business Hours"),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                    children: controller.businessHours.map((bh) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: bh["day"]!, fontSize: 12.sp, color: const Color(0xFF64748B)),
                            CustomText(text: bh["hours"]!, fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16.h),
                _buildLabel("Emergency Contact"),
                CustomTextField(
                  hintText: "Direct Support Line",
                  fillColor: const Color(0xFFF1F5F9),
                  fieldBorderRadius: 12.r,
                  hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 13.sp),
                ),
              ],
            ),

            SizedBox(height: 32.h),
            
            ///==================== Bottom Button ====================
            CustomButton(
              title: "Complete Onboarding",
              height: 56.h,
              fillColor: const Color(0xFF1E1E4B),
              textColor: Colors.white,
              borderRadius: 28.r,
              onTap: () {
                Get.toNamed(AppRoutes.providerHomeScreen); 
              },
            ),
            
            SizedBox(height: 20.h),
            CustomText(
              text: "By completing onboarding, you agree to our Terms of Service and Privacy Policy. All information is secure and used for verification.",
              fontSize: 10.sp,
              color: const Color(0xFF94A3B8),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(ProviderOnboardingController controller) {
    final textController = TextEditingController();
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: "Add Category", fontSize: 18.sp, fontWeight: FontWeight.bold),
              SizedBox(height: 16.h),
              CustomTextField(
                textEditingController: textController,
                hintText: "Enter category name",
                fillColor: const Color(0xFFF1F5F9),
                fieldBorderRadius: 12.r,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Cancel",
                      height: 48.h,
                      fillColor: Colors.white,
                      textColor: const Color(0xFF1E1E4B),
                      isBorder: true,
                      borderColor: const Color(0xFFE2E8F0),
                      onTap: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      title: "Add",
                      height: 48.h,
                      fillColor: const Color(0xFF1E1E4B),
                      textColor: Colors.white,
                      onTap: () {
                        controller.addCategory(textController.text);
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1E1E4B), size: 20.sp),
              SizedBox(width: 12.w),
              CustomText(text: title, fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E1E4B)),
            ],
          ),
          SizedBox(height: 20.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(text: label, fontSize: 13.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start),
    );
  }

  Widget _buildUploadTile(String title, String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(Icons.description_outlined, color: const Color(0xFF475569), size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(child: CustomText(text: title, fontSize: 13.sp, color: const Color(0xFF1E293B), textAlign: TextAlign.start)),
          CustomText(text: status, fontSize: 11.sp, fontWeight: FontWeight.bold, color: status == "Required" ? const Color(0xFFF97316) : const Color(0xFF94A3B8)),
          SizedBox(width: 8.w),
          Icon(Icons.chevron_right, color: const Color(0xFF94A3B8), size: 18.sp),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, String subtitle, ProviderOnboardingController controller) {
    return Obx(() {
      final isSelected = controller.selectedPlan.value == title;
      return GestureDetector(
        onTap: () => controller.setPlan(title),
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E1E4B).withOpacity(0.03) : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: isSelected ? const Color(0xFF1E1E4B) : const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: title, fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                    CustomText(text: subtitle, fontSize: 11.sp, color: const Color(0xFF64748B)),
                  ],
                ),
              ),
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: isSelected ? const Color(0xFF1E1E4B) : const Color(0xFFCBD5E1),
                size: 20.sp,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSwitchTile(String title, String subtitle, RxBool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: title, fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                CustomText(text: subtitle, fontSize: 11.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start),
              ],
            ),
          ),
          Obx(() => Switch(
            value: value.value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF1E1E4B),
          )),
        ],
      ),
    );
  }
}
