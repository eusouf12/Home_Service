import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../../home Screen/widget/provider_navbar.dart';
import '../controller/provider_booking_controller.dart';
import '../widget/active_lead_card.dart';
import '../widget/completed_lead_card.dart';
import '../widget/declined_lead_card.dart';

class ProviderBookingScreen extends StatelessWidget {
  const ProviderBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderBookingController());

    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: "Allneeda Provider",
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
              SizedBox(height: 24.h),
              
              ///==================== Tab Switcher ====================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(40.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Obx(() => Row(
                    children: [
                      _buildTabItem(0, "Active", controller),
                      _buildTabItem(1, "Completed", controller),
                      _buildTabItem(2, "Declined", controller),
                    ],
                  )),
                ),
              ),
              
              Expanded(
                child: Obx(() {
                  switch (controller.selectedTab.value) {
                    case 0:
                      return _buildActiveLeads(controller);
                    case 1:
                      return _buildCompletedLeads(controller);
                    case 2:
                      return _buildDeclinedLeads(controller);
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          child: const ProviderNavBar(currentIndex: 1),
        ),
        extendBody: true,
      ),
    );
  }

  Widget _buildTabItem(int index, String label, ProviderBookingController controller) {
    bool isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E1E4B) : Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: isSelected ? [
              BoxShadow(
                color: const Color(0xFF1E1E4B).withValues(alpha: 0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ] : null,
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveLeads(ProviderBookingController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "New Requests",
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: CustomText(
                  text: "3 Nearby",
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E1E4B),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          ...controller.activeLeads.map((lead) => ActiveLeadCard(lead: lead)).toList(),
          
          SizedBox(height: 24.h),
          ///==================== Map View Card ====================
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1000",
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Tap to view leads on map",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E1E4B),
                ),
              ],
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildCompletedLeads(ProviderBookingController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Completed Leads",
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: CustomText(
                  text: "October 2023",
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E1E4B),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          ...controller.completedLeads.map((lead) => CompletedLeadCard(lead: lead)).toList(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildDeclinedLeads(ProviderBookingController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          CustomText(
            text: "Declined",
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E293B),
          ),
          SizedBox(height: 24.h),
          ...controller.declinedLeads.map((lead) => DeclinedLeadCard(lead: lead)).toList(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
