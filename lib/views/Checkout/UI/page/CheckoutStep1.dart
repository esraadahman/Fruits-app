import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CheckoutStep1 extends StatelessWidget {
  const CheckoutStep1(
      {super.key,
      required this.nextPage,
      required this.width,
      required this.height});
  final VoidCallback nextPage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CheckoutProgress(
              currentStep: 1,
              width: width,
              height: height,
            ),
            NowRow(
              width: width,
              height: height,
              textTitle: "Now",
            ),
            size.height(height * .02),
            SelectDate(height: height, width: width),
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
              onTap: nextPage),
        ),
      ],
    );
  }
}
