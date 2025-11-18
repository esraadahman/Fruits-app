import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';

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
        body: ResponsiveLayout(
            portrait: PortraitBasket(
              height: height,
              width: width,
            ),
            landscape: LandscapeBasket(height: height, width: width)),
      );
    });
  }
}

class LandscapeBasket extends StatelessWidget {
  const LandscapeBasket({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        size.height(height * .02),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: width * .5,
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
                            height: height * 2,
                            width: width * .5,
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
              SizedBox(
                  width: width * .45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TotalWidget(
                        width: width * .55,
                        nameFiled: "Subtotal",
                        price: 200,
                        pricedistanse: " km",
                      ),
                      size.height(height * .05),
                      TotalWidget(
                        width: width * .55,
                        nameFiled: "Shipping Charges",
                        price: 200,
                        pricedistanse: " km",
                      ),
                      size.height(height * .05),
                      TotalWidget(
                        width: width * .55,
                        nameFiled: "Bag Total",
                        price: 200,
                        pricedistanse: " km",
                        isBagTotal: true,
                      ),
                      size.height(height * .05),
                      CheckoutRow(
                        width: width * .55,
                        height: height,
                        numbers: BasketDetails.length,
                        onclickButton: () {
                          context.navigateTo(CheckoutScreen());
                        },
                        total: 500.09,
                      ),
                      size.height(height * .05),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class PortraitBasket extends StatelessWidget {
  const PortraitBasket({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        height: height,
                        width: width,
                        imagePath: BasketDetails[index]['image'],
                        salePresentage: BasketDetails[index]['salePresentage'],
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
  }
}
