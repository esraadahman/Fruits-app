import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (context, deviceInfo) {
        double width = deviceInfo.localWidth;
        double height = deviceInfo.localHeight;
        return Scaffold(
          appBar: AppBarWidget(
            orientation: deviceInfo.orientation,
            centerTitle: true,
            width: width,
            leading: IconButton(
                onPressed: () {
                  // context.goBack();
                  context.navigateToEasy(NavBarSection());
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                )),
            actions: [
              Icon(Icons.search,
                  size: deviceInfo.orientation == Orientation.portrait
                      ? width * 0.07
                      : width * 0.04)
            ],
          ),
          body: ResponsiveLayout(
              portrait: PortraitProducts(height: height, width: width),
              landscape: landscapeProducts(height: height, width: width)),
        );
      },
    );
  }
}

class landscapeProducts extends StatelessWidget {
  const landscapeProducts({
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
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SellerCardProduct(
                    height: height * 1.8,
                    width: width * .5,
                    sellerName: "Seller name",
                    deliveryCharges: "0.5 KD",
                    status: "Open",
                    orderName: "Beverages",
                    time: "40",
                    rating: 4.5,
                    imagePath: "assets/images/logo.png",
                  ),
                  Column(
                    children: [
                      TextRowwidget(
                          width: width * .5,
                          textTitle: "Categories ",
                          subTextTilte: '',
                          onPressed: () {}),
                      size.height(height * .02),
                      CategoriesProduct(
                        categories: categories,
                        onCategoryTap: (index) {},
                        height: height,
                        width: width * .5,
                      ),
                    ],
                  )
                ],
              )),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      size.height(height * .02),
                      RowProductWidget(
                        width: width * .5,
                        textTitle: "Products",
                        onClick: () {},
                        imagePath: "assets/images/filter.png",
                      ),
                      size.height(height * .02),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.navigateTo(ProductDetails());
                              },
                              child: CardProduct(
                                ProductName: 'esraa',
                                deliveryCharges: '200km',
                                deliveryCharges_old: '300km',
                                height: height * 2,
                                width: width * .5,
                                imagePath: "assets/images/logo.png",
                                salePresentage: 20,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return size.height(height * .02);
                          },
                          itemCount: 10),
                      size.height(height * .02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PortraitProducts extends StatelessWidget {
  const PortraitProducts({
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
          size.height(height * .02),
          SellerCardProduct(
            height: height,
            width: width,
            sellerName: "Seller name",
            deliveryCharges: "0.5 KD",
            status: "Open",
            orderName: "Beverages",
            time: "40",
            rating: 4.5,
            imagePath: "assets/images/logo.png",
          ),
          TextRowwidget(
              width: width,
              textTitle: "Categories ",
              subTextTilte: '',
              onPressed: () {}),
          size.height(height * .02),
          CategoriesProduct(
            categories: categories,
            onCategoryTap: (index) {
              if (index == 0) {
                print('Fruits tapped');
              } else if (index == 1) {
                print('Vegetables tapped');
              } else if (index == 2) {
                print('Iphone tapped');
              } else if (index == 3) {
                print('Pets tapped');
              }
            },
            height: height,
            width: width,
          ),
          size.height(height * .02),
          RowProductWidget(
            width: width,
            textTitle: "Products",
            onClick: () {},
            imagePath: "assets/images/filter.png",
          ),
          size.height(height * .02),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.navigateTo(ProductDetails());
                  },
                  child: CardProduct(
                    ProductName: 'esraa',
                    deliveryCharges: '200km',
                    deliveryCharges_old: '300km',
                    height: height,
                    width: width,
                    imagePath: "assets/images/logo.png",
                    salePresentage: 20,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return size.height(height * .02);
              },
              itemCount: 10)
        ],
      ),
    );
  }
}
