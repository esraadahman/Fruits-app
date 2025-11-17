import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTilewidget extends StatelessWidget {
  const TimelineTilewidget(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildTimelineTile("Delivered", "Estimated for 10 September, 2021",
            false, width, height,
            isFirst: true),
        buildTimelineTile("Out for delivery",
            "Estimated for 10 September, 2021", false, width, height),
        buildTimelineTile("Order Shipped", "Estimated for 10 September, 2021",
            true, width, height),
        buildTimelineTile(
            "Confirmed", "Your order has been confirmed", true, width, height),
        buildTimelineTile(
            "Order Placed", "We have received your order", true, width, height,
            isLast: true),
      ],
    );
  }

  Widget buildTimelineTile(String title, String subtitle, bool isCompleted,
      double width, double height,
      {bool isFirst = false, bool isLast = false}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.12,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle:
          const LineStyle(color: AppColors.greenColor, thickness: 3),
      afterLineStyle:
          const LineStyle(color: AppColors.greenColor, thickness: 3),
      indicatorStyle: isCompleted
          ? IndicatorStyle(
              width: width * .055,
              height: height * .055,
              color: AppColors.greenColor,
            )
          : IndicatorStyle(
              width: width * .06,
              height: height * .06,
              indicator: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.greenColor, width: 3),
                ),
              ),
            ),
      endChild: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * .02, horizontal: width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * .045)),
            //  size.height(height * .008),
            Text(subtitle,
                style: TextStyle(color: Colors.grey, fontSize: width * .035)),
          ],
        ),
      ),
    );
  }
}
