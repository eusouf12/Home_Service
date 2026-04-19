import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/utils/ToastMsg/toast_message.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/custom_text_field/custom_text_field.dart';
import '../controller/home_controller.dart';
import '../widget/best_provider_card.dart';
import '../widget/top_trending_card.dart';
import '../../../../components/custom_nav_bar/navbar.dart';
import 'language_selected_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  List img = [
    "https://img.freepik.com/free-photo/man-installs-heating-system-house-checks-pipes-with-wrench_169016-55834.jpg?semt=ais_incoming&w=740&q=80",
    "https://img.freepik.com/premium-photo/electricity-electrical-maintenance-service-engineer-hand-holding-ac-voltmeter-checking-electric-current-voltage-circuit-breaker-terminal-cable-wiring-main-power-distribution-board_101448-4286.jpg?semt=ais_hybrid&w=740&q=80",
    "https://img.freepik.com/free-photo/meticulous-wiremen-expertly-refilling-freon-external-air-conditioner-while-using-manifold-measurement-device-closely-measure-pressure-hvac-system-ensuring-perfect-cooling-performance_482257-68069.jpg?semt=ais_incoming&w=740&q=80",
    "https://img.freepik.com/free-photo/part-male-construction-worker_329181-3734.jpg",
    "https://media.istockphoto.com/id/1314435125/photo/appliance-technician-working-on-a-front-load-washing-machine-in-a-laundry-room.jpg?s=612x612&w=0&k=20&c=s8Ifj98Xhm-y-Xj63VTWeRUGgiNG_uf6OFxfiT4rH0s=",
    "https://static.vecteezy.com/system/resources/thumbnails/070/677/529/small/roofer-installing-asphalt-shingles-on-residential-home-performing-roofing-maintenance-and-repair-services-photo.jpeg",
    "https://media.istockphoto.com/id/1461683093/photo/man-painting-wall-with-light-blue-dye-indoors-back-view.jpg?s=612x612&w=0&k=20&c=TDg87xVDJh-VA4zVClGlMnqpdqTh2QcZ--raihCv9XU=",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        bottomNavigationBar: const CustomNavBar(currentIndex: 0),
        extendBody: true,
        backgroundColor: const Color(0xFFF5F7F9),
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: const Color(0xFFF5F7F9),
          elevation: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 100.w,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomImage(
                  imageSrc: AppIcons.newLogo,
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ],
          ),
          centerTitle: true,
          title: CustomText(
            text: "Home Services",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: GestureDetector(
                onTap: () {
                  showLanguageBottomSheet(context);
                },
                child: Icon(
                  Icons.language,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
            ),
          ],
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
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F0F0),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 5,
                            spreadRadius: -4,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: CustomTextField(
                        hintText: "Search Services ...",
                        fillColor: const Color(0xFFE9F0F0),
                        fieldBorderColor: Colors.transparent,
                        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        fieldBorderRadius: 20.r,
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color(0xFF94A3B8),
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.filterScreen);
                    },
                    child: Container(
                      height: 52.h,
                      width: 52.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.tune_rounded,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Service Categories
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelected =
                          controller.selectedCategoryIndex.value == index;
                      return GestureDetector(
                        onTap: () =>
                            controller.selectedCategoryIndex.value = index,
                        child: Container(
                          width: 100.w,
                          margin: EdgeInsets.only(right: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CustomNetworkImage(
                                  imageUrl: img[index],
                                  height: 110.h,
                                  width: 100.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: isSelected
                                          ? [
                                              Colors.black.withValues(
                                                alpha: 0.95,
                                              ),
                                              Colors.black.withValues(
                                                alpha: 0.6,
                                              ),
                                            ]
                                          : [
                                              Colors.black.withValues(
                                                alpha: 0.8,
                                              ),
                                              Colors.transparent,
                                            ],
                                    ),
                                  ),
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(
                                    bottom: 12.h,
                                    left: 8.w,
                                    right: 8.w,
                                  ),
                                  child: CustomText(
                                    text: controller.categories[index]
                                        .toUpperCase(),
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(height: 24.h),
              //sub category
              SizedBox(
                height: 40.h,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: controller.filterChips.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected =
                            controller.selectedFilterChipIndex.value == index;
                        return GestureDetector(
                          onTap: () =>
                              controller.selectedFilterChipIndex.value = index,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            margin: EdgeInsets.only(right: 12.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CustomText(
                              text: controller.filterChips[index],
                              fontSize: 13.sp,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Best Providers Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Providers Near You",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Map View",
                        fontSize: 13.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        right: 4.w,
                      ),
                      Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 16.sp,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.primary,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              SizedBox(
                height: 220,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.bestProviders.length,
                    itemBuilder: (context, index) {
                      final provider = controller.bestProviders[index];
                      return BestProviderCard(
                        name: provider["name"],
                        jobsCompleted: provider["jobsCompleted"],
                        rating: provider["rating"],
                        reviews: provider["reviews"],
                        distance: provider["travelDistance"],
                        responseTime: provider["responseTime"],
                        onCall: () {
                          debugPrint("Call clicked");
                        },
                        onMessage: () {
                          Get.toNamed(AppRoutes.inboxScreen);
                        },
                        onRequest: () {
                          debugPrint("Request clicked");
                        },
                        onTabViewProvider: () {
                           Get.toNamed(AppRoutes.providerProfileScreen);
                        },
                        onTabAddFavourite: () {
                           showCustomSnackBar("Provider Added to Favourite",isError: false);
                           debugPrint("Add Favourite clicked");
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Top Trending Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Top Trending",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Map View",
                        fontSize: 13.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        right: 4.w,
                      ),
                      Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 16.sp,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.primary,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Top Trending Vertical List
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.topTrending.length,
                  itemBuilder: (context, index) {
                    final provider = controller.topTrending[index];
                    return TopTrendingCard(
                      imageUrl: provider['imageUrl'], // Provide fallback if none
                      onTabViewProvider: () {
                         Get.toNamed(AppRoutes.providerProfileScreen);
                      },
                      onRequestTap: () {
                         showCustomSnackBar("Request Clicked", isError: false);
                      },
                      isFastResponse: provider['fastResponse'] ?? false,
                      isAvailableNow: provider['availableNow'] ?? false,
                      isVerified: provider['isVerified'] ?? false,
                      name: provider['name'] ?? '',
                      distance: provider['distance'] ?? '',
                      travelDistance: provider['travelDistance'] ?? '',
                      jobsCompleted: provider['jobsCompleted']?.toString() ?? '0',
                      rating: provider['rating']?.toString() ?? '0.0',
                      reviews: provider['reviews']?.toString() ?? '0',
                    );
                  },
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
