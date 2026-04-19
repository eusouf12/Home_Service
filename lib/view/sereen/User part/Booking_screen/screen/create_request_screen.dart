import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_service/core/app_routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home_service/view/components/custom_button/custom_button.dart';
import 'package:home_service/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:home_service/view/components/custom_text/custom_text.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../controller/booking_controller.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final Color deepGreen = const Color(0xFF2D695A);
  final Color bgColor = const Color(0xFFF3F6F8);

  // States
  String selectedIssue = "Leak";
  String selectedLocation = "Kitchen";
  String selectedSeverity = "Major";
  String selectedProperty = "House";
  String selectedServiceTime = "Today Afternoon";
  String selectedContact = "In-app Messaging";
  String selectedDate = "12";
  String selectedAmPm = "PM";
  String selectedTime = "2:00 PM";
  String budgetType = "Fixed Price";

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: "Create Request"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Issue Type
            _buildNumberedHeader("1", "Issue Type"),
            SizedBox(height: 16.h),
            _buildWrapChips(
              ["Leak", "Clog", "Toilet", "Water heater", "Faucet", "Other"],
              selectedIssue,
              (val) => setState(() => selectedIssue = val),
            ),
            SizedBox(height: 24.h),

            // 2. Where is the problem?
            _buildNumberedHeader("2", "Where is the problem?"),
            SizedBox(height: 16.h),
            _buildLocationGrid(),
            SizedBox(height: 24.h),

            // 3. Severity
            _buildNumberedHeader("3", "Severity"),
            SizedBox(height: 16.h),
            _buildSeverityOption("Minor", "When day you normally always do"),
            _buildSeverityOption(
              "Major",
              "Does flow required urgent attention",
            ),
            _buildSeverityOption(
              "Flooding",
              "Emergency situation, asture action always",
              isRed: true,
            ),
            SizedBox(height: 24.h),

            // Describe problem
            _buildSimpleHeader("Describe your problem"),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Please provide as much detail as possible...",
                  hintStyle: TextStyle(
                    color: const Color(0xFF9CA3AF),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Upload photos
            _buildSimpleHeader("Upload photos"),
            SizedBox(height: 12.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPhotoUploadOption(
                      Icons.camera_alt_outlined,
                      "Camera",
                      () => controller.pickImage(ImageSource.camera),
                    ),
                    SizedBox(width: 12.w),
                    _buildPhotoUploadOption(
                      Icons.photo_library_outlined,
                      "Gallery",
                      () => controller.pickImage(ImageSource.gallery),
                    ),
                    SizedBox(width: 12.w),
                    _buildPhotoUploadOption(
                      Icons.description_outlined,
                      "Document",
                      controller.pickDocument,
                    ),

                    // Render uploaded items
                    ...controller.uploadedFiles.map((item) {
                      return Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: item.isDocument
                                  ? Container(
                                      height: 60.w,
                                      width: 60.w,
                                      color: Colors.grey.shade200,
                                      child: Icon(
                                        Icons.insert_drive_file,
                                        color: deepGreen,
                                        size: 24.sp,
                                      ),
                                    )
                                  : Image.file(
                                      item.file,
                                      height: 60.w,
                                      width: 60.w,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                              right: -6,
                              top: -6,
                              child: GestureDetector(
                                onTap: () => controller.removeFile(item),
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Property Type
            _buildSimpleHeader("Property Type"),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: ["House", "Apartment", "Commercial"].map((type) {
                  bool isSelected = selectedProperty == type;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedProperty = type),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                  ),
                                ]
                              : [],
                        ),
                        alignment: Alignment.center,
                        child: CustomText(
                          text: type,
                          color: isSelected
                              ? deepGreen
                              : const Color(0xFF6B7280),
                          fontSize: 13.sp,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.h),

            // When do you need service?
            _buildSimpleHeader("When do you need service?"),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: [
                _buildServiceTimeChip("Emergency", isEmergency: true),
                _buildServiceTimeChip("Today Afternoon"),
                _buildServiceTimeChip("1-3 days"),
                _buildServiceTimeChip("Flexible"),
                _buildServiceTimeChip("Today Evening"),
                _buildServiceTimeChip("Today Morning"),
                _buildServiceTimeChip("Any time"),
              ],
            ),
            SizedBox(height: 24.h),

            // Service Address
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSimpleHeader("Service Address"),
                GestureDetector(
                  onTap: () => controller.fetchCurrentLocation(),
                  child: Row(
                    children: [
                      Obx(
                        () => controller.isFetchingLocation.value
                            ? SizedBox(
                                height: 14.sp,
                                width: 14.sp,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: deepGreen,
                                ),
                              )
                            : Icon(
                                Icons.location_on_outlined,
                                color: deepGreen,
                                size: 14.sp,
                              ),
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Current Location",
                        color: deepGreen,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: const Color(0xFF9CA3AF),
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextFormField(
                      controller: controller.addressController,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF111827),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter service address...",
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Contact Preference
            _buildSimpleHeader("Contact Preference"),
            SizedBox(height: 12.h),
            _buildContactOption(Icons.chat_bubble_outline, "In-app Messaging"),
            _buildContactOption(Icons.message_outlined, "Text Message"),
            _buildContactOption(Icons.phone_outlined, "Voice Call"),
            SizedBox(height: 24.h),

            // 5. Preferred Schedule
            _buildNumberedHeader("5", "Preferred Schedule"),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateBox("NOV", "12"),
                _buildDateBox("TUE", "13"),
                _buildDateBox("WED", "14"),
                _buildDateBox("THU", "15"),
                _buildDateBox("FRI", "16"),
              ],
            ),
            SizedBox(height: 16.h),
            Center(
              child: Container(
                width: 180.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  children: ["AM", "PM"].map((amPm) {
                    bool isSelected = selectedAmPm == amPm;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedAmPm = amPm),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected ? deepGreen : Colors.transparent,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            text: amPm,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF111827),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              alignment: WrapAlignment.center,
              children: ["1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM"]
                  .map((time) {
                    bool isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () => setState(() => selectedTime = time),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? deepGreen : Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: isSelected
                                ? deepGreen
                                : const Color(0xFFE5E7EB),
                          ),
                        ),
                        child: CustomText(
                          text: time,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF6B7280),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  })
                  .toList(),
            ),
            SizedBox(height: 24.h),

            // 6. What's your budget
            _buildNumberedHeader("6", "What's your budget ?"),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      children: ["Fixed Price", "Hourly Rate"].map((type) {
                        bool isSelected = budgetType == type;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => budgetType = type),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? deepGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              alignment: Alignment.center,
                              child: CustomText(
                                text: type,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF6B7280),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            CustomText(
                              text: "\$",
                              color: deepGreen,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 8.w),
                            SizedBox(
                              width: 60.w,
                              child: TextFormField(
                                controller: controller.budgetController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF111827),
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "150",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomText(
                          text: "Estimated average for this service",
                          fontSize: 11.sp,
                          color: const Color(0xFF9CA3AF),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Submit Button
            CustomButton(
              height: 56.h,
              title: "Submit Request",
              fillColor: deepGreen,
              textColor: Colors.white,
              borderRadius: 25.r,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              isImageRight: true,
              imageSrc: AppIcons.arrow,
              onTap: () {
                Get.toNamed(AppRoutes.createBookingCompletedScreen);
              },
            ),
            SizedBox(height: 16.h),
            Center(
              child: CustomText(
                text:
                    "By submitting, you agree to Allmedia's Terms of\nService and Privacy Policy.",
                fontSize: 11.sp,
                color: const Color(0xFF9CA3AF),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedHeader(String number, String title) {
    return Row(
      children: [
        Container(
          height: 24.w,
          width: 24.w,
          decoration: BoxDecoration(
            color: deepGreen.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: number,
            color: deepGreen,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8.w),
        CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF101828),
        ),
      ],
    );
  }

  Widget _buildSimpleHeader(String title) {
    return CustomText(
      text: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF111827),
    );
  }

  Widget _buildWrapChips(
    List<String> items,
    String selectedValue,
    Function(String) onSelect,
  ) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: items.map((item) {
        bool isSelected = selectedValue == item;
        return GestureDetector(
          onTap: () => onSelect(item),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected ? deepGreen : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? deepGreen : const Color(0xFFE5E7EB),
              ),
            ),
            child: CustomText(
              text: item,
              color: isSelected ? Colors.white : const Color(0xFF6B7280),
              fontSize: 13.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLocationGrid() {
    List<Map<String, dynamic>> items = [
      {"icon": Icons.kitchen_outlined, "title": "Kitchen"},
      {"icon": Icons.bathtub_outlined, "title": "Bathroom"},
      {"icon": Icons.home_work_outlined, "title": "Basement"},
      {"icon": Icons.park_outlined, "title": "Outside"},
      {"icon": Icons.bed_outlined, "title": "Bedroom"},
      {"icon": Icons.more_horiz, "title": "Others"},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 2.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedLocation == items[index]["title"];
        return GestureDetector(
          onTap: () => setState(() => selectedLocation = items[index]["title"]),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                color: isSelected ? deepGreen : const Color(0xFFE5E7EB),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[index]["icon"],
                  color: isSelected ? deepGreen : const Color(0xFF6B7280),
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: items[index]["title"],
                  color: isSelected ? deepGreen : const Color(0xFF6B7280),
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSeverityOption(
    String title,
    String subtitle, {
    bool isRed = false,
  }) {
    bool isSelected = selectedSeverity == title;
    return GestureDetector(
      onTap: () => setState(() => selectedSeverity = title),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: isSelected ? deepGreen : const Color(0xFFE5E7EB),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? deepGreen : const Color(0xFFD1D5DB),
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    color: isRed
                        ? const Color(0xFFEF4444)
                        : (isSelected ? deepGreen : const Color(0xFF111827)),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: subtitle,
                    color: const Color(0xFF9CA3AF),
                    fontSize: 11.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUploadOption(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.w,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: CustomPaint(
              painter: _DashedCirclePainter(color: deepGreen),
              child: Center(
                child: Icon(icon, color: deepGreen, size: 24.sp),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          CustomText(
            text: title,
            fontSize: 10.sp,
            color: const Color(0xFF6B7280),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTimeChip(String title, {bool isEmergency = false}) {
    bool isSelected = selectedServiceTime == title;
    return GestureDetector(
      onTap: () => setState(() => selectedServiceTime = title),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isEmergency
              ? const Color(0xFFFFEBEE)
              : (isSelected ? deepGreen.withValues(alpha: 0.1) : Colors.white),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isEmergency
                ? const Color(0xFFFFEBEE)
                : (isSelected ? deepGreen : const Color(0xFFE5E7EB)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isEmergency) ...[
              Icon(
                Icons.warning_amber_rounded,
                color: const Color(0xFFEF4444),
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
            ],
            CustomText(
              text: title,
              color: isEmergency
                  ? const Color(0xFFEF4444)
                  : (isSelected ? deepGreen : const Color(0xFF6B7280)),
              fontSize: 12.sp,
              fontWeight: isSelected || isEmergency
                  ? FontWeight.bold
                  : FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption(IconData icon, String title) {
    bool isSelected = selectedContact == title;
    return GestureDetector(
      onTap: () => setState(() => selectedContact = title),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: isSelected ? deepGreen : const Color(0xFFE5E7EB),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF6B7280), size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomText(
                text: title,
                color: const Color(0xFF111827),
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? deepGreen : const Color(0xFFD1D5DB),
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String day, String num) {
    bool isSelected = selectedDate == num;
    return GestureDetector(
      onTap: () => setState(() => selectedDate = num),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? deepGreen : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomText(
              text: day,
              color: isSelected ? Colors.white70 : const Color(0xFF9CA3AF),
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: num,
              color: isSelected ? Colors.white : const Color(0xFF111827),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  _DashedCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    // A very simple dashed implementation using path metrics
    for (var metric in path.computeMetrics()) {
      double dashWidth = 5.0;
      double dashSpace = 4.0;
      double distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
