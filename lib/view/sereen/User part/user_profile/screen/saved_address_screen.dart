import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

import '../widgets/other_location_card.dart';
import '../widgets/primary_location_card.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: CustomText(text: "Saved Addresses", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                CustomButton(
                  title: "Add New Address",
                  icon: Icon(Icons.add_location_alt_outlined, color: Colors.white, size: 20.sp),
                  height: 52.h,
                  fillColor: const Color(0xFF1E8267),
                  textColor: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  borderRadius: 26.r,
                  onTap: () {
                    Get.toNamed(AppRoutes.addNewAddressScreen);
                  },
                ),
                SizedBox(height: 32.h),
                CustomText(text: "PRIMARY LOCATIONS", fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                SizedBox(height: 16.h),
                
                PrimaryLocationCard(
                  title: "Home",
                  address: "123 Luxury Lane, Penthouse A, Beverly Hills, CA 90210",
                  icon: Icons.home,
                  isDefault: true,
                  mapImageUrl: "https://mintcdn.com/radarlabs/CuPuqjYnZpb8PqvH/images/maps/static-map.png?fit=max&auto=format&n=CuPuqjYnZpb8PqvH&q=85&s=1b71ee148eb196568482981ca7e1b782",
                  onEdit: () {},
                  onDelete: () {},
                ),
                PrimaryLocationCard(
                  title: "Office",
                  address: "888 Corporate Blvd, Suite 500, Manhattan, NY 10001",
                  icon: Icons.business,
                  isDefault: false,
                  mapImageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrAmADxkO_EMOlhOTC48pb29ObKdMoDhblJw&s",
                  onEdit: () {},
                  onDelete: () {},
                ),
                
                SizedBox(height: 24.h),
                CustomText(text: "OTHER LOCATIONS", fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                SizedBox(height: 16.h),
                
                OtherLocationCard(
                  title: "Elite Fitness Club",
                  address: "456 Muscle Way, Santa Monica, CA",
                  icon: Icons.fitness_center,
                  onEdit: () {},
                ),
                OtherLocationCard(
                  title: "Parent's Residence",
                  address: "789 Family Road, Pasadena, CA",
                  icon: Icons.family_restroom,
                  onEdit: () {},
                ),
                
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
