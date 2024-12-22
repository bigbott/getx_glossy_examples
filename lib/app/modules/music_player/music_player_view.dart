import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_glossy_examples/app/common/utils/assets_prefix.dart';
import 'package:glossy/glossy.dart';

import 'music_player_controller.dart';

class MusicPlayerView extends GetView<MusicPlayerController> {
  const MusicPlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlossyContainer(
        width: double.infinity,
        height: double.infinity,
        gradient: const GlossyLinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            opacity: 1),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              final maxHeight = constraints.maxHeight;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlossyContainer(
                    height: maxWidth * 0.7,
                    width: maxWidth * 0.7,
                    margin: EdgeInsets.all(maxWidth * 0.05),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.white70, width: 3),
                    opacity: 0.01,
                    image: DecorationImage(
                      image:
                          AssetImage(getAssetsPrefix() + 'images/artist.png'),
                      opacity: 0.4,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(maxWidth * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Song Title',
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Artist Name',
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Player Controls
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GlossyContainer(
                      height: maxHeight * 0.1,
                      width: maxWidth * 0.9,
                      borderRadius: BorderRadius.circular(40),
                      opacity: 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.skip_previous,
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.play_arrow,
                                    color: Colors.white, size: 40),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_next,
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
