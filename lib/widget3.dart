import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_controller.dart';

class Widget3 extends StatelessWidget {
  final ButtonController buttonController = Get.find();
  final List<String> colorsForWidget2 = ['red', 'green', 'white', 'blue'];

  @override
  Widget build(BuildContext context) {
    // Ensure that Widget 3 does not have the same color as Widget 2.
    String widget3ColorName;

    do {
      widget3ColorName = getRandomColorForWidget3();
    } while (widget3ColorName == buttonController.colorName.value);

    // Update Widget 3 color for next time.
    buttonController.lastWidget3Color.value = widget3ColorName;

    // Get the corresponding color.
    final widget3Color = getColorFromName(widget3ColorName);

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        color: widget3Color,
        child: Center(
          child: Text(
            'Widget 3',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }

  String getRandomColorForWidget3() {
    final randomIndex = Random().nextInt(4); // 4 is the number of color options
    return colorsForWidget2[randomIndex];
  }

  Color getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'white':
        return Colors.white;
      default:
        return const Color.fromARGB(255, 212, 209, 209);
    }
  }
}

