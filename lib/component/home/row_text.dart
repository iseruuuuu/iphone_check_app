import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({
    Key? key,
    required this.rightText,
    required this.leftText,
  }) : super(key: key);

  final String rightText;
  final String leftText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            rightText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const Spacer(),
          Text(
            leftText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
