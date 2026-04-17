import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';

// Provider Insights Widget
class ProviderInsights extends StatelessWidget {
  final String responseSpeed;
  final String acceptanceRate;

  const ProviderInsights({
    super.key,
    required this.responseSpeed,
    required this.acceptanceRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFDFE6E3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.insights, size: 16.sp, color: const Color(0xFF2D695A)),
              SizedBox(width: 8.w),
              CustomText(
                text: "PROVIDER INSIGHTS",
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4B5563),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Response Speed",
                      fontSize: 10.sp,
                      color: const Color(0xFF6B7280),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.bolt,
                          size: 14.sp,
                          color: const Color(0xFF2D695A),
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: "< $responseSpeed",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 30.h, color: const Color(0xFFDFE6E3)),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Acceptance Rate",
                      fontSize: 10.sp,
                      color: const Color(0xFF6B7280),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 14.sp,
                          color: const Color(0xFF2D695A),
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: acceptanceRate,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Services Offered Widget
class ServicesOffered extends StatelessWidget {
  final List<String> services;

  const ServicesOffered({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Services Offered",
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF111827),
        ),
        SizedBox(height: 12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(services.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  CustomText(
                    text: "${index + 1}. ",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4B5563),
                  ),
                  CustomText(
                    text: services[index],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF111827),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

// Business Hours Widget
class BusinessHours extends StatelessWidget {
  final Map<String, String> hours;

  const BusinessHours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "Business Hours",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CustomText(
                text: "Open Now",
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2E7D32),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFDFE6E3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: hours.entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: entry.key,
                      fontSize: 12.sp,
                      color: const Color(0xFF6B7280),
                    ),
                    CustomText(
                      text: entry.value,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: entry.value == "Closed"
                          ? const Color(0xFF6B7280)
                          : const Color(0xFF111827),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// Customer Review Card
class CustomerReviewCard extends StatelessWidget {
  final String authorName;
  final String timeText;
  final String content;
  final int rating;
  final String avatarUrl;

  const CustomerReviewCard({
    super.key,
    required this.authorName,
    required this.timeText,
    required this.content,
    required this.rating,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFDFE6E3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: authorName,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                    CustomText(
                      text: timeText,
                      fontSize: 10.sp,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFBBF24),
                    size: 14.sp,
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: content,
            fontSize: 12.sp,
            color: const Color(0xFF4B5563),
            maxLines: 20,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
