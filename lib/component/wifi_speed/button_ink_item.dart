import 'package:flutter/material.dart';

Ink buttonInkItem = Ink(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(114, 137, 218, 0.7),
        Color.fromRGBO(114, 137, 218, 0.8),
        Color.fromRGBO(114, 137, 218, 1),
      ],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(80.0),
    ),
  ),
  child: Container(
    constraints: const BoxConstraints(
      minWidth: 188.0,
      minHeight: 46.0,
    ),
    alignment: Alignment.center,
    child: const Text(
      'Start Test',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
