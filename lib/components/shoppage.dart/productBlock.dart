import 'package:flutter/material.dart';

class Productblock extends StatelessWidget {
  const Productblock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(35)
      ),
      child: Column(
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
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.chevron_right),
              )
            ],
          )
        ],
      ),
    );
  }
}