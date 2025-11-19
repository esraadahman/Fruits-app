import 'package:fruits_app/Core/commonImports/commonImports.dart';

class descriptionWidget extends StatelessWidget {
  const descriptionWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore  sed do eiusmod tempor incididunt ut labore et dolore ",
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: width * 0.034,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
