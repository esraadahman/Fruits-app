import 'package:fruits_app/Core/commonImports/commonImports.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.width,
    required this.maintitle,
    this.color = AppColors.button_Color,
  });

  final double width;
  final String maintitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      maintitle,
      style: TextStyle(
          fontSize: width * .045, fontWeight: FontWeight.bold, color: color),
    );
  }
}
