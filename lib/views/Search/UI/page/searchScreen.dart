import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
          orientation: deviceInfo.orientation,
          width: width,
          leading: IconButton(
              onPressed: () {
                // context.goBack();
                context.navigateToEasy(NavBarSection());
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
              icon: Icon(Icons.tune,
                  size: deviceInfo.orientation == Orientation.portrait
                      ? width * 0.07
                      : width * 0.04),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return FilterPopupWidget(
                      orientation: deviceInfo.orientation,
                      onApply: (selected, open, free) {
                        // setState(() {
                        //   category = selected;
                        //   openNow = open;
                        //   freeDelivery = free;
                        // });
                      },
                      width: deviceInfo.orientation == Orientation.portrait
                          ? width
                          : width * 0.5,
                      height: deviceInfo.orientation == Orientation.portrait
                          ? height
                          : height * 1.5,
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
                      color: AppColors.grayColor.withOpacity(0.5),
                      size: deviceInfo.orientation == Orientation.portrait
                          ? width * .05
                          : width * 0.04,
                    ),
                    hintText: "What are you looking for ? ",
                    hintStyle: TextStyle(
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? width * 0.035
                          : width * .025,
                      color: AppColors.grayColor.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.only(top: height * 0.015),
                  ),
                ),
              ),
              size.height(height * .05),
              TextRowwidget(
                  width: deviceInfo.orientation == Orientation.portrait
                      ? width
                      : width * .7,
                  textTitle: "Top sellers",
                  subTextTilte: 'Show All',
                  onPressed: () {}),
              SizedBox(
                  height: height,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SellerCard(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? height
                              : height * 1.7,
                          width: deviceInfo.orientation == Orientation.portrait
                              ? width
                              : width * .5,
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
