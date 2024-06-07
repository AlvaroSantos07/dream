import 'package:dream/MainScreen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/loginPage/spaceLogin.dart';


class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 58, 21, 192),
          Colors.black,
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hello(),
            SizedBox(
              height: 20,
            ),
            LoginSpace(),
          ],
        ),
      )),
    );
  }
}

_hello() {
  return Padding(
    padding: EdgeInsets.all(27),
    child: Text(
      "Olá \nDreamer",
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
    ),
  );
}




