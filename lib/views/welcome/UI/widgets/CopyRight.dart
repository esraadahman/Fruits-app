import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey,
            fontSize: width * 0.035,
          ),
          children: [
            const TextSpan(text: "By continue you agree to our "),
            TextSpan(
              text: "Terms of service",
              style: const TextStyle(color: Colors.blue),
            ),
            const TextSpan(text: " and our "),
            TextSpan(
              text: "Privacy Policy",
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ));
  }
}
