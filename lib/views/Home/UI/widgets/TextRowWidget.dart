import 'package:fruits_app/Core/commonImports/commonImports.dart';

class TextRowwidget extends StatelessWidget {
  const TextRowwidget(
      {super.key,
      required this.width,
      required this.textTitle,
      required this.subTextTilte,
      required this.onPressed});
  final double width;
  final String textTitle;
  final String subTextTilte;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textTitle,
            style:
                TextStyle(fontSize: width * .045, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                subTextTilte,
                style: TextStyle(
                  fontSize: width * .045,
                  color: AppColors.facebookBlue,
                ),
              ))
        ],
      ),
    );
  }
}
