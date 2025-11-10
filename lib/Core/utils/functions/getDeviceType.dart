import 'package:fruits_app/Core/commonImports/commonImports.dart';



MyDeviceType getDeviceType(MediaQueryData mediaQuery) {
  // can get device width and check it to define device type
  // if width < 600 -> mobile
  // if width < 1200 -> tablet
  // else -> desktop
  double width = 0.0;

  // orientation use it to check device is in landscape or portrait mode
  Orientation orientation = mediaQuery.orientation;

  if (orientation == Orientation.landscape) {
    // it is landscape mode
    width = mediaQuery.size.height;
  } else {
    // it is portrait mode
    width = mediaQuery.size.width;
  }
  // now we have width we can check it to define device type
  if (width < 600) {
    return MyDeviceType.mobile;
  } else if (width < 1200) {
    return MyDeviceType.tablet;
  } else {
    return MyDeviceType.desktop;
  }
}
