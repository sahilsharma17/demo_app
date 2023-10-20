import 'package:get/get.dart';

class ButtonController extends GetxController {
  final showWidget2 = false.obs;
  final showWidget3 = false.obs;
  final colorName = ''.obs;
  final lastValidColor = ''.obs; // Store the last valid color
  final lastWidget3Color = ''.obs;


  void toggleWidget2() {
    showWidget2(true);
    showWidget3(false);
    colorName.value = lastValidColor.value; // Set the last valid color for Widget 2
  }

  void toggleWidget3() {
    showWidget2(false);
    showWidget3(true);
  }

  void changeWidget2Color(String newColorName) {
    if (['red', 'green', 'white', 'blue'].contains(newColorName.toLowerCase())) {
      colorName.value = newColorName;
      lastValidColor.value = newColorName; // Store the last valid color
    } else {
      colorName.value = lastValidColor.value; // Revert to the last valid color
    }
  }

}