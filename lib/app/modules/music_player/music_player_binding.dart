import 'package:get/get.dart';

import 'music_player_controller.dart';

class MusicPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicPlayerController>(
      () => MusicPlayerController(),
    );
  }
}
