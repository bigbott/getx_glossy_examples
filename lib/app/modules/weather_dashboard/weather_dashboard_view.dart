import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:get/get.dart';

import 'weather_dashboard_controller.dart';

class WeatherDashboardView extends GetView<WeatherDashboardController> {
  const WeatherDashboardView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  LayoutBuilder(
        builder: (context, constraints) => GlossyContainer(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          gradient: GlossyLinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            opacity: 0.9,
            colors: [
              controller.getBackgroundColor(),
              Colors.black,
            ],
          ),
        child: Stack(
          children: [
            // Weather particles
            WeatherParticles(opacity: controller.particleOpacity.value),
            
            // Main content
            RefreshIndicator(
              onRefresh: controller.refreshWeather,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 40),
                  _buildTemperatureDisplay(),
                  const SizedBox(height: 30),
                  _buildWeatherCondition(),
                  const SizedBox(height: 30),
                  _buildWeatherDetails(),
                ],
              ),
            ),
            
            // Loading indicator
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      )),
    );
  }

  Widget _buildTemperatureDisplay() {
    return GlossyContainer(
      width: double.infinity,
      height: 200,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white.withOpacity(0.15),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              '${controller.weather.value.temperature.toStringAsFixed(1)}°',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              controller.weather.value.condition,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherCondition() {
    return GlossyContainer(
      width: double.infinity,
      height: 100,
      borderRadius: BorderRadius.circular(20),
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildWeatherIcon(),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                _getWeatherDescription(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherIcon() {
    return GlossyContainer(
      width: 50,
      height: 50,
      borderRadius: BorderRadius.circular(40),
      color: Colors.blue.withOpacity(0.3),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Icon(
          Icons.cloud,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildWeatherDetails() {
    return Column(
      children: [
        _buildDetailRow(
          'Humidity',
          '${controller.weather.value.humidity}%',
          Icons.water_drop,
        ),
        const SizedBox(height: 15),
        _buildDetailRow(
          'Wind Speed',
          '${controller.weather.value.windSpeed} m/s',
          Icons.air,
        ),
        const SizedBox(height: 15),
        _buildDetailRow(
          'Pressure',
          '${controller.weather.value.pressure} hPa',
          Icons.speed,
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return GlossyContainer(
      width: double.infinity,
      height: 60,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 15),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getWeatherDescription() {
    final condition = controller.weather.value.condition.toLowerCase();
    if (condition.contains('rain')) {
      return 'Light rain showers expected throughout the day';
    } else if (condition.contains('cloud')) {
      return 'Partly cloudy with occasional clear spells';
    }
    return 'Clear skies and pleasant weather conditions';
  }
}

class WeatherParticles extends StatelessWidget {
  final double opacity;

  const WeatherParticles({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: CustomPaint(
        size: Size.infinite,
        painter: ParticlePainter(),
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final random = Random();
    for (var i = 0; i < 100; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}