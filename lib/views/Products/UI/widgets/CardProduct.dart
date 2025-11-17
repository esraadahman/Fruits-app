import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CardProduct extends StatelessWidget {
  const CardProduct(
      {super.key,
      required this.ProductName,
      required this.deliveryCharges,
      required this.deliveryCharges_old,
      required this.salePresentage,
      required this.width,
      required this.height,
      required this.imagePath});

  final String ProductName;
  final String deliveryCharges;

  final String deliveryCharges_old;
  final int salePresentage;
  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final isPriceUponSelection = deliveryCharges == "Price Upon Selection";
    return Container(
        height: height * 0.17,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        padding: EdgeInsets.all(width * 0.035),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          imageCircleAvater(width: width, imagePath: imagePath),
          size.width(width * 0.04),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  ProductName,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                size.height(height * .01),
                Row(
                  children: [
                    Text(
                      isPriceUponSelection
                          ? deliveryCharges
                          : "Delivery : $deliveryCharges",
                      style: TextStyle(
                        color: isPriceUponSelection
                            ? AppColors.redColor
                            : Colors.grey.shade700,
                        fontSize: width * 0.03,
                        fontWeight: isPriceUponSelection
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (!isPriceUponSelection) ...[
                      size.width(width * .02),
                      Text(
                        "to $deliveryCharges_old min",
                        style: TextStyle(
                          color: AppColors.lightGray,
                          fontSize: width * 0.03,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                size.height(height * .02),
                SaleWidget(
                    width: width,
                    height: height,
                    salePresentage: salePresentage)
              ])),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: CircleAvatar(
                radius: width * .06,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/Card.png",
                ),
              ),
            ),
          )
        ]));
  }
}
