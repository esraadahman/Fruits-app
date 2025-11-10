import 'package:fruits_app/Core/commonImports/commonImports.dart';

void handleCubitState({
  required BuildContext context,
  required Object state,
  required Type successType,
  required Type failureType,
  String successMessage = "Success",
  String failureMessage = "Something went wrong",
  Widget? onSuccessNavigate,
  Widget? onFailureNavigate,
  bool clearStackOnSuccess = true,
  bool clearStackOnFailure = false,
}) {
  if (state.runtimeType == successType) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(successMessage)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );

    if (onSuccessNavigate != null) {
      // context.navigateToAndClearStack(onSuccessNavigate);
      if (clearStackOnSuccess) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => onSuccessNavigate),
          (route) => false,
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => onSuccessNavigate),
        );
      }
    }

    if (state.runtimeType == failureType) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(child: Text(failureMessage)),
            ],
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );

      if (onFailureNavigate != null) {
        //   context.navigateToEasy(onFailureNavigate);
        if (clearStackOnFailure) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => onFailureNavigate),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => onFailureNavigate),
          );
        }
      }
    }
  }
}
