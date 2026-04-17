import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../controller/provider_controller.dart';
import '../widget/provider_profile_widgets.dart';

class ProviderProfileScreen extends StatelessWidget {
  ProviderProfileScreen({super.key});

  final ProviderController controller = Get.put(ProviderController());

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Header Section
              SizedBox(
                height: 280.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Cover Image
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=2000&auto=format&fit=crop",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // App Bar overlay
                    Positioned(
                      top: 40.h,
                      left: 20.w,
                      right: 0.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButton(color: Colors.white),
                          const Spacer(),
                          CustomText(
                            text: "Provider Profile",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          SizedBox(width: 36.w), // spacing to center title
                        ],
                      ),
                    ),
                    // Logo box and Request Service Button aligned
                    Positioned(
                      left: 20.w,
                      right: 20.w,
                      bottom: 0.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Profile Avatar Box overlapping the cover
                          Container(
                            height: 120.w,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(8.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B202D),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.architecture,
                                      color: const Color(0xFFE5C07B),
                                      size: 30.sp,
                                    ),
                                    CustomText(
                                      text: "THE PLUMBING",
                                      color: const Color(0xFFE5C07B),
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          // Request Service Button
                          Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: CustomButton(
                              onTap: () {},
                              title: "Request Service",
                              height: 48.h,
                              width: 150.w,
                              fontSize: 13.sp,
                              fillColor: const Color(0xFFFF6D4D),
                              textColor: Colors.white,
                              borderRadius: 8.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 20.h),
      
              // Main Content Area
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Rating info
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "The Plumbing Service",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.verified,
                          color: const Color(0xFF3B82F6),
                          size: 18.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: "Expert Interior & Maintenance Services",
                      fontSize: 12.sp,
                      color: const Color(0xFF4B5563),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFBBF24),
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: "4.9",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                        CustomText(
                          text: " (128 reviews)",
                          fontSize: 12.sp,
                          color: const Color(0xFF6B7280),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
      
                    // Message, Call and Directions Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              Get.toNamed(AppRoutes.inboxScreen);
                            },
                            title: "Message",
                            icon: Padding(
                              padding: EdgeInsets.only(right: 6.w),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                            fillColor: const Color(0xFF1F7A62),
                            textColor: Colors.white,
                            height: 44.h,
                            borderRadius: 8.r,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomButton(
                            onTap: () {},
                            title: "Call",
                            icon: Padding(
                              padding: EdgeInsets.only(right: 6.w),
                              child: Icon(
                                Icons.call_outlined,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                            fillColor: const Color(0xFF1F7A62),
                            textColor: Colors.white,
                            height: 44.h,
                            borderRadius: 8.r,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    CustomButton(
                      onTap: () {},
                      title: "Get Directions",
                      icon: Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: const Color(0xFF1F7A62),
                          size: 16.sp,
                        ),
                      ),
                      fillColor: Colors.white,
                      textColor: const Color(0xFF1F7A62),
                      height: 44.h,
                      borderRadius: 8.r,
                      fontSize: 14.sp,
                      isBorder: true,
                      borderWidth: 1.0,
                      borderColor: const Color(0xFF1F7A62),
                    ),
                    SizedBox(height: 24.h),
      
                    // Provider Insights
                    Obx(
                      () => ProviderInsights(
                        responseSpeed: controller.responseSpeed.value,
                        acceptanceRate: controller.acceptanceRate.value,
                      ),
                    ),
                    SizedBox(height: 24.h),
      
                    // Services Offered
                    Obx(
                      () => ServicesOffered(services: controller.servicesOffered.toList()),
                    ),
                    SizedBox(height: 24.h),
      
                    // Business Hours
                    Obx(() => BusinessHours(hours: Map<String, String>.from(controller.businessHours))),
                    SizedBox(height: 24.h),
      
                    // Recent Projects
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Recent Projects",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.galleryScreen);
                          },
                          child: CustomText(
                            text: "View Gallery",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D695A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Obx(
                      () => SizedBox(
                        height: 100.w,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.recentProjects.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100.w,
                              margin: EdgeInsets.only(right: 12.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                    controller.recentProjects[index]["image"],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
      
                    // Customer Reviews
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Customer Reviews",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.allReviewsScreen);
                          },
                          child: CustomText(
                            text: "Read All",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D695A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Obx(
                      () => Column(
                        children: controller.customerReviews.map((review) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomerReviewCard(
                              authorName: review["author"],
                              timeText: review["date"],
                              content: review["text"],
                              rating: review["rating"],
                              avatarUrl: review["avatar"],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
