import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Customauthbutton extends StatelessWidget {
  const Customauthbutton(
      {super.key,
      this.buttonColor,
      required this.textColor,
      required this.buttonText,
      this.borderColor,
      required this.height,
      required this.width,
      this.onTap});

  final Color? buttonColor;
  final Color textColor;
  final String buttonText;
  final Color? borderColor;
  final double height;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.015,
            ),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: borderColor ?? Colors.transparent),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor,
                  fontSize: width * 0.042,
                  fontWeight: FontWeight.bold),
            )));
  }
}
