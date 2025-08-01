import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/ui/movie_player/media_controller/media_controller_view_model.dart';

class PlayBackSpeedItem extends HookConsumerWidget {
  const PlayBackSpeedItem({super.key});

  static const playBackSpeed = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mediaControllerProvider);
    final controller = viewModel.controller;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: playBackSpeed.length,
      itemBuilder: (context, index) {
        final title = '${playBackSpeed[index]}x';
        return Material(
          color: const Color.fromRGBO(27, 27, 27, 1),
          child: InkWell(
            splashColor: Colors.white30,
            child: ListTile(
              onTap: () {
                viewModel.setPlayBackSpeed(playBackSpeed[index].toDouble());
                Navigator.of(context).pop();
              },
              iconColor: Colors.white,
              leading: Visibility(
                  visible: controller.value.playbackSpeed == playBackSpeed[index] ? true : false,
                  maintainState: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  child: const Icon(Icons.check)),
              title: Text(title),
            ),
          ),
        );
      },
    );
  }
}