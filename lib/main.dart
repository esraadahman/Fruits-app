import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruits_app/Core/utils/Theme/theme.dart';
import 'package:fruits_app/firebase_options.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/onBoarding/UI/pages/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(DevicePreview(
  //   builder: (context) => const MyApp(),
  // ));
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home:
            //SplashScreen(),
            //HomeScreen()
            //NaviBarSection(),
            NavBarSection()
        // OrderTracking()
        );
  }
}
