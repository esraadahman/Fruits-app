import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Pointwidget extends StatelessWidget {
  const Pointwidget({super.key, required this.fontsize});

  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "•",
      style: TextStyle(
        fontSize: fontsize,
        color: Colors.grey,
      ),
    );
  }
}
