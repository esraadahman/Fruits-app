import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/Lists.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/PonitsWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/SellerCard.dart';
import 'package:fruits_app/views/Home/UI/widgets/TextRowWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/categoriesWidget.dart';
import 'package:fruits_app/views/Products/UI/page/productsScreen.dart';
import 'package:fruits_app/views/Search/UI/page/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  String status = "open";
  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (context, deviceInfo) {
        double width = deviceInfo.localWidth;
        double height = deviceInfo.localHeight;
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBarWidget(
              width: width,
              actions: [
                IconButton(
                  icon: Icon(Icons.search, size: width * 0.07),
                  onPressed: () {
                    context.navigateToEasy(Searchscreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.tune, size: width * 0.07),
                  onPressed: () {
                    context.navigateToEasy(ProductsScreen());
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                    width: width,
                    child: PageView.builder(
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(width * 0.02),
                          padding: EdgeInsets.all(width * 0.04),
                          width: width * .95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  size.height(height * 0.015),
                  PonitsWidget(
                      images: images,
                      width: width,
                      height: height,
                      currentIndex: currentIndex),
                  size.height(height * 0.03),
                  SizedBox(
                    height: height * 0.14,
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: width * 0.04,
                        children: categoriesHome.map((cat) {
                          return categoriesWidget(
                            height: height,
                            imagepath: cat['image']!,
                            width: width,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TextRowwidget(
                      width: width,
                      textTitle: "Sellers",
                      subTextTilte: 'Show All',
                      onPressed: () {}),
                  size.height(height * 0.01),
                  SizedBox(
                      height: height * 0.4,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SellerCard(
                              height: height,
                              width: width,
                              sellerName: "Seller name $index",
                              deliveryCharges: "0.5 KD",
                              status: "Open",
                              orderName: "Beverages",
                              distance: "2.5 KM",
                              rating: 4.5,
                              imagePath: "assets/images/logo.png",
                            );
                          },
                          separatorBuilder: (context, index) {
                            return size.height(height * .02);
                          },
                          itemCount: 10)),
                  //   size.height(height * .02)
                ],
              ),
            ));
      },
    );
  }
}
