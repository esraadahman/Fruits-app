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
      this.iconData,
      this.orientation = Orientation.portrait,
      this.onTap});

  final Color? buttonColor;
  final Color textColor;
  final String buttonText;
  final Color? borderColor;
  final double height;
  final double width;
  final VoidCallback? onTap;
  final IconData? iconData;
  final Orientation orientation;
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
            child: iconData == null
                ? Text(
                    buttonText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: orientation == Orientation.portrait
                            ? width * 0.042
                            : width * 0.025,
                        fontWeight: FontWeight.bold),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconData,
                        size: width * .05,
                        color: textColor,
                      ),
                      size.width(width * .02),
                      Text(
                        buttonText,
                        style: TextStyle(
                            color: textColor,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )));
  }
}
