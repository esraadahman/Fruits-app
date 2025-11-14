import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Checkout/UI/page/CheckoutStep1.dart';
import 'package:fruits_app/views/Checkout/UI/page/CheckoutStep2.dart';
import 'package:fruits_app/views/Checkout/UI/page/CheckoutStep3.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;

      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          title: "Checkout",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.goBack();
                // context.navigateToEasy(const NavBarSection());
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // disable swipe
          onPageChanged: (index) => setState(() => currentPage = index),
          children: [
            CheckoutStep1(nextPage: nextPage, width: width, height: height),
            CheckoutStep2(
              nextPage: nextPage,
              previousPage: previousPage,
              width: width,
              height: height,
            ),
            CheckoutStep3(
                previousPage: previousPage, width: width, height: height),
          ],
        ),
      );
    });
  }
}
