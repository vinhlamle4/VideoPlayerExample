import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoController({
  required String url,
  required VoidCallback onInitialCompleted,
  String? package,
  bool autoPlay = false,
  bool looping = false,
}) {
  return use(
    _VideoPlayerControllerHook(
      url: url,
      package: package,
      autoPlay: autoPlay,
      looping: looping,
      onInitialCompleted: onInitialCompleted,
      keys: [url, package, autoPlay, looping],
    ),
  );
}

class _VideoPlayerControllerHook extends Hook<VideoPlayerController> {
  const _VideoPlayerControllerHook({
    required this.url,
    this.package,
    required this.autoPlay,
    required this.looping,
    required this.onInitialCompleted,
    List<Object?>? keys,
  }) : super(keys: keys);

  final String url;
  final String? package;
  final bool autoPlay;
  final bool looping;
  final VoidCallback onInitialCompleted;

  @override
  _VideoPlayerControllerHookState createState() =>
      _VideoPlayerControllerHookState();
}

class _VideoPlayerControllerHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerHook> {
  late final VideoPlayerController _controller =
      VideoPlayerController.network(hook.url);

  @override
  void initHook() {
    _controller.initialize().then((_) {
      debugPrint('video initialized ${_controller.value.isInitialized}');
      hook.onInitialCompleted();
    });
    _controller.setLooping(hook.looping);

    if (hook.autoPlay) {
      _controller.play();
    }
  }

  @override
  VideoPlayerController build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();
}
