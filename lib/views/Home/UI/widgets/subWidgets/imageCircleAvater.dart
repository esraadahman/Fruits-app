import 'package:fruits_app/Core/commonImports/commonImports.dart';

class imageCircleAvater extends StatelessWidget {
  const imageCircleAvater({
    super.key,
    required this.width,
    required this.imagePath,
  });

  final double width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width * 0.1,
      backgroundColor: Colors.grey.withOpacity(0.05),
      backgroundImage: AssetImage(
        imagePath,
      ),
    );
  }
}
