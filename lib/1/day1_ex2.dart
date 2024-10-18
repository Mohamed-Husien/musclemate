import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class Day1Ex2View extends StatefulWidget {
  const Day1Ex2View({super.key});

  @override
  State<Day1Ex2View> createState() => _Day1Ex2ViewState();
}

class _Day1Ex2ViewState extends State<Day1Ex2View> {
  int remainingSeconds = 15 * 60;
  Timer? timer;
  bool isRunning = false;
  bool isVideoPlaying = false;

  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vid/15.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String get formattedTime {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();
        }
      });
      setState(() {
        isRunning = true;
      });
    }
  }

  void pauseTimer() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
      setState(() {
        isRunning = false;
      });
    }
  }

  void handlePlayPause() {
    if (isRunning || isVideoPlaying) {
      pauseTimer();
      if (_controller.value.isPlaying) {
        _controller.pause();
      }
      setState(() {
        isVideoPlaying = false;
      });
    } else {
      startTimer();
      _controller.play();
      setState(() {
        isVideoPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2'),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVideoInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handlePlayPause,
              child: Text(
                (isRunning || isVideoPlaying)
                    ? 'Pause Video & Timer'
                    : 'Play Video & Timer',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
