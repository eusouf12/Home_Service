import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class UploadedItem {
  final File file;
  final bool isDocument;
  UploadedItem({required this.file, this.isDocument = false});
}

class BookingController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  // --- Create Request States ---
  var uploadedFiles = <UploadedItem>[].obs;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  var isFetchingLocation = false.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        uploadedFiles.add(UploadedItem(file: File(image.path), isDocument: false));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<void> pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
      );
      if (result != null && result.files.single.path != null) {
        uploadedFiles.add(UploadedItem(file: File(result.files.single.path!), isDocument: true));
      }
    } catch (e) {
      debugPrint('Error picking document: $e');
    }
  }

  void removeFile(UploadedItem item) {
    uploadedFiles.remove(item);
  }

  Future<void> fetchCurrentLocation() async {
    isFetchingLocation.value = true;
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Error", "Location services are disabled.");
        isFetchingLocation.value = false;
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Error", "Location permissions are denied");
          isFetchingLocation.value = false;
          return;
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Error", "Location permissions are permanently denied, we cannot request permissions.");
        isFetchingLocation.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = "${place.street != null && place.street!.isNotEmpty ? '${place.street}, ' : ''}${place.locality}, ${place.administrativeArea}";
        if (address.startsWith(", ")) address = address.substring(2);
        addressController.text = address;
      }
    } catch (e) {
      debugPrint("Error fetching location: $e");
      Get.snackbar("Error", "Failed to fetch location");
    } finally {
      isFetchingLocation.value = false;
    }
  }
}
