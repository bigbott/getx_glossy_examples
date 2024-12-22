import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_glossy_examples/app/modules/common_widgets/glossy_button.dart';
import 'package:getx_glossy_examples/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
           GlossyButton(
              width: 200,
              color: Colors.blueAccent.shade700,
              onPressed: () => Get.toNamed(Routes.MUSIC_PLAYER),
              child: const Text('Open Music Player'),
            ),
            const SizedBox(height: 20),
            GlossyButton(
              width: 200,
              color: Colors.blueAccent.shade700,
              onPressed: () => Get.toNamed(Routes.WEATHER_DASHBOARD),
              child: const Text('Open Weather Dashboard'),
            ),
             const SizedBox(height: 20),
            GlossyButton(
              width: 200,
              color: Colors.blueAccent.shade700,
              onPressed: () => Get.toNamed(Routes.EVENT),
              child: const Text('Open Event invitation'),
            ),
            const SizedBox(height: 20),
            GlossyButton(
              width: 200,
              color: Colors.blueAccent.shade700,
              onPressed: () => Get.toNamed(Routes.OFFICIAL),
              child: const Text('Official example'),
            ),
          ],
        ),
      ),
    );
  }
}
