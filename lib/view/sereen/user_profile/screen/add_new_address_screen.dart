import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';
import 'package:home_service/view/sereen/user_profile/widgets/address_label_chip.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../controller/add_new_address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNewAddressController());
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: () => Get.back(),
          ),
          title: CustomText(text: "Add New Address", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Stack(
                  children: [
                    Container(
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: const DecorationImage(
                          image: NetworkImage("https://mintcdn.com/radarlabs/CuPuqjYnZpb8PqvH/images/maps/static-map.png?fit=max&auto=format&n=CuPuqjYnZpb8PqvH&q=85&s=1b71ee148eb196568482981ca7e1b782"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12.h,
                      right: 12.w,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]),
                        child: Icon(Icons.my_location, color: const Color(0xFF475569), size: 20.sp),
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      left: 140.w,
                      child: Column(
                        children: [
                          Icon(Icons.location_on, color: const Color(0xFF1E8267), size: 40.sp),
                          CustomText(text: "San Francisco", fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: CustomTextField(
                    textEditingController: TextEditingController(),
                    fillColor: Colors.white,
                    hintText: "Search for address...",
                    prefixIcon: Icon(Icons.search, color: const Color(0xFF94A3B8), size: 20.sp),
                    fieldBorderColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 24.h),
                
                _buildInputLabel("Street Address"),
                _buildInputField("221B Baker Street"),
                
                _buildInputLabel("Suite / Apartment / Unit (Optional)"),
                _buildInputField("e.g. Apt 4B"),
                
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInputLabel("City"),
                          _buildInputField("London"),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInputLabel("Zip Code"),
                          _buildInputField("NW1 6XE"),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 16.h),
                _buildInputLabel("Address Label"),
                Obx(() => Wrap(
                  children: [
                    AddressLabelChip(label: "Home", isSelected: controller.selectedLabel.value == "Home", onTap: () => controller.selectLabel("Home")),
                    AddressLabelChip(label: "Office", isSelected: controller.selectedLabel.value == "Office", onTap: () => controller.selectLabel("Office")),
                    AddressLabelChip(label: "Parent's House", isSelected: controller.selectedLabel.value == "Parent's House", onTap: () => controller.selectLabel("Parent's House")),
                    AddressLabelChip(label: "Other", isSelected: controller.selectedLabel.value == "Other", onTap: () => controller.selectLabel("Other")),
                  ],
                )),
                
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: const Color(0xFF94A3B8), size: 20.sp),
                        SizedBox(width: 8.w),
                        CustomText(text: "Set as Default Address", fontSize: 13.sp, color: const Color(0xFF334155)),
                      ],
                    ),
                    Obx(() => Switch(
                      value: controller.isDefault.value,
                      onChanged: (val) {
                        controller.toggleDefault(val);
                      },
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xFF1E8267),
                    ))
                  ],
                ),
                
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: CustomButton(
            title: "Save Address",
            height: 52.h,
            fillColor: const Color(0xFF1E8267),
            textColor: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            borderRadius: 26.r,
            onTap: (){
              Get.toNamed(AppRoutes.userProfileScreen);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(text: label, fontSize: 10.sp, color: const Color(0xFF64748B), textAlign: TextAlign.start),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: CustomTextField(
        textEditingController: TextEditingController(),
        fillColor: Colors.white,
        fieldBorderColor: Colors.transparent,
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        inputTextStyle: TextStyle(color: const Color(0xFF1E293B), fontSize: 13.sp),
      ),
    );
  }
}
