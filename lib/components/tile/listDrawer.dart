import 'package:flutter/material.dart';

class ListDrawer extends StatelessWidget {
  final Icon icon;
  final String text;
  final void Function()? onTap;
  const ListDrawer({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: Colors.white,
      title: Text(text),
      textColor: Colors.white,
      onTap: onTap,
      tileColor: Color.fromARGB(0, 93, 11, 245),
    );
  }
}