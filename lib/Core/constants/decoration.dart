import 'package:fruits_app/Core/commonImports/commonImports.dart';

BoxDecoration decorationContainer() {
  return BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 6,
        spreadRadius: 1,
        offset: const Offset(0, 0),
      ),
    ],
  );
}
