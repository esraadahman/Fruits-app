import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';
import 'package:fruits_app/views/ProductDetails/UI/widget/descriptionWidget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        appBar: AppBarWidget(
          orientation: deviceInfo.orientation,
          width: width,
          title: "Product Name",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                // context.goBack();
                context.navigateToEasy(NavBarSection());
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border,
                  size: deviceInfo.orientation == Orientation.portrait
                      ? width * 0.07
                      : width * 0.04),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.file_upload_outlined,
                  size: deviceInfo.orientation == Orientation.portrait
                      ? width * 0.07
                      : width * 0.04),
              onPressed: () {},
            ),
          ],
        ),
        body: ResponsiveLayout(
            portrait: PortraitProductDetails(width: width, height: height),
            landscape: Column(children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .5 * .02),
                    child: ImageWidget(
                      width: width * .5,
                      height: height * 2.5,
                      imagePath: "assets/images/product.png",
                      sale: 10,
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .5 * .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        size.height(height * .02),
                        Text(
                          " Category Name",
                          style: TextStyle(
                              color: AppColors.button_Color,
                              fontSize: width * .5 * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        size.height(height * .01),
                        ProductName(
                          width: width * .4,
                          productname: " Product Name",
                          price: "KD12.00",
                          old_price: "KD14.00",
                        ),
                        size.height(height * .02),
                        descriptionWidget(
                          width: width * .5,
                        ),
                        size.height(height * .02),
                        SelectSection(
                          width: width * .5,
                          options: [
                            {'label': '50 Gram', 'price': '4.00 KD'},
                            {'label': '100 Gram', 'price': '7.00 KD'},
                            {'label': '250 Gram', 'price': '15.00 KD'},
                          ],
                          title: "weight",
                          height: height,
                        ),
                        size.height(height * .02),
                        SelectSection(
                          width: width * .5,
                          options: [
                            {'label': '50 Gram', 'price': '4.00 KD'},
                            {'label': '250 Gram', 'price': '15.00 KD'},
                          ],
                          title: "Addons",
                          height: height,
                        ),
                        size.height(height * .02),
                        Padding(
                          padding: EdgeInsets.only(left: width * .5 / 2),
                          child: Customauthbutton(
                              onTap: () {},
                              textColor: AppColors.whiteColor,
                              buttonText: "Add to Cart",
                              iconData: Icons.shopping_basket_outlined,
                              buttonColor: AppColors.button_Color,
                              height: height,
                              width: width * .5),
                        ),
                      ],
                    ),
                  )),
                ],
              ))
            ])),
      );
    });
  }
}

class PortraitProductDetails extends StatelessWidget {
  const PortraitProductDetails({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              width: width,
              height: height,
              imagePath: "assets/images/product.png",
              sale: 10,
            ),
            size.height(height * .01),
            Text(
              " Category Name",
              style: TextStyle(
                  color: AppColors.button_Color,
                  fontSize: width * .04,
                  fontWeight: FontWeight.bold),
            ),
            size.height(height * .01),
            ProductName(
              width: width,
              productname: " Product Name",
              price: "KD12.00",
              old_price: "KD14.00",
            ),
            size.height(height * .02),
            descriptionWidget(
              width: width,
            ),
            size.height(height * .02),
            SelectSection(
              width: width,
              options: [
                {'label': '50 Gram', 'price': '4.00 KD'},
                {'label': '100 Gram', 'price': '7.00 KD'},
                {'label': '250 Gram', 'price': '15.00 KD'},
              ],
              title: "weight",
              height: height,
            ),
            size.height(height * .02),
            SelectSection(
              width: width,
              options: [
                {'label': '50 Gram', 'price': '4.00 KD'},
                {'label': '250 Gram', 'price': '15.00 KD'},
              ],
              title: "Addons",
              height: height,
            ),
            size.height(height * .02),
            Padding(
              padding: EdgeInsets.only(left: width / 2),
              child: Customauthbutton(
                  onTap: () {},
                  textColor: AppColors.whiteColor,
                  buttonText: "Add to Cart",
                  iconData: Icons.shopping_basket_outlined,
                  buttonColor: AppColors.button_Color,
                  height: height,
                  width: width),
            ),
            size.height(height * .03),
          ],
        ),
      ),
    );
  }
}
