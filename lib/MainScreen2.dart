import 'package:dream/pages/ShopPage.dart';
import 'package:dream/pages/buildPage.dart';
import 'package:dream/pages/cartPage.dart';
import 'package:dream/pages/homePage.dart';
import 'components/buttons/floaty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class MyMainScreen extends StatefulWidget {
  const MyMainScreen({super.key});

  @override
  _MyMainScreenState createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  int currentIndex = 0;
  bool _isVisible = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isVisible = _scrollController.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageList = <Widget>[
      homePage(),
      ShopPage(),
      BuildPage(),
      CartPage(),
      Container()
      
    ];
    
    return Scaffold(
      backgroundColor: Colors.grey[140],
      body: Stack(
        children: [
          pageList[currentIndex],
          FloatyNavyBar(
            opacityAnimation: _isVisible,
        
            barHeight: 70.0,
            iconColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            iconSize: 28.0,
            indicatorColor: Colors.white,
            indicatorHeight: 4,
            indicatorWidth: 14.0,
            items: [
              NavyBarItem(
                icon: Icons.home,
              ),
              NavyBarItem(
                icon: Icons.shopping_bag_outlined,
              ),
              NavyBarItem(
                icon: Icons.computer_outlined,
              ),
              NavyBarItem(
                icon: Icons.shopping_cart_sharp,
              ),
              NavyBarItem(
                icon: Icons.settings_outlined
              )
            ],
            onChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
