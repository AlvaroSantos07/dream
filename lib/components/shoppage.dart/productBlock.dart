import 'package:dream/class/product.dart';
import 'package:dream/class/shop.dart';
import 'package:dream/components/shoppage.dart/shopListViewPc.dart';
import 'package:dream/components/shoppage.dart/shopListViewperi.dart';
import 'package:dream/components/tile/myShopTile.dart';
import 'package:flutter/material.dart';
import '../tile/myShopTile.dart';
import 'shopListViewMon.dart';

class Productblock extends StatelessWidget {
  const Productblock({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(35)
        ),
        child: const Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("   Computadores", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.chevron_right),
                )
              ],
            ),
            SizedBox(height: 400, width: double.infinity, child: MyListViewShop(),),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("   Monitores", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.chevron_right),
                )
              ],
            ),
            
            SizedBox(height:320, width:double.infinity, child:  MyListViewMon()),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("   Perifericos", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.chevron_right),
                )
              ],
            ),
            SizedBox(width:double.infinity, height:340, child: MyListViewPeri()),
            SizedBox(height: 33,)
          ],
        ),
      ),
    );
  }
}