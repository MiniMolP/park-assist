import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxList tasks = [].obs;
  @override
  void onInit() {
    super.onInit();
    initializeTask();
  }

  void initializeTask(){
    tasks.value = [
      {
        'title' : 'Team Meeting 🙌',
        'desc' : 'Group discussion for the new product',
        'time' : '10:00 AM',
        'status' : 'Progress',
        'per' : '48%',
        'color' : Colors.deepPurple
      },
      {
        'title' : 'UI Design ✍',
        'desc' : 'Make the interface to be aesthetic',
        'time' : '11:00 AM',
        'status' : 'Progress',
        'per' : '79%',
        'color' : Colors.redAccent
      }
    ];
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
