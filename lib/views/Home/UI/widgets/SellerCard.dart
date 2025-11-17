import 'package:fruits_app/Core/commonImports/commonImports.dart';

class SellerCard extends StatelessWidget {
  final String sellerName;
  final String deliveryCharges;
  final String status;
  final String orderName;
  final String distance;
  final double rating;
  final double width;
  final double height;
  final String imagePath;

  const SellerCard({
    super.key,
    required this.sellerName,
    required this.deliveryCharges,
    required this.status,
    required this.orderName,
    required this.distance,
    required this.rating,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.17,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.008, horizontal: width * .02),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            sellerName,
                            style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          size.width(width * .02),
                          Icon(Icons.star,
                              color: Colors.amber, size: width * 0.045)
                        ],
                      ),
                    ),
                    //   size.width(width * .04),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                //    size.height(height * 0.008),

                // Delivery info
                Row(
                  children: [
                    Icon(Icons.delivery_dining,
                        color: Colors.grey, size: width * 0.06),
                    size.width(width * .015),
                    Expanded(
                      child: Text(
                        "Delivery Charges: $deliveryCharges ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: width * 0.03,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                //   size.height(height * 0.02),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Pointwidget(fontsize: width * 0.05),
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
                          size.width(width * .023),
                          Pointwidget(fontsize: width * 0.05),
                          Text(
                            orderName,
                            style: TextStyle(
                              color: AppColors.CustomColor,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          size.width(width * .02),
                          Icon(Icons.location_on,
                              color: Colors.green, size: width * .04),
                        ],
                      )
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
