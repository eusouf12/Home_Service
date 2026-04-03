import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';
import '../../components/custom_text_field/custom_text_field.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final Color brownColor = const Color(0xFFB17D47);
  List img = [
    "https://img.freepik.com/free-photo/man-installs-heating-system-house-checks-pipes-with-wrench_169016-55834.jpg?semt=ais_incoming&w=740&q=80",
    "https://img.freepik.com/premium-photo/electricity-electrical-maintenance-service-engineer-hand-holding-ac-voltmeter-checking-electric-current-voltage-circuit-breaker-terminal-cable-wiring-main-power-distribution-board_101448-4286.jpg?semt=ais_hybrid&w=740&q=80",
    "https://t4.ftcdn.net/jpg/04/85/59/95/360_F_485599553_gxWaE8AmLEdpLRTS4iHvyBxhNoXMF4X5.jpg",
    "https://img.freepik.com/free-photo/part-male-construction-worker_329181-3734.jpg",
    "https://media.istockphoto.com/id/1314435125/photo/appliance-technician-working-on-a-front-load-washing-machine-in-a-laundry-room.jpg?s=612x612&w=0&k=20&c=s8Ifj98Xhm-y-Xj63VTWeRUGgiNG_uf6OFxfiT4rH0s=",
    "https://static.vecteezy.com/system/resources/thumbnails/070/677/529/small/roofer-installing-asphalt-shingles-on-residential-home-performing-roofing-maintenance-and-repair-services-photo.jpeg",
    "https://media.istockphoto.com/id/1461683093/photo/man-painting-wall-with-light-blue-dye-indoors-back-view.jpg?s=612x612&w=0&k=20&c=TDg87xVDJh-VA4zVClGlMnqpdqTh2QcZ--raihCv9XU="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BackButton(color: AppColors.primary),
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
            child: Icon(Icons.language, color: AppColors.primary, size: 28.sp),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        color: const Color(
                          0xFFE9F0F0,
                        ), 
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
                  Container(
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
                    return Container(
                      width: 100.w,
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CustomNetworkImage(
                              imageUrl: img[index], 
                              height: 110.h, 
                              width: 100.w
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 0.8),
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
                                text: controller.categories[index].toUpperCase(),
                                fontSize: 10.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),

              // Filter Chips
              SizedBox(
                height: 40.h,
                child: ListView.builder(
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

              // Best Providers Horizontal List
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: controller.bestProviders.length,
                  itemBuilder: (context, index) {
                    final provider = controller.bestProviders[index];
                    return Container(
                      width: 330.w,
                      margin: EdgeInsets.only(right: 16.w),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.people,
                                        color: Colors.grey.shade600,
                                        size: 28.sp,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 6.w,
                                                  vertical: 2.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary
                                                      .withValues(alpha: 0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.r,
                                                      ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      color: AppColors.primary,
                                                      size: 12.sp,
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    CustomText(
                                                      text: "Verified",
                                                      color: AppColors.primary,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          CustomText(
                                            text: provider['name'],
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.black,
                                          ),
                                          SizedBox(height: 2.h),
                                          CustomText(
                                            text:
                                                "${provider['jobsCompleted']} jobs completed | ${provider['distance']}",
                                            fontSize: 11.sp,
                                            color: Colors.grey.shade600,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: AppColors.primary,
                                    size: 22.sp,
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.1,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14.sp,
                                        ),
                                        SizedBox(width: 4.w),
                                        CustomText(
                                          text: "${provider['rating']}",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 14.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  CustomText(
                                    text:
                                        "${provider['rating']} (${provider['reviews']})",
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 12.w),
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.grey.shade500,
                                    size: 14.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  CustomText(
                                    text: provider['travelDistance'],
                                    fontSize: 11.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                              CustomText(
                                text: "View Service Plans >",
                                fontSize: 11.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: "Responds in ${provider['responseTime']}",
                            fontSize: 10.sp,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size: 16.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      CustomText(
                                        text: "Call",
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Container(
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.white,
                                        size: 16.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      CustomText(
                                        text: "Message",
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: brownColor,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.request_quote_outlined,
                                        color: Colors.white,
                                        size: 16.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      Flexible(
                                        // Wrap text with Flexible to prevent overflow
                                        child: CustomText(
                                          text: "Request Quote",
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.topTrending.length,
                itemBuilder: (context, index) {
                  final provider = controller.topTrending[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Icon(
                            provider['name'] == 'Smart Plumbing'
                                ? Icons.check_circle_outline
                                : Icons.people,
                            color: provider['name'] == 'Smart Plumbing'
                                ? AppColors.primary
                                : Colors.grey.shade600,
                            size: 28.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: provider['name'],
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: AppColors.primary,
                                          size: 12.sp,
                                        ),
                                        SizedBox(width: 2.w),
                                        CustomText(
                                          text: "Verified",
                                          color: AppColors.primary,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: provider['fastResponse'] == true
                                    ? "Fast response | ${provider['distance']}"
                                    : "${provider['jobsCompleted']} jobs completed | ${provider['distance']}",
                                fontSize: 11.sp,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(height: 12.h),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Row(
                              //           children: [
                              //             Icon(
                              //               Icons.star,
                              //               color: Colors.amber,
                              //               size: 14.sp,
                              //             ),
                              //             SizedBox(width: 4.w),
                              //             CustomText(
                              //               text:
                              //                   "${provider['rating']} (${provider['reviews']})${provider['fastResponse'] == true ? ' Rating' : ''}",
                              //               fontSize: 11.sp,
                              //               color: Colors.grey.shade600,
                              //             ),
                              //           ],
                              //         ),
                              //         SizedBox(height: 4.h),
                              //         Row(
                              //           children: [
                              //             Icon(
                              //               provider['availableNow'] == true
                              //                   ? Icons.check_circle
                              //                   : Icons.access_time,
                              //               color:
                              //                   provider['availableNow'] == true
                              //                   ? tealColor
                              //                   : Colors.grey.shade500,
                              //               size: 14.sp,
                              //             ),
                              //             SizedBox(width: 4.w),
                              //             CustomText(
                              //               text:
                              //                   provider['availableNow'] == true
                              //                   ? "Available\nnow"
                              //                   : provider['travelDistance'],
                              //               fontSize: 11.sp,
                              //               color: Colors.grey.shade600,
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //     Container(
                              //       height: 36.h,
                              //       padding: EdgeInsets.symmetric(
                              //         horizontal: 16.w,
                              //       ),
                              //       decoration: BoxDecoration(
                              //         color: provider['availableNow'] == true
                              //             ? brownColor
                              //             : tealColor,
                              //         borderRadius: BorderRadius.circular(12.r),
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Icon(
                              //             provider['availableNow'] == true
                              //                 ? Icons.flash_on
                              //                 : Icons.call,
                              //             color: Colors.white,
                              //             size: 16.sp,
                              //           ),
                              //           SizedBox(width: 4.w),
                              //           CustomText(
                              //             text: provider['availableNow'] == true
                              //                 ? "Instant Request"
                              //                 : "Request",
                              //             color: Colors.white,
                              //             fontSize: 12.sp,
                              //             fontWeight: FontWeight.w600,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
