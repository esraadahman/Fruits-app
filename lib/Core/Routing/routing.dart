import 'package:fruits_app/Core/commonImports/commonImports.dart';

extension NavigationRouter on BuildContext {
  // used to navigate to another screen

  void navigateTo(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

// pushReplacement → replace current screen (back exits app if no previous route).
  void navigateToEasy(Widget screen) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // used to back
  void goBack() {
    Navigator.of(this).pop();
  }

// pushAndRemoveUntil → clear stack (good for Home after login).
  void navigateToAndClearStack(Widget screen) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (route) => false, // removes all previous routes
    );
  }
}
