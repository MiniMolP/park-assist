import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DemoController extends GetxController {
  //TODO: Implement DemoController

  final RxList timeSheet = [].obs;
  final RxList dateSheet = [].obs;
  final RxList currentDay = [].obs;

  @override
  void onInit() {
    initializeTimeSheet();
    initializeDate();
    super.onInit();
  }

  void initializeDate() {
    DateTime present = DateTime.now();
    String formattedDate = DateFormat('EEE').format(present);
    currentDay.add(formattedDate);
    for (int i = 0; i < 7; i++) {
      DateTime future = present.add(Duration(days: i));
      String formattedDate = DateFormat('EEE').format(future);
      String date = DateFormat('d').format(future);
      dateSheet.add({
        'date' : date,
        'day' : formattedDate
      });
    }
    print(dateSheet);
  }

  void initializeTimeSheet() {
    timeSheet.value = [
      {
        'title': 'Wireframe',
        'desc': 'Make some ideation from sketch and wire frames.',
        'time': '10:00 AM',
        'color': Color(0xFFEF6C00),
      },
      {
        'title': 'UI Design',
        'desc': 'Visual design from the wireframe and make design system.',
        'time': '1:30 PM',
        'color': Color(0xFF9575CD),
      },
      {
        'title': 'Prototyping',
        'desc': 'Make the interactive prototype for the testing & stackholders',
        'time': '3:00 PM',
        'color': Color(0xFFFBC02D),
      },
      {
        'title': 'Usability Testing',
        'desc': 'Primary user testing and usability testing of the protype',
        'time': '3:45 PM',
        'color': Color(0xFF81C784),
      },
      {
        'title': 'Meeting',
        'desc': 'Sum up discussion for the new product with stakeholders',
        'time': '4:30 PM',
        'color': Color(0xFFEF6C00),
      },
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
