import 'package:fruits_app/Core/commonImports/commonImports.dart';

showSnackBarerro(BuildContext context, String text) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
