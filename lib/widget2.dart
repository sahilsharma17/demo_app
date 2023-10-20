import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_controller.dart';

class Widget2 extends StatelessWidget {
  final ButtonController buttonController = Get.find();
  final TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    colorController.text = buttonController.colorName.value; // Set the initial text

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Obx(() {
            return Container(
              padding: EdgeInsets.all(16),
              color: getColorFromName(buttonController.colorName.value),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Widget 2',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextField(
                      controller: colorController,
                      onChanged: (newColorName) {
                        buttonController.changeWidget2Color(newColorName);
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter a color name (red, green, white, blue)',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
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
