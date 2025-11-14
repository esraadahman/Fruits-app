import 'package:fruits_app/Core/commonImports/commonImports.dart';

class TotalWidget extends StatelessWidget {
  TotalWidget(
      {super.key,
      required this.width,
      required this.nameFiled,
      required this.price,
      required this.pricedistanse,
      this.isBagTotal = false,
      this.moresmall = false});

  final double width;
  final String nameFiled;
  final double price;
  final String pricedistanse;
  bool isBagTotal;
  bool moresmall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameFiled,
            style: TextStyle(
                fontSize: moresmall ? width * .035 : width * .045,
                color: isBagTotal
                    ? AppColors.button_Color
                    : AppColors.grayColor.withOpacity(.5),
                fontWeight: isBagTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Row(
            children: [
              Text(
                price.toString(),
                style: TextStyle(
                    fontSize: moresmall ? width * .035 : width * .045,
                    color: AppColors.text_dark,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                pricedistanse,
                style: TextStyle(
                    fontSize: moresmall ? width * .035 : width * .045,
                    color: isBagTotal
                        ? AppColors.button_Color
                        : AppColors.grayColor.withOpacity(.5),
                    fontWeight:
                        isBagTotal ? FontWeight.bold : FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}
