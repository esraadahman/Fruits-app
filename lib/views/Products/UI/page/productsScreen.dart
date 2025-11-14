import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/Lists.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/TextRowWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/categoriesWidget.dart';
import 'package:fruits_app/views/ProductDetails/UI/page/ProductDetails.dart';
import 'package:fruits_app/views/Products/UI/widgets/CardProduct.dart';
import 'package:fruits_app/views/Products/UI/widgets/RowProductWidget.dart';
import 'package:fruits_app/views/Products/UI/widgets/categoriesProduct.dart';
import 'package:fruits_app/views/Products/UI/widgets/SellerCardProduct.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (context, deviceInfo) {
        double width = deviceInfo.localWidth;
        double height = deviceInfo.localHeight;
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBarWidget(
            centerTitle: true,
            width: width,
            leading: IconButton(
                onPressed: () {
                  // context.goBack();
                  context.navigateToEasy(NavBarSection());
                },
                icon: Icon(Icons.arrow_back_ios_new, size: width * 0.07)),
            actions: [
              IconButton(
                icon: Icon(Icons.search, size: width * 0.07),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
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
                GestureDetector(
                  onTap: () {
                    context.navigateTo(ProductDetails());
                  },
                  child: CardProduct(
                    ProductName: 'esraa',
                    deliveryCharges: '200km',
                    deliveryCharges_old: '300km',
                    width: width,
                    height: height,
                    imagePath: "assets/images/logo.png",
                    salePresentage: 20,
                  ),
                ),
                CardProduct(
                  ProductName: 'esraa',
                  deliveryCharges: 'Price Upon Selection',
                  deliveryCharges_old: '300km',
                  width: width,
                  height: height,
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
