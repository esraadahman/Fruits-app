import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/Lists.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Basket/UI/Widget/CheckoutRow.dart';
import 'package:fruits_app/views/Basket/UI/Widget/DashedLine.dart';
import 'package:fruits_app/views/Basket/UI/Widget/TotalWidget.dart';
import 'package:fruits_app/views/Basket/UI/Widget/basketCardWidget.dart';
import 'package:fruits_app/views/Checkout/UI/page/CheckoutScreen.dart';
import 'package:fruits_app/views/Checkout/UI/page/CheckoutStep1.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class Basketscreen extends StatelessWidget {
  const Basketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          title: "Basket",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                // Simply pop the nested navigator
                //   context.popNested();
                //    context.goBack();
                context.navigateToEasy(const NavBarSection());
                //  context.navigateToAndClearStack(NavBarSection());
                //   context.navigateTo(NavBarSection());
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Column(
          children: [
            size.height(height * .02),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // context.navigateTo(ProductDetails());
                        },
                        child: BasketCardWidget(
                          ProductName: BasketDetails[index]['name'],
                          deliveryCharges: BasketDetails[index]
                              ['deliveryCharges'],
                          deliveryCharges_old: BasketDetails[index]
                              ['deliveryCharges_old'],
                          width: width,
                          height: height,
                          imagePath: BasketDetails[index]['image'],
                          salePresentage: BasketDetails[index]
                              ['salePresentage'],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return size.height(height * .02);
                    },
                    itemCount: BasketDetails.length)),
            size.height(height * .02),
            SizedBox(
              width: width * .9,
              child: const DashedLine(
                color: Colors.grey,
                dashWidth: 8,
                dashSpacing: 4,
                strokeWidth: 2,
              ),
            ),
            size.height(height * .02),
            TotalWidget(
              width: width,
              nameFiled: "Subtotal",
              price: 200,
              pricedistanse: " km",
            ),
            size.height(height * .02),
            TotalWidget(
              width: width,
              nameFiled: "Shipping Charges",
              price: 200,
              pricedistanse: " km",
            ),
            size.height(height * .02),
            TotalWidget(
              width: width,
              nameFiled: "Bag Total",
              price: 200,
              pricedistanse: " km",
              isBagTotal: true,
            ),
            size.height(height * .02),
            CheckoutRow(
              width: width,
              height: height,
              numbers: BasketDetails.length,
              onclickButton: () {
                context.navigateTo(CheckoutScreen());
              },
              total: 500.09,
            ),
            size.height(height * .02),
          ],
        ),
      );
    });
  }
}
