import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          centerTitle: true,
          title: "Favorite",
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FavoriteCard(
                        height: deviceInfo.orientation == Orientation.portrait
                            ? height * 1.1
                            : height * 1.8,
                        width: deviceInfo.orientation == Orientation.portrait
                            ? width
                            : width * .5,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        size.height(height * .02),
                    itemCount: 10))
          ],
        ),
      );
    });
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.17,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.008, horizontal: width * .05),
      padding: EdgeInsets.all(width * 0.035),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              imageCircleAvater(
                  width: width, imagePath: "assets/images/vegetables.png"),
              size.width(width * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: height * 0.005),
                  Price_New_old(
                      deliveryCharges: "120.0 kD",
                      width: width,
                      deliveryCharges_old: "120.0 kD"),
                  SizedBox(height: height * 0.005),
                  Text(
                    "Store Name : Store 1",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: width * 0.07,
            width: width * 0.09,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayColor.withOpacity(.5),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Icon(
              Icons.close,
              color: AppColors.blackColor.withOpacity(.6),
              size: width * .05,
            ),
          )
        ],
      ),
    );
  }
}
