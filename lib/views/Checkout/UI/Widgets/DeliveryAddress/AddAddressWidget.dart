import 'package:fruits_app/Core/commonImports/commonImports.dart';


class AddAddressWidget extends StatelessWidget {
  const AddAddressWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.055,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .01),
        decoration: decorationContainer(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add New Address",
                style: TextStyle(
                    fontSize: width * .042,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.add,
                size: width * .07,
              )
            ]));
  }
}
