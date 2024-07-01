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
                Theme.of(context).colorScheme.onPrimary,
                Theme.of(context).colorScheme.onPrimary,
                Theme.of(context).colorScheme.onInverseSurface,
              ])),
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "   Destaques:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
              SizedBox(
                  height: 444, width: double.infinity, child: MyListView()),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
