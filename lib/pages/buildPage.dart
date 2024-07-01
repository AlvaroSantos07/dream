import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  const BuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: Text("Em Breve Você poderá montar seu pc aqui", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}