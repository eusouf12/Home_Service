import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/utils/app_colors/app_colors.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import 'package:home_service/view/components/custom_text_field/custom_text_field.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.h, bottom: 10.h),
          child: Row(
            children: [
              // Back Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  margin: EdgeInsets.only(left: 16.w),
                  height: 48.w,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Icon(Icons.arrow_back, color: AppColors.primary, size: 24.sp),
                ),
              ),
              SizedBox(width: 16.w),
              
              // Profile Status
              Stack(
                children: [
                   CircleAvatar(
                     radius: 22.r,
                     backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg'),
                   ),
                   Positioned(
                     bottom: 0,
                     right: 0,
                     child: Container(
                        height: 12.w,
                        width: 12.w,
                        decoration: BoxDecoration(color: const Color(0xFF10B981), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                     ),
                   )
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Dr Sarah", fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                    CustomText(text: "Online", fontSize: 12.sp, color: const Color(0xFF10B981), fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              
              // Action Icons
              Icon(Icons.call_outlined, color: const Color(0xFF475569), size: 24.sp),
              SizedBox(width: 16.w),
              Icon(Icons.info_outline, color: const Color(0xFF475569), size: 24.sp),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  
                  // Today pill
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: CustomText(text: "TODAY", fontSize: 10.sp, fontWeight: FontWeight.w700, color: const Color(0xFF64748B)),
                  ),
                  SizedBox(height: 24.h),
                  
                  // Message 1 (Receiver)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg'),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                              ),
                              child: CustomText(
                                text: "Hello! I've reviewed your latest lab results. Everything looks normal, but I'd like to discuss the Vitamin D levels during our call.",
                                color: const Color(0xFF334155),
                                fontSize: 14.sp,
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            CustomText(text: "10:24 AM", fontSize: 10.sp, color: const Color(0xFF94A3B8)),
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w), // Pad right side 
                    ],
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Message 2 (Sender)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 40.w), // Pad left side
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDEAE6), // Light coral/pinkish
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: CustomText(
                                text: "That sounds good, doctor. Should I prepare any specific questions for the session?",
                                color: const Color(0xFF334155),
                                fontSize: 14.sp,
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomText(text: "10:26 AM", fontSize: 10.sp, color: const Color(0xFF94A3B8)),
                                SizedBox(width: 4.w),
                                Icon(Icons.done_all, color: const Color(0xFFF97316), size: 14.sp), // Double check icon orange
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Message 3 (Receiver with attachment)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const NetworkImage('https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg'),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Please take a look at this summary report before our meeting.",
                                    color: const Color(0xFF334155),
                                    fontSize: 14.sp,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: 16.h),
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(color: const Color(0xFFF1F5F9)),
                                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.w),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFEE2E2), // Light red
                                            borderRadius: BorderRadius.circular(8.r),
                                          ),
                                          child: Icon(Icons.picture_as_pdf, color: const Color(0xFFEF4444), size: 24.sp),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(text: "Lab_Summary_Jan.pdf", fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                                              SizedBox(height: 4.h),
                                              CustomText(text: "1.2 MB", fontSize: 11.sp, color: const Color(0xFF94A3B8)),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.file_download_outlined, color: const Color(0xFF94A3B8), size: 24.sp),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            CustomText(text: "10:28 AM", fontSize: 10.sp, color: const Color(0xFF94A3B8)),
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w), // Pad right side 
                    ],
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Typing indicator
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 44.w), // Align past avatar
                      Container(height: 6.w, width: 6.w, decoration: const BoxDecoration(color: Color(0xFFCBD5E1), shape: BoxShape.circle)),
                      SizedBox(width: 4.w),
                      Container(height: 6.w, width: 6.w, decoration: const BoxDecoration(color: Color(0xFFCBD5E1), shape: BoxShape.circle)),
                      SizedBox(width: 4.w),
                      Container(height: 6.w, width: 6.w, decoration: const BoxDecoration(color: Color(0xFFCBD5E1), shape: BoxShape.circle)),
                      SizedBox(width: 8.w),
                      CustomText(text: "Dr. Sarah is typing...", color: const Color(0xFF94A3B8), fontSize: 11.sp),
                    ],
                  ),
                  
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
          
          // Bottom Input Area
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  // Suggestions Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSuggestionChip("See you then! \u{1F44B}"),
                        SizedBox(width: 8.w),
                        _buildSuggestionChip("Where are you? \u{1F4CD}"),
                        SizedBox(width: 8.w),
                        _buildSuggestionChip("Thanks"),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // Text Field Row
                  Row(
                    children: [
                      // Plus Button
                      Container(
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(Icons.add, color: const Color(0xFF64748B), size: 24.sp),
                      ),
                      SizedBox(width: 12.w),
                      
                      // Message Field
                      Expanded(
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: CustomTextField(
                            hintText: "Type a message...",
                            fillColor: const Color(0xFFF3F4F6),
                            fieldBorderColor: Colors.transparent,
                            contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                            hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
                            fieldBorderRadius: 24.r,
                            suffixIconColor: const Color(0xFF94A3B8),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Icon(Icons.sentiment_satisfied_alt, color: const Color(0xFF94A3B8), size: 22.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      
                      // Send Button
                      Container(
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF97316), // Orange
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(Icons.send, color: Colors.white, size: 20.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomText(text: text, fontSize: 12.sp, color: const Color(0xFF334155), fontWeight: FontWeight.w600),
    );
  }
}
