import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.width,
    required this.productname,
    required this.price,
    required this.old_price,
  });

  final double width;
  final String productname;
  final String price;
  final String old_price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          productname,
          style: TextStyle(fontSize: width * .055, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " Price",
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: width * .032,
              ),
            ),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                size.width(width * .02),
                Text(
                  old_price,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: width * 0.04,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
