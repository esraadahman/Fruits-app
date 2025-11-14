import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Home/UI/widgets/subWidgets/imageCircleAvater.dart';
import 'package:fruits_app/views/Home/UI/widgets/subWidgets/pointWidget.dart';

class SellerCardProduct extends StatelessWidget {
  const SellerCardProduct(
      {super.key,
      required this.sellerName,
      required this.deliveryCharges,
      required this.status,
      required this.orderName,
      required this.time,
      required this.rating,
      required this.width,
      required this.height,
      required this.imagePath});
  final String sellerName;
  final String deliveryCharges;
  final String status;
  final String orderName;
  final String time;
  final double rating;
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageCircleAvater(width: width, imagePath: imagePath),
          size.width(width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sellerName,
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(Icons.star, color: Colors.amber, size: width * 0.05),
                  ],
                ),
                size.height(height * 0.008),
                Text(
                  "Delivery : $deliveryCharges  to $time min",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: width * 0.03,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                //   size.height(height * 0.02),

                Expanded(
                  child: Row(
                    children: [
                      Pointwidget(fontsize: width * 0.05),
                      size.width(width * .01),
                      Text(
                        status,
                        style: TextStyle(
                          color: status.toLowerCase() == "open"
                              ? const Color.fromARGB(255, 39, 213, 45)
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                        ),
                      ),
                      size.width(width * .03),
                      Pointwidget(fontsize: width * 0.05),
                      size.width(width * .01),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: width * .04,
                            color: Colors.black.withOpacity(.3),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
