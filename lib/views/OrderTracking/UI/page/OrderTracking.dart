import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/ConfirmStatusWidgets/SubTitle.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/OrderTracking/UI/widget/CancelOrderDialog.dart';
import 'package:fruits_app/views/OrderTracking/UI/widget/timeline_tileWidget.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;

      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          title: "Order Tracking",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              size.height(height * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubTitle(
                    width: width,
                    subtitle: "Your order code: ",
                  ),
                  Text(
                    "#243188",
                    style: TextStyle(
                        fontSize: width * .04,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  )
                ],
              ),
              size.height(height * .01),
              SubTitle(
                width: width,
                subtitle: "3 items - 37.50 KD",
              ),
              size.height(height * .01),
              SubTitle(
                width: width,
                subtitle: "Payment Method : Cash",
              ),
              SizedBox(
                height: height * .6,
                child: TimelineTilewidget(
                  width: width,
                  height: height,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .05,
                    //  vertical: height * .03
                  ),
                  child: Customauthbutton(
                    textColor: AppColors.whiteColor,
                    buttonText: "Confirm",
                    buttonColor: AppColors.button_Color,
                    height: height,
                    width: width,
                    onTap: () {},
                  )),
              size.height(height * .02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .05,
                  //  vertical: height * .03
                ),
                child: Customauthbutton(
                  textColor: AppColors.whiteColor,
                  buttonText: "Cancel Order",
                  buttonColor: AppColors.redColor,
                  height: height,
                  width: width,
                  onTap: () {
                    showCancelOrderDialog(context, width, height);
                  },
                ),
              ),
              size.height(height * .02),
            ],
          ),
        ),
      );
    });
  }
}
