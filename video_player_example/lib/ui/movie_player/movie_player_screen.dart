import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/Utils/layout_size.dart';
import 'package:video_player_example/data/model/movie.dart';
import 'package:video_player_example/extension/padding.dart';
import 'package:video_player_example/hook/use_video_player_controller.dart';
import 'package:video_player_example/ui/media_controller/media_controller_screen.dart';
import 'package:video_player_example/ui/media_controller/media_controller_view_model.dart';
import 'package:video_player_example/utils/utils.dart';

class MoviePlayerScreen extends HookConsumerWidget {
  const MoviePlayerScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final appColors = ref.watch(appThemeProvider).appColors;
    final appColors = Theme.of(context).colorScheme;
    final viewModel = ref.read(mediaControllerViewModelProvider);
    final isVideoInitialized = ref.watch(mediaControllerViewModelProvider
        .select((value) => value.isVideoPlayerInitialize));

    final videoController = useVideoController(
      url: movie.sources[0],
      autoPlay: viewModel.autoPlay,
      onInitialCompleted: () {
        viewModel.setVideoPlayerInitialize();
        if (viewModel.autoPlay) {
          viewModel.changeOpacity();
        }
      },
    );

    useMemoized(() {
      viewModel.initController(videoController);
      videoController.addListener(() => checkVideo(videoController, viewModel));
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(movie.title),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: LayoutSize.sizeBox40),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(LayoutSize.borderRadius8),
                child: AspectRatio(
                  aspectRatio: isVideoInitialized
                      ? videoController.value.aspectRatio
                      : Utils.aspectRatio,
                  child: Stack(
                    children: [
                      if (isVideoInitialized) ...[
                        VideoPlayer(videoController),
                        const MediaControllerScreen(),
                      ] else ...[
                        Container(
                          color: appColors.primary,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: appColors.background,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  appColors.tertiary),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ).paddingEdge(const EdgeInsets.symmetric(
                horizontal: LayoutSize.sizePadding16,
                vertical: LayoutSize.sizePadding40)),
            Text(movie.description, textAlign: TextAlign.justify)
                .paddingAll(LayoutSize.sizePadding16),
          ],
        ),
      ),
    );
  }

  void checkVideo(
      VideoPlayerController controller, MediaControllerViewModel viewModel) {
    //Show media when video finished
    if (controller.value.position == controller.value.duration) {
      viewModel.timer?.cancel();
      viewModel.opacityLevel = 1;
      viewModel.updateUI();
    }
  }
}
