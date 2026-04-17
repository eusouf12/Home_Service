import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/view/components/custom_gradient/custom_gradient.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF334155)),
            onPressed: () => Get.back(),
          ),
          title: CustomText(text: "Payment History", fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)]),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(8.r)),
                    child: Icon(Icons.water_drop, color: Colors.blue, size: 20.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Plumbing Service", fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                        SizedBox(height: 4.h),
                        CustomText(text: "Completed • 10 Apr 2025", fontSize: 11.sp, color: const Color(0xFF94A3B8)),
                      ],
                    ),
                  ),
                  CustomText(text: "\$120.00", fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF10B981)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
