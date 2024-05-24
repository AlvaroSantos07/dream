import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color color;
  const RectangleButton({super.key, required this.onTap, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title)
            ],
          ),
        ),
      )
    );
  }
}