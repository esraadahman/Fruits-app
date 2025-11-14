import 'package:fruits_app/Core/commonImports/commonImports.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.width,
    required this.subtitle,
  });

  final double width;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
          fontSize: width * .04,
          fontWeight: FontWeight.normal,
          color: AppColors.grayColor.withOpacity(.5)),
    );
  }
}
