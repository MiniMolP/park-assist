import 'package:get/get.dart';

import '../controllers/slots_controller.dart';

class SlotsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlotsController>(
      () => SlotsController(),
    );
  }
}
