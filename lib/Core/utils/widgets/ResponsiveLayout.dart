import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const ResponsiveLayout({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      if (deviceInfo.orientation == Orientation.portrait) {
        return portrait;
      } else {
        return landscape;
      }
    });
  }
}
