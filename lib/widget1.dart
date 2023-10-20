import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_controller.dart';

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonController buttonController = Get.find();
    final selectedColor = buttonController.colorName.value;

    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "WIDGET 1",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                    return Text(
                      'Selected Color: ${buttonController.colorName.value}',
                      style: TextStyle(fontSize: 20),
                    );
                  }),
              ],
            ),
            ],
        ),
      ),
    );
  }
}