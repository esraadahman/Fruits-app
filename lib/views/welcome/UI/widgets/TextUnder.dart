import 'package:fruits_app/Core/commonImports/commonImports.dart';

class TextUnder extends StatelessWidget {
  const TextUnder({
    super.key,
    required this.width,
    required this.text,
    required this.buttonText,
    required this.onTap,
  });

  final double width;
  final String text;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(fontSize: width * 0.04)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              color: Colors.blue,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
