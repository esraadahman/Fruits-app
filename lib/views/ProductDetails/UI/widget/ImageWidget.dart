import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.sale,
  });

  final double width;
  final double height;
  final String imagePath;
  final int sale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      width: width,
      height: height * .3,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.02),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "$sale% Off Discount",
          style: TextStyle(
            color: Colors.black.withOpacity(.5),
            fontSize: width * 0.03,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
