import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../components/custom_button/custom_button.dart';
import '../../components/custom_netwrok_image/custom_network_image.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../components/custom_text/custom_text.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomRoyelAppbar(
        titleName: "Home Services",
        leftIcon: false,
        rightIcon: AppIcons.locationIcon, // Using location icon as a placeholder for globe if not available
        rightOnTap: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            // Search Bar & Filter
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search Services...",
                    fillColor: Colors.white,
                    fieldBorderColor: Colors.grey.shade300,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  height: 54.h,
                  width: 54.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.tune, color: Colors.white),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Service Categories
            CustomText(
              text: "Categories",
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              bottom: 12.h,
            ),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool isSelected = controller.selectedCategoryIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectedCategoryIndex.value = index,
                      child: Container(
                        width: 80.w,
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getCategoryIcon(controller.categories[index]),
                              color: isSelected ? Colors.white : AppColors.primary,
                              size: 28.sp,
                            ),
                            SizedBox(height: 8.h),
                            CustomText(
                              text: controller.categories[index],
                              fontSize: 12.sp,
                              color: isSelected ? Colors.white : AppColors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 24.h),

            // Quick Filter Chips
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.filterChips.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool isSelected = controller.selectedFilterChipIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectedFilterChipIndex.value = index,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        margin: EdgeInsets.only(right: 8.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : Colors.grey.shade300,
                          ),
                        ),
                        child: CustomText(
                          text: controller.filterChips[index],
                          fontSize: 14.sp,
                          color: isSelected ? Colors.white : AppColors.black,
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 24.h),

            // Best Providers Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Best Providers Near You",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.primary, size: 16.sp),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Map View",
                        fontSize: 14.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Provider Cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.providers.length,
              itemBuilder: (context, index) {
                final provider = controller.providers[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomNetworkImage(
                            imageUrl: provider['image'],
                            height: 80.h,
                            width: 80.w,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: provider['name'],
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                    if (provider['isVerified']) ...[
                                      SizedBox(width: 4.w),
                                      const Icon(Icons.verified, color: Colors.blue, size: 16),
                                    ],
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                    SizedBox(width: 4.w),
                                    CustomText(
                                      text: "${provider['rating']}",
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 12.w),
                                    Icon(Icons.location_on, color: Colors.grey, size: 16.sp),
                                    SizedBox(width: 4.w),
                                    CustomText(
                                      text: provider['distance'],
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: CustomText(
                                    text: "Responds in ${provider['responseTime']}",
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: "Call",
                              onTap: () {},
                              height: 40.h,
                              fillColor: AppColors.primary,
                              textColor: Colors.white,
                              fontSize: 14.sp,
                              borderRadius: 12.r,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomButton(
                              title: "Message",
                              onTap: () {},
                              height: 40.h,
                              fillColor: AppColors.primary,
                              textColor: Colors.white,
                              fontSize: 14.sp,
                              borderRadius: 12.r,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 2,
                            child: CustomButton(
                              title: "Request Quote",
                              onTap: () {},
                              height: 40.h,
                              fillColor: const Color(0xFFBE8F5E),
                              textColor: Colors.white,
                              fontSize: 14.sp,
                              borderRadius: 12.r,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 100.h), // Spacing for floating navbar
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case "Plumbing":
        return Icons.plumbing;
      case "Electrical":
        return Icons.electrical_services;
      case "HVAC":
        return Icons.ac_unit;
      case "Handyman":
        return Icons.build;
      default:
        return Icons.category;
    }
  }
}
