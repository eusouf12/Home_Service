import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // States for filters
  String selectedCategory = "Plumbing";
  String selectedPrice = "\$";
  double distance = 25.0;
  String selectedRating = "4+";
  bool isVerified = false;
  bool isDiscount = false;
  bool isEmergency = false;

  // Availability States
  String selectedAvailability = "Today";
  bool isThisWeekExpanded = false;
  String selectedDayOfWeek = "";

  final List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: CustomText(
          text: "Filters",
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Service Categories"),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                _buildChip("Plumbing"),
                _buildChip("Electrical"),
                _buildChip("Cleaning"),
                _buildChip("Handyman"),
                _buildChip("Painting"),
                _buildChip("HVAC"),
              ],
            ),
            SizedBox(height: 24.h),

            _buildSectionTitle("Price Range"),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF1F4F7),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                children: [
                  _buildPriceOption("\$"),
                  _buildPriceOption("\$\$"),
                  _buildPriceOption("\$\$\$"),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle("Distance"),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffE8F3F1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: CustomText(
                    text: "Up to ${distance.toInt()} miles",
                    color: const Color(0xff006D5B),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xff006D5B),
                inactiveTrackColor: const Color(0xffD1D9E0),
                thumbColor: Colors.white,
                overlayColor: const Color(0xff006D5B).withOpacity(0.2),
                trackHeight: 6.0,
              ),
              child: Slider(
                value: distance,
                min: 1,
                max: 50,
                onChanged: (value) => setState(() => distance = value),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "1 mi", color: Colors.grey, fontSize: 12.sp),
                CustomText(text: "50 mi", color: Colors.grey, fontSize: 12.sp),
              ],
            ),
            SizedBox(height: 24.h),

            _buildSectionTitle("Provider Rating"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRatingBox("3+"),
                _buildRatingBox("4+"),
                _buildRatingBox("4.5+"),
              ],
            ),
            SizedBox(height: 24.h),

            _buildSectionTitle("Availability"),
            _buildAvailabilityCard(
              "Today",
              Icons.calendar_today_outlined,
              selectedAvailability == "Today",
              onTap: () {
                setState(() {
                  selectedAvailability = "Today";
                  isThisWeekExpanded = false;
                });
              },
            ),
            SizedBox(height: 12.h),
            _buildAvailabilityCard(
              "This Week",
              Icons.calendar_month_outlined,
              selectedAvailability == "This Week",
              subtitle: selectedDayOfWeek.isEmpty ? "Choose Date" : selectedDayOfWeek,
              trailing: Icon(
                isThisWeekExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  selectedAvailability = "This Week";
                  isThisWeekExpanded = !isThisWeekExpanded;
                });
              },
            ),
            if (isThisWeekExpanded)
              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF8FAFB),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xffE6EBEE)),
                ),
                child: Column(
                  children: weekDays.map((day) {
                    bool isSelected = day == selectedDayOfWeek;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDayOfWeek = day;
                          // Optional: Close dropdown after selection
                          // isThisWeekExpanded = false; 
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                        margin: EdgeInsets.only(bottom: 4.h),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xffE8F3F1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: day,
                              color: isSelected ? const Color(0xff006D5B) : const Color(0xff5D6B78),
                              fontSize: 14.sp,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                            if (isSelected)
                              Icon(Icons.check, color: const Color(0xff006D5B), size: 18.sp),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            SizedBox(height: 24.h),

            _buildSectionTitle("Other Filters"),
            _buildToggleItem(
              "Verified Providers",
              Icons.check_circle_outline,
              isVerified,
              (v) => setState(() => isVerified = v),
            ),
            _buildToggleItem(
              "Discounts Available",
              Icons.confirmation_number_outlined,
              isDiscount,
              (v) => setState(() => isDiscount = v),
            ),
            _buildToggleItem(
              "Emergency Service",
              Icons.report_problem_outlined,
              isEmergency,
              (v) => setState(() => isEmergency = v),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
      // apply and clear btn
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.w),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffF1F4F7))),
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {
                  setState(() {
                    selectedCategory = "Plumbing";
                    selectedPrice = "\$";
                    distance = 25.0;
                    selectedRating = "4+";
                    isVerified = false;
                    isDiscount = false;
                    isEmergency = false;
                    selectedAvailability = "Today";
                    isThisWeekExpanded = false;
                    selectedDayOfWeek = "";
                  });
                },
                title: "Clear All",
                fillColor: Colors.transparent,
                textColor: const Color(0xff5D6B78),
                isBorder: true,
                borderColor: const Color(0xffD1D9E0), 
                borderWidth: 1.5, 
                borderRadius: 50.r, 
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 2,
              child: CustomButton(
                onTap: () {},
                title: "Apply Filters",
                fillColor: const Color(0xff006D5B),
                textColor: Colors.white,
                borderRadius: 50.r,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildSectionTitle(String title) {
    return CustomText(
      text: title,
      color: const Color(0xff1A2533),
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      bottom: 16.h,
    );
  }

  Widget _buildChip(String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff006D5B) : const Color(0xffF1F4F7),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: CustomText(
          text: label,
          color: isSelected ? Colors.white : const Color(0xff5D6B78),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPriceOption(String label) {
    bool isSelected = selectedPrice == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPrice = label),
        child: Container(
          margin: EdgeInsets.all(4.w),
          height: 40.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: CustomText(
            text: label,
            color: isSelected
                ? const Color(0xff006D5B)
                : const Color(0xff5D6B78),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBox(String label) {
    bool isSelected = selectedRating == label;
    return GestureDetector(
      onTap: () => setState(() => selectedRating = label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 40.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffE8F3F1) : Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xff006D5B)
                : const Color(0xffF1F4F7),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            CustomText(
              text: label,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            Icon(Icons.star, color: Colors.orange, size: 14.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityCard(
    String title,
    IconData icon,
    bool isSelected, {
    String? subtitle,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xffF8FAFB),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff006D5B)),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  if (subtitle != null)
                    CustomText(
                      text: subtitle,
                      color: Colors.grey,
                      fontSize: 13.sp,
                    ),
                ],
              ),
            ),
            trailing ??
                (isSelected
                    ? const Icon(Icons.check_circle, color: Color(0xff006D5B))
                    : const Icon(Icons.chevron_right, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(
    String title,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xffFFF1F0).withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.redAccent, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomText(
              text: title,
              color: Colors.black,
              textAlign: TextAlign.start,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Checkbox(
            value: value,
            activeColor: const Color(0xff006D5B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (v) => onChanged(v!),
          ),
        ],
      ),
    );
  }
}
