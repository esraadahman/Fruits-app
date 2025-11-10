import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/TextRowWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/categoriesWidget.dart';
import 'package:fruits_app/views/Products/UI/widgets/productCard.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"title": "Restaurant", "image": "assets/images/image 5.png"},
      {"title": "Coffee", "image": "assets/images/image 6.png"},
      {"title": "Pharmacy", "image": "assets/images/image 7.png"},
      {"title": "Others", "image": "assets/images/image 8.png"},
    ];
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
                icon: Icon(Icons.arrow_back_ios_new)),
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
                Productcard(
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
                SizedBox(
                  height: height * 0.14,
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: width * 0.04,
                      children: categories.map((cat) {
                        return categoriesWidget(
                          height: height,
                          imagepath: cat['image']!,
                          width: width,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
