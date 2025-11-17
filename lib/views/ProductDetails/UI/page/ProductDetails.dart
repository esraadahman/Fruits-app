import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWidget(
                  width: width,
                  height: deviceInfo.orientation == Orientation.portrait
                      ? height
                      : height * 1.5,
                  imagePath: "assets/images/product.png",
                  sale: 10,
                ),
                size.height(height * .01),
                Text(
                  " Category Name",
                  style: TextStyle(
                      color: AppColors.button_Color,
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? width * .04
                          : width * 0.03,
                      fontWeight: FontWeight.bold),
                ),
                size.height(height * .01),
                ProductName(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
                  productname: " Product Name",
                  price: "KD12.00",
                  old_price: "KD14.00",
                ),
                size.height(height * .02),
                descriptionWidget(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .6,
                ),
                size.height(height * .02),
                SelectSection(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
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
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
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
                      width: deviceInfo.orientation == Orientation.portrait
                          ? width
                          : width * 0.5),
                ),
                size.height(height * .03),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class descriptionWidget extends StatelessWidget {
  const descriptionWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore  sed do eiusmod tempor incididunt ut labore et dolore ",
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: width * 0.034,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
