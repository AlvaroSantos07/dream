import 'package:flutter/cupertino.dart';

class BoxButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const BoxButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromARGB(255, 255, 0, 0)),
        ),
        child: child,
      ),
    );
  }
}