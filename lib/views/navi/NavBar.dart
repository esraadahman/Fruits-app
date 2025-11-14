import 'package:flutter/cupertino.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/colors.dart';
import 'package:fruits_app/views/Basket/UI/page/BasketScreen.dart';
import 'package:fruits_app/views/Favorite/UI/page/Favorite.dart';
import 'package:fruits_app/views/Home/UI/pages/Home.dart';
import 'package:fruits_app/views/More/UI/page/moreScreen.dart';
import 'package:fruits_app/views/MyOrders/UI/page/myOrders.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBarSection extends StatefulWidget {
  const NavBarSection({super.key});

  @override
  State<NavBarSection> createState() => _NavBarSectionState();
}

class _NavBarSectionState extends State<NavBarSection> {
  int currentIndex = 0;

  final List<Widget> pages =[];
  //  [
  //   HomeScreen(),
  //   MyOrders(),
  //   Basketscreen(),
  //   Favorite(),
  //   MoreScreen()
  // ];

  double width = 0;
  double height = 0;
  void initState() {
  super.initState();
  pages.addAll([
    HomeScreen(),
    MyOrders(),
    Basketscreen(),
    Favorite(),
    MoreScreen(
      onNavItemSelected: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    ),
  ]);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Infowidget(builder: (context, deviceInfo) {
          width = deviceInfo.localWidth;
          height = deviceInfo.localHeight;
          return pages[currentIndex];
        }),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: SalomonBottomBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              backgroundColor: AppColors.button_Color,
              selectedItemColor: AppColors.button_Color,
              items: [
                _buildNavItem(Icons.home, "Home"),
                _buildNavItem(Icons.format_list_numbered, "Orders"),
                _buildNavItem(Icons.shopping_basket_outlined, "Basket"),
                _buildNavItem(Icons.favorite_border, "Favorite"),
                _buildNavItem(CupertinoIcons.list_dash, "More"),
              ]),
        ));
  }

  SalomonBottomBarItem _buildNavItem(IconData icon, String label) {
    return SalomonBottomBarItem(
      activeIcon: Icon(icon, size: height * 0.035),
      icon: Icon(icon, size: height * 0.03),
      title: Text(
        label,
        style: TextStyle(fontSize: width * 0.035),
      ),
      selectedColor: AppColors.whiteColor,
      unselectedColor: Colors.white,
    );
  }
}
