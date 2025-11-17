import 'package:fruits_app/Core/commonImports/commonImports.dart';

class FailOrderScreen extends StatelessWidget {
  const FailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          title: "Checkout",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.goBack();
                //  context.navigateToEasy(const NavBarSection());
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageStatus(
              width: width,
              height: height,
              imagePath: "assets/images/fail.png",
            ),
            size.height(height * .02),
            MainTitle(
              width: width,
              maintitle: "OPS",
              color: AppColors.redColor,
            ),
            size.height(height * .02),
            SubTitle(
              width: width,
              subtitle: "Error while confirming your payment/order",
            ),
            size.height(height * .2),
            SizedBox(
              width: width * .8,
              child: Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Back",
                buttonColor: AppColors.redColor,
                height: height,
                width: width,
                onTap: () {},
              ),
            ),
          ],
        ),
      );
    });
  }
}
