import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_glossy_examples/app/data/weather_dashboard/weather.dart';

class WeatherDashboardController  extends GetxController {
  final weather = Weather.sample().obs;
  final isLoading = false.obs;
  final particleOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    startParticleAnimation();
  }

  void startParticleAnimation() {
    // Animate particles opacity between 0.0 and 0.5
    ever(particleOpacity, (_) {
      Future.delayed(const Duration(milliseconds: 50), () {
        if (particleOpacity.value >= 0.5) {
          particleOpacity.value = 0.0;
        } else {
          particleOpacity.value += 0.01;
        }
      });
    });

    particleOpacity.value = 0.0;
  }

  Future<void> refreshWeather() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulated API call
    weather.value = Weather.sample();
    isLoading.value = false;
  }

  Color getBackgroundColor() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return Colors.blue.shade900; // Morning
    } else if (hour >= 12 && hour < 18) {
      return Colors.blue.shade700; // Afternoon
    } else {
      return Colors.indigo.shade900; // Evening/Night
    }
  }
}
