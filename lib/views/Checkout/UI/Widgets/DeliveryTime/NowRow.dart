import 'package:fruits_app/Core/commonImports/commonImports.dart';


class NowRow extends StatelessWidget {
  const NowRow(
      {super.key,
      required this.width,
      required this.height,
      required this.textTitle});

  final double width;
  final double height;
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.055,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .01),
        decoration: decorationContainer(),
        child: ContentRow(width: width, height: height, textTitle: textTitle));
  }
}

class ContentRow extends StatefulWidget {
  const ContentRow(
      {super.key,
      required this.width,
      required this.height,
      required this.textTitle});
  final double width;
  final double height;
  final String textTitle;

  @override
  State<ContentRow> createState() => _ContentRowState();
}

class _ContentRowState extends State<ContentRow> {
  bool openNow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.textTitle,
            style: TextStyle(
                fontSize: widget.width * .042,
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold),
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
