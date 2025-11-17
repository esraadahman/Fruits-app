import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ButtonStyleWidget extends StatelessWidget {
  const ButtonStyleWidget({
    super.key,
    required this.height,
    required this.width,
    this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.IconPath,
    this.borderColor,
    this.onTap,
  });

  final Color? buttonColor;
  final Color textColor;
  final String buttonText;
  final String IconPath;
  final Color? borderColor;
  final double height;
  final double width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.015,
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                IconPath,
                fit: BoxFit.contain,
                // height: height * 0.03,
                // width: width * 0.07,
                height: shortestSide * 0.06,
                width: shortestSide * 0.06,
              ),
              size.width(width * 0.03),
              Text(
                buttonText,
                style:
                    TextStyle(color: textColor, fontSize: shortestSide * 0.035),
              )
            ],
          )),
    );
  }
}
