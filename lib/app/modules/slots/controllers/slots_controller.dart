import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlotsController extends GetxController {
  //TODO: Implement SlotsController

  TextEditingController startingInput = TextEditingController();
  TextEditingController endingInput = TextEditingController();

  RxList submitData = [].obs;
  RxInt selectedSlot = (-1).obs;
  RxBool selectedSlotStatus = false.obs; /*Available means true, Booked means false */
  RxInt confirmedSlot = (-1).obs;

  void slotCreate(BuildContext context) {
    if(startingInput.text.isNotEmpty && endingInput.text.isNotEmpty) {
      final startSlot = int.tryParse(startingInput.text) ?? 0;
      final endSlot = int.tryParse(endingInput.text) ?? 0;

      if (startSlot <= endSlot) {
        for (int i = startSlot; i <= endSlot; i++) {
          submitData.add({
            'slot': i,
            'status': 'Available'
          });
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid range'),
                action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {}
                )
            )
        );
      }
      print(submitData);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fill out all the fields'),
          action: SnackBarAction(
              label: 'Close',
              onPressed: () {}
          )
          )
      );
    }
  }

  void selectSlot(index) {
    selectedSlot.value = index;
  }

  void selectSlotStatus() {
    selectedSlotStatus.value = !selectedSlotStatus.value;
  }

  void confirmSlot(slot) {
    for (var s in submitData){
      if(s['slot'] == slot['slot']){
        /*will enter*/
        s['status'] = selectedSlotStatus.isTrue ? 'Available' : 'Booked';
      }
    }
    submitData.refresh();
    Get.back();
  }

  void reset() {
    startingInput.clear();
    endingInput.clear();
    submitData.clear();
  }

  @override
  void onInit() {
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
