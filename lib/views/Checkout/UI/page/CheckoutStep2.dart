import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CheckoutStep2 extends StatelessWidget {
  const CheckoutStep2(
      {super.key,
      required this.nextPage,
      required this.previousPage,
      required this.width,
      required this.height,
      this.orientation = Orientation.portrait});
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final double width;
  final double height;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .06),
                child: Text(
                  "Select Delivery Address",
                  style: TextStyle(
                      fontSize: width * .043,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              size.height(height * .02),
              Center(
                child: AddAddressWidget(height: height, width: width),
              ),
              size.height(height * .02),
              Center(
                child: AddressDetails(
                  height: orientation == Orientation.portrait
                      ? height
                      : height * 1.2,
                  width:
                      orientation == Orientation.portrait ? width : width * 1.1,
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .03),
              child: Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Continue",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: nextPage,
              )),
        ],
      ),
    );
  }
}
