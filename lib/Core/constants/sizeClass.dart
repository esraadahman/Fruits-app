//   double screenHight = MediaQuery.of(context).size.height;
// double screenWidth = MediaQuery.of(context).size.width;
import 'package:fruits_app/Core/commonImports/commonImports.dart';

class size {
  static SizedBox height(double height) => SizedBox(
        height: height,
      );
  static SizedBox width(double width) => SizedBox(width: width);
}

double screenWidth(context) => MediaQuery.of(context).size.width;
double screenHight(context) => MediaQuery.of(context).size.height;
