import 'package:fruits_app/Core/commonImports/commonImports.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({
    super.key,
    required this.width,
    required this.height,
    required this.salePresentage,
  });

  final double width;
  final double height;
  final int salePresentage;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * .02, vertical: height * .01),
        decoration: BoxDecoration(
          color: AppColors.smallContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "Up to $salePresentage% Off",
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
