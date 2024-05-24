import 'package:dream/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/buttons/iconButton.dart';
import '../components/homepage/listView.dart';
import '../components/homepage/myAppbar.dart';
import '../components/homepage/myDrawer.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ])
          ),
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(height: 20),
              SizedBox(height: 444, width: double.infinity, child: MyListView()),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
