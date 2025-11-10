import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Loadingwidget extends StatelessWidget {
  const Loadingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
