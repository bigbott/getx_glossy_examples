import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_glossy_examples/app/common/utils/assets_prefix.dart';
import 'package:glossy/glossy.dart';

import 'event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GlossyContainer(
            height: double.infinity,
            width: double.infinity,
            gradient: GlossyLinearGradient(
              opacity: 0.9,
              colors: [
                Colors.black,
                Colors.red.shade900,
                Colors.purple.shade800,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: GlossyContainer(
              height: double.infinity,
              width: double.infinity,
              //opacity: 0.5,
              image: DecorationImage(
                  image: AssetImage(getAssetsPrefix() + 'images/concert.png'),
                  fit: BoxFit.cover,
                  opacity: 0.3),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlossyContainer(
                    width: Get.width - 30,
                    height: 180,
                    opacity: 0.6,
                    borderRadius: BorderRadius.circular(30),
                   border: Border.all(color: Colors.white70, width: 1),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You\'re Invited!',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Join us for an unforgettable evening\nof music and celebration.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GlossyContainer(
                    width: Get.width - 100,
                    height: 120,
                    opacity: 0.6,
                    borderRadius: BorderRadius.circular(30),
                   border: Border.all(color: Colors.white70, width: 1),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Date: January 15, 2024\nTime: 7:00 PM\nLocation: The Grand Hall',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.9),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      // Handle RSVP action
                    },
                    child: Text('RSVP Now'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
