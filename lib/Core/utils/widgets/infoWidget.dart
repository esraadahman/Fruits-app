import 'package:fruits_app/Core/commonImports/commonImports.dart';



class Infowidget extends StatelessWidget {
  const Infowidget({super.key, required this.builder});

  final Widget Function(BuildContext context, DeviceInfoClass deviceInfo)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceInfoClass deviceInfo = DeviceInfoClass(
          orientation: MediaQuery.of(context).orientation,
          deviceType: getDeviceType(MediaQuery.of(context)),
          ScreenWidth: screenWidth(context),
          ScreenHeight: screenHight(context),
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth,
        );
        return builder(context, deviceInfo);
      },
    );
  }
}
