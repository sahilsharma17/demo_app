import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'button_controller.dart';
import 'widget1.dart';
import 'widget2.dart';
import 'widget3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: ButtonWidgetApp(),
      ),
    );
  }
}


class ButtonWidgetApp extends StatelessWidget {
  final ButtonController buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Widget1(),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: buttonController.toggleWidget2,
                child: Text('A'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: buttonController.toggleWidget3,
                child: Text('B'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Obx(() {
            if (buttonController.showWidget2.isTrue) {
              return Widget2();
            } else if (buttonController.showWidget3.isTrue) {
              return Widget3();
            }
            return Container();
          }),
        ),
      ],
    );
  }
}




