import 'package:fruits_app/Core/commonImports/commonImports.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double width;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarWidget({
    super.key,
    required this.width,
    this.title,
    this.centerTitle,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leading: leading,
      title: TitleText(
        text: title ?? "Fruit Market",
        fontSize: width * 0.07,
        color: AppColors.title_text,
      ),
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
