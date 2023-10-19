import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

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

class ButtonController extends GetxController {
  final showWidget2 = false.obs;
  final showWidget3 = false.obs;
  final colorName = ''.obs;

  void toggleWidget2() {
    showWidget2(true);
    showWidget3(false);
    colorName.value = 'white'; // Set the default color for Widget 2
  }

  void toggleWidget3() {
    showWidget2(false);
    showWidget3(true);
    colorName.value = ''; // Reset the color name
  }

  void changeWidget2Color(String newColorName) {
    if (['red', 'green', 'white', 'blue']
        .contains(newColorName.toLowerCase())) {
      colorName.value = newColorName;
    } else {
      colorName.value = '';
    }
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
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
            TextButton(
              onPressed: buttonController.toggleWidget2,
              child: Text('Widget 2'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
            TextButton(
              onPressed: buttonController.toggleWidget3,
              child: Text('Widget 3'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
          child: Container(
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
          ),
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

class Widget3 extends StatelessWidget {
  final ButtonController buttonController = Get.find();

  @override
  Widget build(BuildContext context) {
    final randomColor = buttonController.getRandomColor();

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        color: randomColor,
        child: Center(
          child: Text(
            'Widget 3',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

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
