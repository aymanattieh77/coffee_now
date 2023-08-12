import 'dart:async';

import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CountdownTimerWidget extends StatefulWidget {
  final int durationInSeconds;
  final Function() onTimerFinished;

  const CountdownTimerWidget({
    super.key,
    required this.durationInSeconds,
    required this.onTimerFinished,
  });

  @override
  State<StatefulWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationInSeconds;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          widget.onTimerFinished.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextUtils(
      text: '00:$_remainingSeconds',
      color: AppColor.grey7D,
      fontSize: FontSizes.f12,
      tr: false,
    );
  }
}
