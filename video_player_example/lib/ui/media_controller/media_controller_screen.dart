import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/Utils/layout_size.dart';
import 'package:video_player_example/Utils/utils.dart';
import 'package:video_player_example/extension/padding.dart';

import 'item/media_bottom_sheet_item.dart';
import 'media_controller_view_model.dart';

class MediaControllerScreen extends HookConsumerWidget {
  const MediaControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mediaControllerViewModelProvider);
    final themeColor = Theme.of(context).colorScheme;

    return WillPopScope(
      onWillPop: () async {
        if (viewModel.isFullScreen) {
          viewModel.setFullScreenMode();

          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: SystemUiOverlay.values,
          );

          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        }
        Navigator.of(context).pop();
        return false;
      },
      child: animatedWidget(
        viewModel,
        child: Stack(
          children: [
            Container(color: Colors.black54),
            Center(
                child: _buildIconButton(
                    viewModel.isPlaying()
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    () => _onPlayButtonTap(viewModel),
                    themeColor,
                    LayoutSize.sizeIcon80)),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLeftPlayerInformation(viewModel, themeColor),
                    _buildRightPlayerInformation(context, viewModel, themeColor)
                  ],
                ).paddingAll(LayoutSize.sizePadding8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(LayoutSize.borderRadius8),
                  child: VideoProgressIndicator(viewModel.controller,
                      colors: VideoProgressColors(
                        backgroundColor: themeColor.onTertiary,
                        bufferedColor: themeColor.secondary.withOpacity(0.6),
                        playedColor: themeColor.primary,
                      ),
                      allowScrubbing: true,
                      padding: const EdgeInsets.all(0)),
                ).padding(
                    left: LayoutSize.sizePadding12,
                    right: LayoutSize.sizePadding12,
                    bottom: LayoutSize.sizePadding16,
                    top: LayoutSize.sizePadding4)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget animatedWidget(MediaControllerViewModel viewModel,
      {required Widget child}) {
    return AnimatedOpacity(
      opacity: viewModel.opacityLevel,
      duration: const Duration(milliseconds: 200),
      child: InkWell(
          onTap: () {
            viewModel.changeOpacity();
          },
          child: IgnorePointer(
              ignoring: viewModel.opacityLevel == 0 ? true : false,
              child: child)),
    );
  }

  //region Left player information
  Widget _buildLeftPlayerInformation(
      MediaControllerViewModel viewModel, ColorScheme themeColor) {
    return Row(
      children: [
        Icon(
          viewModel.isPlaying() ? Icons.pause : Icons.play_arrow,
          size: LayoutSize.sizeIcon16,
          color: themeColor.onPrimary,
        ),
        const SizedBox(width: LayoutSize.sizeBox8),
        ValueListenableBuilder(
          valueListenable: viewModel.controller,
          builder: (context, VideoPlayerValue value, child) {
            final position = Utils.convertDurationToTime(value.position);
            final duration = Utils.convertDurationToTime(value.duration);
            return Text('$position / $duration',
                style: TextStyle(color: themeColor.onPrimary));
          },
        ),
      ],
    );
  }

  //endregion

  //region Right player information
  Widget _buildRightPlayerInformation(BuildContext context,
      MediaControllerViewModel viewModel, ColorScheme themeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildIconButton(
            viewModel.isMute() ? Icons.volume_off_outlined : Icons.volume_up,
            () => _onVolumeTap(viewModel),
            themeColor),
        const SizedBox(width: LayoutSize.sizeBox28),
        _buildIconButton(Icons.crop_free_outlined,
            () => _onFullScreenTap(context, viewModel, themeColor), themeColor),
        const SizedBox(width: LayoutSize.sizeBox24),
        _buildIconButton(
            Icons.more_vert, () => _onMoreVertTap(context), themeColor),
      ],
    );
  }

  Widget _buildIconButton(
      IconData icon, VoidCallback? onTap, ColorScheme colorScheme,
      [double? iconSize]) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        //splashColor: Colors.black.withOpacity(0.2),
        onTap: onTap,
        child: Icon(
          icon,
          size: iconSize,
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }

  //endregion

  _onPlayButtonTap(MediaControllerViewModel viewModel) {
    viewModel.playAndPauseVideo();
  }

  // set mute and unMute
  _onVolumeTap(MediaControllerViewModel viewModel) {
    viewModel.setVolume();
  }

  //region Toggle full screen mode
  _onFullScreenTap(
    BuildContext context,
    MediaControllerViewModel viewModel,
    ColorScheme themeColor,
  ) {
    viewModel.setFullScreenMode();
    if (viewModel.isFullScreen) {
      _pushToFullScreen(context, viewModel.controller, themeColor);
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      Navigator.of(context).pop();
    }
  }

  _pushToFullScreen(
    BuildContext context,
    VideoPlayerController controller,
    ColorScheme themeColor,
  ) async {
    _onEnterFullScreen(controller);

    final route = PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: Stack(children: [
                      Container(
                        color: themeColor.primary,
                      ),
                      VideoPlayer(controller),
                      const MediaControllerScreen(),
                    ]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    await Navigator.of(
      context,
    ).push(route);

    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
    // SystemChrome.setPreferredOrientations(
    //   DeviceOrientation.values,
    // );
  }

  void _onEnterFullScreen(VideoPlayerController controller) {
    final videoWidth = controller.value.size.width;
    final videoHeight = controller.value.size.height;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final isLandscapeVideo = videoWidth > videoHeight;
    final isPortraitVideo = videoWidth < videoHeight;

    /// Default behavior
    /// Video w > h means we force landscape
    if (isLandscapeVideo) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    /// Video h > w means we force portrait
    else if (isPortraitVideo) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    /// Otherwise if h == w (square video)
    else {
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    }
  }

//endregion

  _onMoreVertTap(BuildContext context) async {
    return await Utils.showBottomSheet(context,
        child: const MediaBottomSheetItem());
  }
}
