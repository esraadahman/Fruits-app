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
    return Infowidget(builder: (context, deviceInfo) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Group 2805.png",
            width: deviceInfo.localWidth * 0.8,
            height: deviceInfo.localHeight * 0.6,
            fit: BoxFit.fill,
          ),
          SizedBox(height: deviceInfo.localHeight * 0.05),
          Text(
            title,
            style: TextStyle(
              fontSize: deviceInfo.orientation == Orientation.portrait
                  ? deviceInfo.localWidth * 0.045
                  : deviceInfo.localHeight * 0.065,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          size.height(deviceInfo.localHeight * 0.02),
          Flexible(
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: deviceInfo.orientation == Orientation.portrait
                    ? deviceInfo.localWidth * 0.04
                    : deviceInfo.localHeight * 0.06,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    });
  }
}
