import 'package:get/get.dart';

import '../controllers/parking_mobile_app_controller.dart';

class ParkingMobileAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParkingMobileAppController>(
      () => ParkingMobileAppController(),
    );
  }
}
