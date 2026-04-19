import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../controller/provider_controller.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final ProviderController controller = Get.find<ProviderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: CustomRoyelAppbar(
        titleName: "Gallery",
        leftIcon: true,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
          itemCount: controller.galleryProjects.length,
          itemBuilder: (context, index) {
            final project = controller.galleryProjects[index];
            final images = project["images"] as List<String>;
            
            return Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomText(
                      text: project["title"],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 160.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: images.length,
                      itemBuilder: (context, imgIndex) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => Scaffold(
                                backgroundColor: Colors.black,
                                appBar: AppBar(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  iconTheme: const IconThemeData(color: Colors.white),
                                ),
                                extendBodyBehindAppBar: true,
                                body: Center(
                                  child: InteractiveViewer(
                                    panEnabled: true,
                                    boundaryMargin: EdgeInsets.all(20.w),
                                    minScale: 1.0,
                                    maxScale: 4.0,
                                    child: Image.network(
                                      images[imgIndex],
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 140.w,
                            margin: EdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(images[imgIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
