import 'package:fruits_app/Core/commonImports/commonImports.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Infowidget(builder: (context, deviceInfo) {
        return SizedBox(
          width: deviceInfo.localWidth,
          height: deviceInfo.localHeight,
          child: Image.asset(
            'assets/images/onBoarding.png',
            fit: BoxFit.fill,
          ),
        );
      }),
    );
  }
}
