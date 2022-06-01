import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/Utils/utils.dart';
import 'package:video_player_example/ui/media_controller/media_controller_view_model.dart';

import 'play_back_speed_item.dart';


class MediaBottomSheetItem extends HookConsumerWidget {
  const MediaBottomSheetItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mediaControllerViewModelProvider);
    final controller = viewModel.controller;

    return ListView(
      shrinkWrap: true,
      children: [
        _buildItem(Icons.repeat_one_outlined, 'Loop', controller.value.isLooping ? 'on' : 'off', () {
          viewModel.setRepeat();
          Navigator.of(context).pop();
        }),
        _buildItem(Icons.slow_motion_video_outlined, 'Playback speed', '${controller.value.playbackSpeed}x', () async {
          Navigator.of(context).pop();
          await Utils.showBottomSheet(context, child: const PlayBackSpeedItem());
        })
      ],
    );
  }

  Widget _buildItem(IconData icon, String title, String subTitle, VoidCallback onTap) {
    return Material(
      color: const Color.fromRGBO(27, 27, 27, 1),
      child: InkWell(
        splashColor: Colors.white30,
        child: ListTile(
          onTap: onTap,
          iconColor: Colors.white,
          leading: Icon(icon),
          title: Row(children: [
            Text(title, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 16),
            Text(subTitle, style: const TextStyle(color: Colors.white30))
          ],),
        ),
      ),
    );
  }

}