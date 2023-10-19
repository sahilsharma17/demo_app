import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Widget1(),
          Row(
            children: [
              // buttons
            ],
          )
        ],
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text("WIDGET 1",
            style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.w100),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Selected Color: ",
                style: TextStyle(fontSize: 20),
                ),
                Text("White",
                style: TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}