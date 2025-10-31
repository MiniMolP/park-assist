import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  TextEditingController textInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  RxList submitData = [].obs;
  RxMap selectedData = {}.obs;
  RxString button = 'Submit'.obs;

  void reset() {
    textInput.clear();
    emailInput.clear();
    submitData.clear();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void handleSubmit(BuildContext context) {
    if (textInput.text.isNotEmpty && emailInput.text.isNotEmpty) {
      if (selectedData.isNotEmpty) {
        button.value = 'Submit';
        for (var s in submitData) {
          if (selectedData['id'] == s['id']) {
            s['name'] = textInput.text;
            s['email'] = emailInput.text;
          }
        }
        selectedData.clear();
      } else {
        submitData.add({
          'id': submitData.length + 1,
          'name': textInput.text,
          'email': emailInput.text,
        });
      }
      submitData.refresh();
      textInput.clear();
      emailInput.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Fill out all the fields'),
          action: SnackBarAction(label: 'close', onPressed: () {}),
        ),
      );
    }
  }

  void editData(data) {
    selectedData.value = data;
    textInput.text = data['name'];
    emailInput.text = data['email'];
    button.value = 'Update';
  }

  void removeData(index) {
    submitData.removeAt(index);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textInput.dispose();
    emailInput.dispose();
  }
}
