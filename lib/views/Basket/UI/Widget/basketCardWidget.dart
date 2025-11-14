import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/decoration.dart';
import 'package:fruits_app/views/Basket/UI/Widget/CountWidget.dart';
import 'package:fruits_app/views/Basket/UI/Widget/SaleWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/subWidgets/imageCircleAvater.dart';

class BasketCardWidget extends StatelessWidget {
  const BasketCardWidget(
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
    return Container(
        height: height * 0.17,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        decoration: decorationContainer(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * .02, left: width * .02),
                    child:
                        imageCircleAvater(width: width, imagePath: imagePath),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * .02, left: width * .05),
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
                          Price_New_old(
                              deliveryCharges: deliveryCharges,
                              width: width,
                              deliveryCharges_old: deliveryCharges_old),
                          size.height(height * .02),
                          if (salePresentage != 0) ...[
                            SaleWidget(
                                width: width,
                                height: height,
                                salePresentage: salePresentage)
                          ]
                        ]),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_forever,
                          size: width * .06,
                        )),
                    CountWidget(width: width, height: height)
                  ],
                ),
              )
            ]));
  }
}

class Price_New_old extends StatelessWidget {
  const Price_New_old({
    super.key,
    required this.deliveryCharges,
    required this.width,
    required this.deliveryCharges_old,
  });

  final String deliveryCharges;
  final double width;
  final String deliveryCharges_old;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$deliveryCharges   ",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: width * 0.03,
            fontWeight: FontWeight.normal,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        size.width(width * .02),
        Text(
          "$deliveryCharges_old",
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: width * 0.03,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
