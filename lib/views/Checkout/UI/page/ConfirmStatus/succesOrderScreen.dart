import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/ConfirmStatusWidgets/ImageStatus.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/ConfirmStatusWidgets/MainTitle.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/ConfirmStatusWidgets/SubTitle.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/OrderTracking/UI/page/OrderTracking.dart';

class SuccesOrderScreen extends StatelessWidget {
  const SuccesOrderScreen({super.key});

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
              imagePath: "assets/images/success.png",
            ),
            size.height(height * .02),
            MainTitle(
              width: width,
              maintitle: "YOUR ORDER IS CONFIRMED!",
            ),
            size.height(height * .02),
            SubTitle(
              width: width,
              subtitle: "Your order code: #243188",
            ),
            size.height(height * .001),
            SubTitle(
              width: width,
              subtitle: "Thank you for choosing our products!",
            ),
            size.height(height * .07),
            SizedBox(
              width: width * .8,
              child: Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Continue Shopping",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: () {},
              ),
            ),
            size.height(height * .02),
            SizedBox(
              width: width * .8,
              child: Customauthbutton(
                textColor: AppColors.button_Color,
                buttonText: "Track Order",
                buttonColor: AppColors.whiteColor,
                borderColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: () {
                  context.navigateTo(OrderTracking());
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
