import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class OtherLocationCard extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;
  final VoidCallback onEdit;

  const OtherLocationCard({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(12.r)),
            child: Icon(icon, color: const Color(0xFF1E8267), size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: title, fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                SizedBox(height: 4.h),
                CustomText(text: address, fontSize: 11.sp, color: const Color(0xFF64748B), maxLines: 2, textAlign: TextAlign.start),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(onTap: onEdit, child: Icon(Icons.edit_outlined, color: const Color(0xFF94A3B8), size: 20.sp)),
        ],
      ),
    );
  }
}
