import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.onClick,
    required this.icon,
    required this.text,
  });

  final double width;
  final double height;
  final VoidCallback onClick;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Center(
        child: Container(
          height: height * 0.07,
          width: width * 0.9,
          margin: EdgeInsets.symmetric(
              vertical: height * 0.008, horizontal: width * .04),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
          ),
          child: ListTile(
            leading:
                Icon(icon, color: AppColors.button_Color, size: width * 0.08),
            title: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.04,
                color: AppColors.blackColor,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.button_Color,
              size: width * 0.04,
            ),
            onTap: onClick,
          ),
        ),
      ),
    );
  }
}
