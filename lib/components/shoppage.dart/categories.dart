import 'package:flutter/material.dart';

itemMenu({
  required context,
  required IconData icon,
  required String name,
  /*required void function*/
  bool? isFirst,
}) {
  return Container(
    padding: isFirst != null && isFirst == true ? EdgeInsets.only(right: 10, left:20): EdgeInsets.symmetric(horizontal: 7),
    child: Column(children:[
      Container(
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(20)),
        child: Icon(icon, color: Colors.white,),
      ),
      Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      )
    ]),
  );
}
