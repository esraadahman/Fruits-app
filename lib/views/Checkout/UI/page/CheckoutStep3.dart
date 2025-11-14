import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/Lists.dart';
import 'package:fruits_app/Core/constants/decoration.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Basket/UI/Widget/TotalWidget.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/CheckoutProgress.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/payment/paymentWidget.dart';
import 'package:fruits_app/views/Checkout/UI/page/ConfirmStatus/failOrderScreen.dart';
import 'package:fruits_app/views/Checkout/UI/page/ConfirmStatus/succesOrderScreen.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';

class CheckoutStep3 extends StatelessWidget {
  const CheckoutStep3(
      {super.key,
      required this.previousPage,
      required this.width,
      required this.height});
  final VoidCallback previousPage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckoutProgress(
                    currentStep: 3,
                    width: width,
                    height: height,
                  ),
                  labelText(
                    width: width,
                    labeltext: "Coupon Code",
                  ),
                  CouponWidget(height: height, width: width),
                  size.height(height * .02),
                  labelText(
                    width: width,
                    labeltext: "Order Details",
                  ),
                  size.height(height * .01),
                  TotalWidget(
                    width: width,
                    nameFiled: "Total Items",
                    price: 4,
                    pricedistanse: " Items in cart",
                    moresmall: true,
                  ),
                  size.height(height * .02),
                  TotalWidget(
                    width: width,
                    nameFiled: "Subtotal",
                    price: 200,
                    pricedistanse: " kD",
                    moresmall: true,
                  ),
                  size.height(height * .02),
                  TotalWidget(
                    width: width,
                    nameFiled: "Shipping Charges",
                    price: 1.5,
                    pricedistanse: " kD",
                    moresmall: true,
                  ),
                  size.height(height * .02),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  size.height(height * .02),
                  TotalWidget(
                    width: width,
                    nameFiled: "Bag Total",
                    price: 200,
                    pricedistanse: " km",
                    isBagTotal: true,
                    moresmall: true,
                  ),
                  size.height(height * .02),
                  labelText(
                    width: width,
                    labeltext: "Payment",
                  ),
                  SizedBox(
                    height: height * .27,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return PaymentWidget(
                            width: width,
                            height: height,
                            textTitle: payment[index]["name"],
                            imagePath: payment[index]["image"],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            size.height(height * .02),
                        itemCount: payment.length),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .05, vertical: height * .03),
                  child: Flexible(
                    child: Customauthbutton(
                      textColor: AppColors.whiteColor,
                      buttonText: "Place Order",
                      buttonColor: AppColors.button_Color,
                      height: height,
                      width: width,
                      onTap: () {
                        context.navigateTo(SuccesOrderScreen());
                        //    context.navigateTo(FailOrderScreen());
                      },
                    ),
                  )),
            ])
      ]),
    );
  }
}

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.008, horizontal: width * 0.04),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * .01),
      decoration: decorationContainer(), // your custom decoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TextField takes remaining space

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Do You Have any Coupon Code?",
                hintStyle: TextStyle(
                  fontSize: width * 0.035,
                  color: AppColors.grayColor,
                ),
                border: InputBorder.none, // no border
                isDense: true, // remove extra padding
                contentPadding: EdgeInsets.symmetric(vertical: height * 0.015),
              ),
            ),
          ),

          SizedBox(
            height: height * 0.06,
            width: width * .23,
            child: Customauthbutton(
              textColor: AppColors.whiteColor,
              buttonText: "Apply",
              buttonColor: AppColors.button_Color,
              width: width, // responsive width
              height: height,
              onTap: () {
                //  context.navigateTo(CheckoutStep3());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class labelText extends StatelessWidget {
  const labelText({super.key, required this.width, required this.labeltext});

  final double width;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Text(
        labeltext,
        style: TextStyle(
            fontSize: width * .045,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
