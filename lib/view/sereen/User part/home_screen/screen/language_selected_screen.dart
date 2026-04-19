import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../controller/home_controller.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Drag handle
            Container(
              height: 4.h,
              width: 40.w,
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            /// Title
            CustomText(
              text: "Change Language",
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),

            SizedBox(height: 4.h),

            CustomText(
              text: "Select your preferred language for Allneeda",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),

            SizedBox(height: 20.h),

            /// Language list
            Obx(() {
              final controller = Get.find<HomeController>();
              return Column(
                children: List.generate(controller.languagesList.length, (index) {
                  final lang = controller.languagesList[index];
                  bool isSelected = controller.selectedLanguageIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedLanguageIndex.value = index;
                    },
                    child: _languageItem(
                      lang["name"]!,
                      lang["country"]!,
                      lang["flag"]!,
                      isSelected,
                    ),
                  );
                }),
              );
            }),

            SizedBox(height: 20.h),

            /// Save Button
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: "Save Changes",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () => Get.back(),
              child: CustomText(
                text: "Cancel",
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 10.h),
          ],
        ),
      );
    },
  );
}

Widget _languageItem(String title, String subtitle, String flagUrl, bool isSelected) {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: isSelected ? Color(0xFFF3E8E2) : Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        /// Flag
        Container(
          height: 36.r,
          width: 36.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: CustomNetworkImage(
            imageUrl: flagUrl,
            height: 36.r,
            width: 36.r,
            boxShape: BoxShape.circle,
          ),
        ),

        SizedBox(width: 12.w),

        /// Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey),
              ),
            ],
          ),
        ),

        /// Radio
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey,
              width: 2,
            ),
          ),
          child: isSelected
              ? Icon(Icons.check, size: 16.sp, color: AppColors.primary)
              : null,
        ),
      ],
    ),
  );
}
