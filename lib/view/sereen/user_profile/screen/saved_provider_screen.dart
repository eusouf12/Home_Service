import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_netwrok_image/custom_network_image.dart';

class SavedProviderScreen extends StatelessWidget {
  const SavedProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF334155)),
          onPressed: () => Get.back(),
        ),
        title: CustomText(text: "Saved Providers", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildProviderCard(
                name: "Chef Julian Vane",
                category: "French Cuisine",
                rating: "4.9",
                reviews: "128",
                imageUrl: "https://img.freepik.com/free-photo/portrait-smiling-chef-uniform_329181-675.jpg",
              ),
              _buildProviderCard(
                name: "Elena Rodriguez",
                category: "Interior Design",
                rating: "4.8",
                reviews: "94",
                imageUrl: "https://img.freepik.com/free-photo/close-up-portrait-gorgeous-young-woman_273609-35368.jpg",
              ),
              _buildProviderCard(
                name: "Marcus Thorne",
                category: "Personal Trainer",
                rating: "5.0",
                reviews: "210",
                imageUrl: "https://img.freepik.com/free-photo/handsome-young-man-with-new-stylish-haircut_176420-31559.jpg",
              ),
              _buildProviderCard(
                name: "Sarah Jenkins",
                category: "Home Cleaning",
                rating: "4.7",
                reviews: "56",
                imageUrl: "https://img.freepik.com/free-photo/headshot-portrait-happy-mixed-race-african-girl-wearing-glasses_114579-79848.jpg",
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProviderCard({required String name, required String category, required String rating, required String reviews, required String imageUrl}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  height: 80.w,
                  width: 80.w,
                  boxShape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: name, fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                    SizedBox(height: 4.h),
                    CustomText(text: category, fontSize: 12.sp, color: const Color(0xFF64748B)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: const Color(0xFFFBBF24), size: 14.sp),
                        SizedBox(width: 4.w),
                        CustomText(text: rating, fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF334155)),
                        SizedBox(width: 4.w),
                        CustomText(text: "($reviews reviews)", fontSize: 12.sp, color: const Color(0xFF94A3B8)),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEA580C),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: CustomText(text: "Book Now", fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(Icons.favorite, color: const Color(0xFFEA580C), size: 20.sp),
          ),
        ],
      ),
    );
  }
}
