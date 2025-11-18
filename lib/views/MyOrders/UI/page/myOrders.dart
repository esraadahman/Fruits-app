import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';

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
          ),
          body: ResponsiveLayout(
            portrait: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          Color colorsCreated = AppColors.randomColor();
                          return MyorderCard(
                              height:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? height
                                      : height * 1.9,
                              width:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? width
                                      : width * .5,
                              colorsCreated: colorsCreated);
                        },
                        separatorBuilder: (context, index) =>
                            size.height(height * .02),
                        itemCount: 10))
              ],
            ),
            landscape: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * .02),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: height * 0.02,
                  crossAxisSpacing: width * 0.02,
                  childAspectRatio: (width / height) * 1.4,
                ),
                itemBuilder: (context, index) {
                  Color colorsCreated = AppColors.randomColor();
                  return MyorderCard(
                    height: height * 0.3,
                    width: width * 0.45,
                    colorsCreated: colorsCreated,
                  );
                },
              ),
            ),
          ));
    });
  }
}
