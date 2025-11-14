import 'package:fruits_app/Core/commonImports/commonImports.dart';

class RowProductWidget extends StatelessWidget {
  const RowProductWidget(
      {super.key,
      required this.textTitle,
      required this.width,
      required this.onClick,
      required this.imagePath});

  final String textTitle;
  final double width;
  final VoidCallback onClick;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textTitle,
              style: TextStyle(
                  fontSize: width * .045, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: onClick,
              child: Image.asset(
                imagePath,
                width: width * .05,
              ),
            )
          ],
        ));
  }
}
