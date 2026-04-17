import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

class PrimaryLocationCard extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;
  final bool isDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String mapImageUrl;

  const PrimaryLocationCard({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
    this.isDefault = false,
    required this.onEdit,
    required this.onDelete,
    required this.mapImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: Image.network(
                  mapImageUrl,
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (isDefault)
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E8267),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: CustomText(
                      text: "DEFAULT",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: const Color(0xFF1E8267), size: 20.sp),
                        SizedBox(width: 8.w),
                        CustomText(
                          text: title,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onEdit,
                          child: Icon(
                            Icons.edit_outlined,
                            color: const Color(0xFF94A3B8),
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        GestureDetector(
                          onTap: onDelete,
                          child: Icon(
                            Icons.delete_outline,
                            color: const Color(0xFF94A3B8),
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: address,
                  fontSize: 12.sp,
                  color: const Color(0xFF64748B),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
