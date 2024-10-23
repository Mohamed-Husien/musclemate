import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RunningLengthView extends StatefulWidget {
  final double height;
  const RunningLengthView({super.key, required this.height});

  @override
  State<RunningLengthView> createState() => _RunningLengthViewState();
}

class _RunningLengthViewState extends State<RunningLengthView> {
  final ValueNotifier<double> metersValueNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> progressNotifier = ValueNotifier<double>(0.0);
  late StreamSubscription<StepCount> _stepCountSubscription;
  int steps = 0;
  double stepLengthInMeters = 0.8;
  final int maxMeters = 10000;

  @override
  void initState() {
    super.initState();
    _requestPermissionAndStartTracking();
  }

  Future<void> _requestPermissionAndStartTracking() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _startStepTracking();
    } else {
      print('Permission denied.');
    }
  }

  void _startStepTracking() {
    _stepCountSubscription = Pedometer.stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountError,
    );
  }

  void _onStepCount(StepCount event) {
    setState(() {
      steps = event.steps;
      double metersWalked = steps * stepLengthInMeters;
      metersValueNotifier.value = metersWalked;

      double progress = (metersWalked / maxMeters) * 100;
      if (progress > 100) progress = 100;
      progressNotifier.value = progress;
    });
  }

  void _onStepCountError(error) {
    print("Pedometer Error: $error");
  }

  @override
  void dispose() {
    _stepCountSubscription.cancel();
    metersValueNotifier.dispose();
    progressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    S.of(context).lenght,
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        ValueListenableBuilder<double>(
                          valueListenable: metersValueNotifier,
                          builder: (context, value, child) {
                            return Text(
                              value.toStringAsFixed(0),
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 59,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                        Text(
                          S.of(context).meters,
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: progressNotifier,
                      builder: (context, progress, child) {
                        return SimpleCircularProgressBar(
                          size: media.width * 0.65,
                          mergeMode: true,
                          animationDuration: 1,
                          backColor: const Color(0xffE6E6E6),
                          progressColors: [TColor.kPrimaryColor],
                          progressStrokeWidth: 15,
                          backStrokeWidth: 15,
                          startAngle: 0,
                          valueNotifier: progressNotifier,
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    S.of(context).max_daily_meters(maxMeters),
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).steps_walked(steps),
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
