import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/decoration.dart';
import 'package:fruits_app/views/Basket/UI/Widget/CountWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/PonitsWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/subWidgets/imageCircleAvater.dart';
import 'package:fruits_app/views/Home/UI/widgets/subWidgets/pointWidget.dart';
import 'package:fruits_app/views/MyOrders/UI/widgets/MyorderCard.dart';

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
                          height: height,
                          width: width,
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
