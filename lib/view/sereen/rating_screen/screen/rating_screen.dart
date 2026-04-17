import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../controller/rating_controller.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';

class RatingScreen extends StatelessWidget {
  RatingScreen({Key? key}) : super(key: key);

  final RatingController controller = Get.put(RatingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomRoyelAppbar(
        titleName: "Review",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Provider Info Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.greyLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person, color: AppColors.white, size: 30.r),
                    // backgroundImage: NetworkImage("URL_HERE"),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "SERVICE PROVIDER",
                          color: AppColors.black_02,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Michael Chen",
                              color: AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.verified, color: AppColors.primary, size: 16.sp),
                          ],
                        ),
                        CustomText(
                          text: "Professional Plumbing & Heating",
                          color: AppColors.black_02,
                          fontSize: 12.sp,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.verified_user, color: AppColors.primary, size: 12.sp),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "Verified Provider • 2 days ago",
                              color: AppColors.black_02,
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Rating Section
            Center(
              child: Column(
                children: [
                  CustomText(
                    text: "How was your experience?",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 12.h),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.rating.value = index + 1;
                        },
                        child: Icon(
                          Icons.star,
                          size: 40.sp,
                          color: index < controller.rating.value
                              ? AppColors.primary
                              : AppColors.greyLight,
                        ),
                      );
                    }),
                  )),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "Excellent service!",
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // What did you like Section
            CustomText(
              text: "What did you like?",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 12.h),
            Obx(() => Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: controller.allTags.map((tag) {
                bool isSelected = controller.selectedTags.contains(tag);
                return GestureDetector(
                  onTap: () => controller.toggleTag(tag),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.greyLight.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isSelected)
                          Icon(Icons.check, color: AppColors.white, size: 14.sp),
                        if (isSelected) SizedBox(width: 4.w),
                        CustomText(
                          text: tag,
                          color: isSelected ? AppColors.white : AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
            SizedBox(height: 24.h),

            // Tell others about your experience
            CustomText(
              text: "Tell others about your experience",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              textEditingController: controller.commentController,
              hintText: "Describe the service quality, professionalism, and overall experience.",
              hintStyle: TextStyle(color: AppColors.black_02, fontSize: 12.sp),
              maxLines: 4,
              fillColor: AppColors.white,
              fieldBorderColor: AppColors.greyLight,
              fieldBorderRadius: 12.r,
            ),
            SizedBox(height: 24.h),

            // Add Photos / Videos Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Add Photos / Videos",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                CustomText(
                  text: "Up to 6 Videos",
                  fontSize: 12.sp,
                  color: AppColors.black_02,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                _buildUploadButton("Photo", Icons.camera_alt),
                SizedBox(width: 8.w),
                _buildUploadButton("Video", Icons.videocam),
                SizedBox(width: 8.w),
                _buildUploadButton("Selfie Video", Icons.person_pin),
              ],
            ),
            SizedBox(height: 12.h),
            // Mock uploaded files
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildUploadedMedia(true, AppColors.primary.withOpacity(0.5)),
                  SizedBox(width: 8.w),
                  _buildUploadedMedia(true, Colors.blueGrey.withOpacity(0.5)),
                  SizedBox(width: 8.w),
                  _buildUploadedMedia(false, Colors.orangeAccent.withOpacity(0.3), "Before Repair"),
                  SizedBox(width: 8.w),
                  _buildUploadedMedia(false, Colors.orangeAccent.withOpacity(0.3), "After Repair"),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: CustomText(
                text: "You can upload up to 6 photos & videos.",
                fontSize: 12.sp,
                color: AppColors.black_02,
              ),
            ),
            SizedBox(height: 24.h),

            // Recommend Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Would you recommend this provider?",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    CustomText(
                      text: "Share your review on the Allneeeda feed",
                      fontSize: 12.sp,
                      color: AppColors.black_02,
                    ),
                  ],
                ),
                Obx(() => Switch(
                  value: controller.recommendProvider.value,
                  onChanged: (val) {
                    controller.recommendProvider.value = val;
                  },
                  activeColor: AppColors.primary,
                )),
              ],
            ),
            SizedBox(height: 16.h),

            // Social Share Buttons
            Row(
              children: [
                Expanded(child: _buildSocialButton(Icons.facebook, "Facebook", Colors.blue)),
                SizedBox(width: 8.w),
                Expanded(child: _buildSocialButton(Icons.camera_alt_outlined, "Instagram", Colors.pink)),
                SizedBox(width: 8.w),
                Expanded(child: _buildSocialButton(Icons.music_note, "TikTok", Colors.black)),
              ],
            ),
            SizedBox(height: 30.h),

            // Submit Button
            CustomButton(
              onTap:(){
                showCustomSnackBar("Review submitted successfully!", isError: false);
                Get.offAllNamed(AppRoutes.overViewRatingScreen);
              },
              title: "Submit Review",
              fillColor: AppColors.primary,
              textColor: AppColors.white,
              icon: Icon(Icons.arrow_forward_rounded, color: AppColors.white),
              isImageRight: true,
            ),
            SizedBox(height: 16.h),

            // Footer Text
            Center(
              child: Column(
                children: [
                  CustomText(
                    text: "Tagged business: Michael Chen Plumbing",
                    color: AppColors.black_02,
                    fontSize: 12.sp,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: "YOUR REVIEW WILL BE SHARED PUBLICLY ON THE PLATFORM",
                    color: AppColors.black_02,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.greyLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16.sp, color: AppColors.primary),
          SizedBox(width: 6.w),
          CustomText(
            text: title,
            color: AppColors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _buildUploadedMedia(bool hasClose, Color bgColor, [String? text]) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: text != null
                  ? Icon(Icons.image, color: AppColors.white.withOpacity(0.5))
                  : null,
            ),
            if (hasClose)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 12.sp),
                ),
              ),
          ],
        ),
        if (text != null) SizedBox(height: 4.h),
        if (text != null)
          CustomText(
            text: text,
            fontSize: 10.sp,
            color: AppColors.black_02,
          ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String title, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyLight),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 16.sp),
          SizedBox(width: 4.w),
          CustomText(
            text: title,
            fontSize: 12.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
