import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final Color color;
  const MyTextButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        height: 10,
        width: 30,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10)),
              ),
      ),
    );
  }
}