import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/Core/constants/sizeClass.dart';
import 'package:fruits_app/Core/utils/functions/getDeviceType.dart';
import 'package:fruits_app/Core/utils/models/deviceInfo.dart';


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
