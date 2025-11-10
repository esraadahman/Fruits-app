import 'package:fruits_app/Core/commonImports/commonImports.dart';

class categoriesWidget extends StatelessWidget {
  const categoriesWidget({
    super.key,
    required this.height,
    required this.imagepath,
    required this.width,
  });

  final double height;
  final String imagepath;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.09,
      width: width * 0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 3,
            offset: const Offset(0, 6), // moves shadow down
          ),
        ],
      ),
    );
  }
}
