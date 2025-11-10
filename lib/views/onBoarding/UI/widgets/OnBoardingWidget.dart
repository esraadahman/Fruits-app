import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Onboardingwidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const Onboardingwidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize_title = 0;
    double fontSize_subtitle = 0;
    double image_width = 0;
    double image_height = 0;

    return Infowidget(builder: (context, deviceInfo) {
      if (deviceInfo.deviceType == MyDeviceType.mobile) {
        fontSize_title = deviceInfo.localHeight * 0.04;
        fontSize_subtitle = deviceInfo.localHeight * 0.03;
        image_height = deviceInfo.localHeight * 0.6;
        image_width = deviceInfo.localWidth * 0.8;
      } else if (deviceInfo.deviceType == MyDeviceType.tablet) {
        fontSize_title = 35;
        fontSize_subtitle = 27;
        image_height = deviceInfo.localHeight * 0.5;
        image_width = deviceInfo.localWidth * 0.6;
      } else {
        fontSize_title = 38;
        fontSize_subtitle = 32;
        image_height = deviceInfo.localHeight * 0.5;
        image_width = deviceInfo.localWidth * 0.6;
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Group 2805.png",
            width: image_width,
            height: image_height,
            fit: BoxFit.fill,
          ),
          SizedBox(height: deviceInfo.localHeight * 0.05),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize_title,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: fontSize_subtitle,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }
}
