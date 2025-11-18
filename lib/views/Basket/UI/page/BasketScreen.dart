import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
          orientation: deviceInfo.orientation,
          width: width,
          title: "Basket",
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              size.height(height * .02),
              SizedBox(
                  height: height * 0.6,
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
                            height:
                                deviceInfo.orientation == Orientation.portrait
                                    ? height
                                    : height * 2.7,
                            width:
                                deviceInfo.orientation == Orientation.portrait
                                    ? width
                                    : width * .7,
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
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
                nameFiled: "Subtotal",
                price: 200,
                pricedistanse: " km",
              ),
              size.height(height * .02),
              TotalWidget(
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
                nameFiled: "Shipping Charges",
                price: 200,
                pricedistanse: " km",
              ),
              size.height(height * .02),
              TotalWidget(
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
                nameFiled: "Bag Total",
                price: 200,
                pricedistanse: " km",
                isBagTotal: true,
              ),
              size.height(height * .02),
              CheckoutRow(
                width: deviceInfo.orientation == Orientation.portrait
                    ? width
                    : width * .6,
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
        ),
      );
    });
  }
}
