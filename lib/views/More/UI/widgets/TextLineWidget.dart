import 'package:fruits_app/Core/commonImports/commonImports.dart';

class TextLineWidget extends StatelessWidget {
  const TextLineWidget({
    super.key,
    required this.width,
    this.text = "Welcome, Fruit Market",
  });

  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: width * 0.05,
        color: AppColors.blackColor,
      ),
    );
  }
}
