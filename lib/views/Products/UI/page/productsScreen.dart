import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
              IconButton(
                icon: Icon(Icons.search,
                    size: deviceInfo.orientation == Orientation.portrait
                        ? width * 0.07
                        : width * 0.04),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                size.height(height * .02),
                SellerCardProduct(
                  height: deviceInfo.orientation == Orientation.portrait
                      ? height
                      : height * 1.7,
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
                  sellerName: "Seller name",
                  deliveryCharges: "0.5 KD",
                  status: "Open",
                  orderName: "Beverages",
                  time: "40",
                  rating: 4.5,
                  imagePath: "assets/images/logo.png",
                ),
                TextRowwidget(
                    width: deviceInfo.orientation == Orientation.portrait
                        ? width
                        : width * .7,
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
                  height: deviceInfo.orientation == Orientation.portrait
                      ? height
                      : height * 1.7,
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
                ),
                size.height(height * .02),
                RowProductWidget(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
                  textTitle: "Products",
                  onClick: () {},
                  imagePath: "assets/images/filter.png",
                ),
                size.height(height * .02),
                GestureDetector(
                  onTap: () {
                    context.navigateTo(ProductDetails());
                  },
                  child: CardProduct(
                    ProductName: 'esraa',
                    deliveryCharges: '200km',
                    deliveryCharges_old: '300km',
                    height: deviceInfo.orientation == Orientation.portrait
                        ? height
                        : height * 1.7,
                    width: deviceInfo.orientation == Orientation.portrait
                        ? width
                        : width * .5,
                    imagePath: "assets/images/logo.png",
                    salePresentage: 20,
                  ),
                ),
                CardProduct(
                  ProductName: 'esraa',
                  deliveryCharges: 'Price Upon Selection',
                  deliveryCharges_old: '300km',
                  height: deviceInfo.orientation == Orientation.portrait
                      ? height
                      : height * 1.7,
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .5,
                  imagePath: "assets/images/logo.png",
                  salePresentage: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
