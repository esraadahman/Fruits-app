import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
          orientation: deviceInfo.orientation,
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
                    width: deviceInfo.orientation == Orientation.portrait
                        ? width
                        : width * .6,
                    subtitle: "Your order code: ",
                  ),
                  Text(
                    "#243188",
                    style: TextStyle(
                        fontSize: deviceInfo.orientation == Orientation.portrait
                            ? width * .04
                            : width * .02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  )
                ],
              ),
              size.height(height * .01),
              SubTitle(
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
                subtitle: "3 items - 37.50 KD",
              ),
              size.height(height * .01),
              SubTitle(
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
                subtitle: "Payment Method : Cash",
              ),
              SizedBox(
                height: height * .6,
                child: TimelineTilewidget(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .6,
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
                    width: deviceInfo.orientation == Orientation.portrait
                        ? width
                        : width * .6,
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
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .6,
                  onTap: () {
                    showCancelOrderDialog(
                        context,
                        deviceInfo.orientation == Orientation.portrait
                            ? width
                            : width * .6,
                        deviceInfo.orientation == Orientation.portrait
                            ? height
                            : height * 2.5);
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
