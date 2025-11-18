import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';

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
        body: ResponsiveLayout(
            portrait: PortraitOrderTracking(
              width: width,
              height: height,
            ),
            landscape: Column(children: [
              //  size.height(height * .02),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    SizedBox(
                        width: width * 0.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SubTitle(
                                    width: width * .7,
                                    subtitle: "Your order code: ",
                                  ),
                                  Text(
                                    "#243188",
                                    style: TextStyle(
                                        fontSize: width * .03,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor),
                                  )
                                ],
                              ),
                              size.height(height * .01),
                              SubTitle(
                                width: width * .7,
                                subtitle: "3 items - 37.50 KD",
                              ),
                              size.height(height * .01),
                              SubTitle(
                                width: width * .7,
                                subtitle: "Payment Method : Cash",
                              ),
                              size.height(height * .1),
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
                                    width: width * .5,
                                    onTap: () {
                                      context.navigateToAndClearStack(
                                          NavBarSection());
                                    },
                                  )),
                              size.height(height * .02),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * .05,
                                ),
                                child: Customauthbutton(
                                  textColor: AppColors.whiteColor,
                                  buttonText: "Cancel Order",
                                  buttonColor: AppColors.redColor,
                                  height: height,
                                  width: width * .5,
                                  onTap: () {
                                    showCancelOrderDialog(
                                        context, width * .5, height * 2.1);
                                  },
                                ),
                              ),
                            ])),
                    SizedBox(
                      width: width * 0.5,
                      height: height * .7,
                      child: TimelineTilewidget(
                        width: width * .5,
                        height: height,
                      ),
                    )
                  ]))
            ])),
      );
    });
  }
}

class PortraitOrderTracking extends StatelessWidget {
  const PortraitOrderTracking({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
