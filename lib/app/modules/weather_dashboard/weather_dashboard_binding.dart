import 'package:get/get.dart';

import 'weather_dashboard_controller.dart';

class WeatherDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherDashboardController>(
      () => WeatherDashboardController(),
    );
  }
}
