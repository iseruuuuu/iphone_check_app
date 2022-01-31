import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBar {
  LinearPercentIndicator showBar(double displayPer) {
    return LinearPercentIndicator(
      width: 300,
      lineHeight: 24.0,
      percent: displayPer / 100.0,
      center: Text(
        displayPer.toStringAsFixed(1) + "%",
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
      progressColor: const Color.fromRGBO(114, 137, 218, 0.8),
    );
  }
}
