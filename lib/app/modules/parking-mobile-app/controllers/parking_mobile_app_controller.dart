import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkingMobileAppController extends GetxController {
  //TODO: Implement ParkingMobileAppController
  RxList zoneSheet = [].obs;
  RxList tasks = [].obs;
  RxList parking = [].obs;
  RxList icon = [].obs;
  Color color = Color(0xFFBDBDBD);
  final colorCheck = (0).obs;
  RxInt bottomNavBar = 0.obs;
  final bottomSheet = (-1).obs;
  RxList specificParkingZone = [].obs;
  final zoneCheck = (2).obs;
  RxList availableZone = [].obs;
  final availableZoneCheck = (-1).obs;
  void initializeZoneSheet() {
    zoneSheet.value = [
      {'title': 'All zones', 'color': Color(0xFFEF6C00)},
      {'title': 'Zone A', 'color': Color(0xFF9575CD)},
      {'title': 'Zone B', 'color': Color(0xFFFBC02D)},
      {'title': 'Zone C', 'color': Color(0xFF81C784)},
      {'title': 'Zone D', 'color': Color(0xFFEF6C00)},
    ];
  }

  void initializeTask() {
    tasks.value = [
      {
        'title': 'Dubai Marina Parking',
        'desc': 'Courtyard Marina View Tower',
        'time': '3.99/hour',
        'color': Colors.white,
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2MJIxQvvE8-FZSvNrAs2a9FstN4cOAxB9SA&s',
        'place': '24 free places',
      },
      {
        'title': 'Jumeirah Parking',
        'desc': 'AI Wasl Road 56, Main Post Tower',
        'time': '5.00/hour',
        'color': Colors.white,
        'image':
            'https://cdn.prod.website-files.com/668737b6ad0ddb362bafd671/6755275052809136ad429c3f_Sandz_Dubai_Parking_Jumeirah%20Beach_1.webp',
        'place': '5 free places',
      },
    ];
  }

  void initializeParking() {
    parking.value = [
      {
        'title': 'Downtown Boulevard',
        'desc': '321 Downtown Bouleward, Business Road',
        'image':
            'https://amyumairblog.wordpress.com/wp-content/uploads/2020/07/img_6967.jpg?w=768',
        'status': 'Closed',
      },
      {
        'title': 'Dubai Mall Parking',
        'desc': 'AI Ohood St. 87',
        'image':
            'https://www.propertyfinder.ae/blog/wp-content/uploads/2023/06/1-42.jpg',
        'status': 'Opened',
      },
    ];
  }

  void bottomIcon() {
    icon.value = [
      {'icon': Icons.home},
      {'icon': Icons.list_alt},
      {'icon': Icons.map},
      {'icon': Icons.person},
    ];
  }

  void initializeSpecificZone() {
    specificParkingZone.value = [
      {'title': 'Zone A', 'color': Color(0xFF9575CD)},
      {'title': 'Zone B', 'color': Color(0xFFFBC02D)},
      {'title': 'Zone C', 'color': Color(0xFF81C784)},
      {'title': 'Zone D', 'color': Color(0xFFEF6C00)},
    ];
  }

  void initializeAvailability() {
    availableZone.value = [
      {'title': '123', 'url': '','status' : 'Available', 'color': Color(0xFF9575CD)},
      {'title': '', 'url': 'https://www.shutterstock.com/image-illustration/top-view-sports-car-260nw-2304928617.jpg','status' : 'Available', 'color': Color(0xFF9575CD)},
      {'title': '125', 'url': '','status' : 'Available', 'color': Color(0xFF9575CD)},
      {'title': '', 'url': 'https://www.shutterstock.com/image-illustration/top-view-sports-car-260nw-2304928617.jpg','status' : 'Available', 'color': Color(0xFF9575CD)},
      {'title': '127', 'url': '','status' : 'Available', 'color': Color(0xFF9575CD)},
      {'title': '128', 'url': '','status' : 'Available', 'color': Color(0xFF9575CD)},
    ];
  }

  void zoneColor(int index) {
    colorCheck.value = index;
  }

  void specificZone(int index) {
    zoneCheck.value = index;
  }

  void availabilityZone(int index) {
    availableZoneCheck.value = index;
    print(index);
  }

  void bottomNav(int index) {
    bottomNavBar.value = index;
  }

  void showBottomSheet(int index) {
    bottomSheet.value = index;
    print(index);
  }

  @override
  void onInit() {
    initializeTask();
    initializeParking();
    initializeZoneSheet();
    bottomIcon();
    initializeSpecificZone();
    initializeAvailability();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}


