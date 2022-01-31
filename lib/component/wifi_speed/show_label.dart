import 'package:flutter/material.dart';

Text showLabel(String label, double speed, String unit) {
  String displaySpeed = speed.toStringAsFixed(2);
  return Text(
    '$label Speed: $displaySpeed $unit',
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}
