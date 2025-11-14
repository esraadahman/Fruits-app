import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ImageStatus extends StatelessWidget {
  const ImageStatus({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
  });

  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * .2,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
