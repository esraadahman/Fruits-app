import 'package:fruits_app/Core/commonImports/commonImports.dart';

class DeviceInfoClass {
  final Orientation orientation;
  final MyDeviceType deviceType;
  final double ScreenWidth;
  final double ScreenHeight;
  final double localHeight;
  final double localWidth;
  DeviceInfoClass({
    required this.orientation,
    required this.deviceType,
    required this.ScreenWidth,
    required this.ScreenHeight,
    required this.localHeight,
    required this.localWidth,
  });
}
