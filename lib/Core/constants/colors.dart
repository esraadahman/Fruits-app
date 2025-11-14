import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'dart:math';

class AppColors {
  static const Color button_Color = Color(0xFF204F38);
  static const Color title_text = Color(0xFF204F38);
  static const Color facebookBlue = Color(0xFF235C95);
  static const Color whiteColor = Colors.white;

  static const Color CustomColor = Color(0xFF51949F);
  static const Color grayColor = Color(0xFF656565);

  static const Color smallContainer = Color(0xFFDF958F);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color button_Color_dark = Color.fromARGB(255, 17, 63, 41);
  static const Color text_dark = Color(0xFF204F38);
  static const Color redColor = Color(0xFFFF4A4A);

  // Static method to generate random color
  static Color randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // red
      random.nextInt(256), // green
      random.nextInt(256), // blue
    );
  }

  // Optional: softer random color version
  static Color softRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      100 + random.nextInt(156),
      100 + random.nextInt(156),
      100 + random.nextInt(156),
    );
  }

  static const Color greenColor = Color(0xFF00BB1A);
}
