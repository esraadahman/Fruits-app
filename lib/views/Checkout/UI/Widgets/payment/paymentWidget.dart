import 'package:fruits_app/Core/commonImports/commonImports.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.textTitle,
      required this.imagePath});

  final double width;
  final double height;
  final String textTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.058,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .04),
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .01),
        decoration: decorationContainer(),
        child: ContantWidget(
          width: width,
          height: height,
          textTitle: textTitle,
          imagePath: imagePath,
        ));
  }
}

class ContantWidget extends StatefulWidget {
  const ContantWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.textTitle,
      required this.imagePath});
  final double width;
  final double height;
  final String textTitle;
  final String imagePath;

  @override
  State<ContantWidget> createState() => _ContentRowState();
}

class _ContentRowState extends State<ContantWidget> {
  bool openNow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.imagePath,
              ),
              size.width(widget.width * .02),
              Text(
                widget.textTitle,
                style: TextStyle(
                    fontSize: widget.width * .042,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              shape: CircleBorder(),
              value: openNow,
              onChanged: (value) => setState(() => openNow = value!),
              checkColor: AppColors.whiteColor,
              activeColor: AppColors.button_Color,
            ),
          ),
        ]);
  }
}
