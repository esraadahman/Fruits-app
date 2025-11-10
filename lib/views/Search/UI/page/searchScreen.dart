import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Home/UI/pages/Home.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/SellerCard.dart';
import 'package:fruits_app/views/Home/UI/widgets/TextRowWidget.dart';
import 'package:fruits_app/views/Search/UI/Widget/FilterPopupWidget.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          leading: IconButton(
              onPressed: () {
                // context.goBack();
                context.navigateToEasy(NavBarSection());
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
              icon: Icon(Icons.tune, size: width * 0.07),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return FilterPopupWidget(
                      onApply: (selected, open, free) {
                        // setState(() {
                        //   category = selected;
                        //   openNow = open;
                        //   freeDelivery = free;
                        // });
                      },
                      width: width,
                      height: height,
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              size.height(height * .02),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.02),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: width * .05,
                    ),
                    hintText: "What are you looking for ? ",
                    hintStyle:
                        TextStyle(fontSize: width * 0.035, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.only(top: height * 0.015),
                  ),
                ),
              ),
              size.height(height * .05),
              TextRowwidget(
                  width: width,
                  textTitle: "Top sellers",
                  subTextTilte: 'Show All',
                  onPressed: () {}),
              SizedBox(
                  height: height,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SellerCard(
                          height: height,
                          width: width,
                          sellerName: "Seller name",
                          deliveryCharges: "0.5 KD",
                          status: "Open ",
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
            ],
          ),
        ),
      );
    });
  }
}
