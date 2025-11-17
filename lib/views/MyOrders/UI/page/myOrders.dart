import 'package:fruits_app/Core/commonImports/commonImports.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;

      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          orientation: deviceInfo.orientation,
          title: "My Orders",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      Color colorsCreated = AppColors.randomColor();
                      return MyorderCard(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? height * 1
                              : height * 1.9,
                          width: deviceInfo.orientation == Orientation.portrait
                              ? width
                              : width * .5,
                          colorsCreated: colorsCreated);
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
