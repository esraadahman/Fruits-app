import 'package:fruits_app/Core/commonImports/commonImports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "E Shopping",
      "subtitle": "Explore organic fruits & grab them",
    },
    {
      "title": "Delivery Arrived",
      "subtitle": "Order is arrived at your Place",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Get your fruits quickly and easily",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Infowidget(builder: (context, deviceInfo) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    context.navigateTo(Welcomescreen());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: AppColors.grayColor.withOpacity(0.6),
                        fontSize: deviceInfo.orientation == Orientation.portrait
                            ? deviceInfo.localWidth * 0.04
                            : deviceInfo.localHeight * 0.06),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Onboardingwidget(
                      title: page["title"]!,
                      subtitle: page["subtitle"]!,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: currentIndex == index
                        ? deviceInfo.localWidth * .03
                        : deviceInfo.localWidth * 0.02,
                    height: deviceInfo.localHeight * 0.01,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.button_Color
                          : AppColors.grayColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              size.height(deviceInfo.localHeight * 0.05),
              Padding(
                padding: EdgeInsets.only(bottom: deviceInfo.localHeight * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == pages.length - 1) {
                      context.navigateTo(Welcomescreen());
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button_Color,
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.07,
                      vertical: deviceInfo.localHeight * 0.01,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    currentIndex == pages.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? deviceInfo.localWidth * 0.045
                          : deviceInfo.localHeight * 0.06,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
