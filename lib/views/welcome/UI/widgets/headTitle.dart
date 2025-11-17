import 'package:fruits_app/Core/commonImports/commonImports.dart';

class TitleText extends StatelessWidget {
  TitleText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
 });
  String text;
  double fontSize;
  Color color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
