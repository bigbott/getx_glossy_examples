import 'package:get/get.dart';

import '../modules/event/event_binding.dart';
import '../modules/event/event_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/music_player/music_player_binding.dart';
import '../modules/music_player/music_player_view.dart';
import '../modules/official/official_binding.dart';
import '../modules/official/official_view.dart';
import '../modules/weather_dashboard/weather_dashboard_binding.dart';
import '../modules/weather_dashboard/weather_dashboard_view.dart';

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
      name: _Paths.MUSIC_PLAYER,
      page: () => const MusicPlayerView(),
      binding: MusicPlayerBinding(),
    ),
    GetPage(
      name: _Paths.WEATHER_DASHBOARD,
      page: () => const WeatherDashboardView(),
      binding: WeatherDashboardBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.OFFICIAL,
      page: () => const OfficialView(),
      binding: OfficialBinding(),
    ),
  ];
}
