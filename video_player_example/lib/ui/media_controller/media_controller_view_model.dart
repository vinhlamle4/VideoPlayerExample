import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final mediaControllerViewModelProvider = ChangeNotifierProvider.autoDispose((_) => MediaControllerViewModel());

class MediaControllerViewModel extends ChangeNotifier {

  late VideoPlayerController _controller;
  VideoPlayerController get controller => _controller;

  bool isFullScreen = false;
  bool autoPlay = false;

  double opacityLevel = 1; // use to show and hide media controller

  Timer? timer;

  bool _isVideoPlayerInitialize = false;
  bool get isVideoPlayerInitialize => _isVideoPlayerInitialize;

  initController(VideoPlayerController controller) {
    _controller = controller;
    _isVideoPlayerInitialize = _controller.value.isInitialized;
  }

  bool isPlaying() {
    return _controller.value.isPlaying;
  }

  bool isMute() {
    return _controller.value.volume == 0;
  }

  changeOpacity() {
    timer?.cancel();
    opacityLevel = opacityLevel == 0 ? 1 : 0;
    if(opacityLevel == 1 && isPlaying()) {
      _autoHideMediaController();
    }
    notifyListeners();
  }

  playAndPauseVideo() {
    timer?.cancel();
    if(isPlaying()) {
      _controller.pause();
      opacityLevel = 1;
    } else {
      _controller.play();
      _autoHideMediaController();
    }
    notifyListeners();
  }

  _autoHideMediaController() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      opacityLevel = 0;
      notifyListeners();
      timer.cancel();
    });
  }

  setVolume() {
    if(!isMute()) {
      _controller.setVolume(0);
    } else {
      _controller.setVolume(1);
    }
    notifyListeners();
  }

  setFullScreenMode() async {
    isFullScreen = !isFullScreen;
  }

  setRepeat() {
    _controller.setLooping(!(_controller.value.isLooping));
    notifyListeners();
  }

  setPlayBackSpeed(double speed) {
    _controller.setPlaybackSpeed(speed);
    notifyListeners();
  }

  setVideoPlayerInitialize() {
    _isVideoPlayerInitialize = !_isVideoPlayerInitialize;
    notifyListeners();
  }

  updateUI() {
    notifyListeners();
  }

  clearAllData() {
    isFullScreen = false;
    opacityLevel = 1;
    timer?.cancel();
    timer = null;
    _isVideoPlayerInitialize = false;
  }
}