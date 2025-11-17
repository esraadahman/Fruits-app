import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CheckoutStep2 extends StatelessWidget {
  const CheckoutStep2(
      {super.key,
      required this.nextPage,
      required this.previousPage,
      required this.width,
      required this.height});
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckoutProgress(
                currentStep: 2,
                width: width,
                height: height,
              ),
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
              AddAddressWidget(height: height, width: width),
              size.height(height * .02),
              AddressDetails(
                height: height,
                width: width,
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .05, vertical: height * .03),
            child: Flexible(
              child: Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Continue",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: nextPage,
              ),
            )),
      ],
    );
  }
}
