import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/ProductDetails/UI/widget/ImageWidget.dart';
import 'package:fruits_app/views/ProductDetails/UI/widget/ProductName.dart';
import 'package:fruits_app/views/ProductDetails/UI/widget/SelectSection.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
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
              icon: Icon(Icons.favorite_border, size: width * 0.07),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.file_upload_outlined, size: width * 0.07),
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
                descriptionWidget(width: width),
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
                )
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
