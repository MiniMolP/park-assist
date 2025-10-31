import 'package:get/get.dart';

import '../modules/demo/bindings/demo_binding.dart';
import '../modules/demo/views/demo_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginScreen/bindings/login_screen_binding.dart';
import '../modules/loginScreen/views/login_screen_view.dart';
import '../modules/parking-mobile-app/bindings/parking_mobile_app_binding.dart';
import '../modules/parking-mobile-app/views/parking_mobile_app_view.dart';
import '../modules/slots/bindings/slots_binding.dart';
import '../modules/slots/views/slots_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DEMO,
      page: () => const DemoView(),
      binding: DemoBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.PARKING_MOBILE_APP,
      page: () => const ParkingMobileAppView(),
      binding: ParkingMobileAppBinding(),
    ),
    GetPage(
      name: _Paths.SLOTS,
      page: () => const SlotsView(),
      binding: SlotsBinding(),
    ),
  ];
}
