import 'dart:async';

import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:flutter/material.dart';

class TimerCountDown extends StatefulWidget {
  const TimerCountDown({super.key, required this.seconds});
  final int seconds;
  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  late int seconds;
  @override
  void initState() {
    seconds = widget.seconds;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    countdownTimer(() {});

    return TextUtils(
      text: "00:$seconds",
      color: AppColor.greyAA,
      fontWe: FontWe.semiBold,
      tr: false,
    );
  }

  void countdownTimer(Function onTimerFinished) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
        onTimerFinished();
      } else {
        setState(() {});
        seconds--;
      }
    });
  }
}
