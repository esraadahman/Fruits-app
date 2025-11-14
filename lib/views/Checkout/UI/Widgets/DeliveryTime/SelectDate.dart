import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/decoration.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/DeliveryTime/DatePickerField.dart';
import 'package:fruits_app/views/Checkout/UI/Widgets/DeliveryTime/NowRow.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.008, horizontal: width * .05),
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .01),
      decoration: decorationContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ContentRow(
                width: width,
                height: height,
                textTitle: "Select Delivery Time"),
          ),
          Text(
            "Select Date",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontSize: width * .03),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: height * .01),
            child: DatePickerField(
              width: width,
            ),
          ))
        ],
      ),
    );
  }
}
