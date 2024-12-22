import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glossy/glossy.dart';

import 'official_controller.dart';

class OfficialView extends GetView<OfficialController> {
  const OfficialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Glass Morphism Example'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: (BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(70))),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: (BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(70))),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GlossyContainer(
                  width: 200,
                  height: 200,
                  borderRadius: BorderRadius.circular(12),
                  child: const Center(
                    child: Text(
                      'Glass Morphism',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
