import 'package:flutter/cupertino.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarSection extends StatefulWidget {
  const NavBarSection({super.key});

  @override
  State<NavBarSection> createState() => _NavBarSectionState();
}

class _NavBarSectionState extends State<NavBarSection> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: GNav(
          gap: width * 0.02,
          activeColor: AppColors.button_Color,
          color: Colors.white,
          iconSize: height * 0.03,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.01),
          duration: const Duration(milliseconds: 400),
          backgroundColor: AppColors.button_Color,
          tabBackgroundColor: AppColors.whiteColor,
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: [
            _buildNavItem(Icons.home, "Home", width, height, orientation),
            _buildNavItem(Icons.format_list_numbered, "Orders", width, height,
                orientation),
            _buildNavItem(Icons.shopping_basket_outlined, "Basket", width,
                height, orientation),
            _buildNavItem(
                Icons.favorite_border, "Favorite", width, height, orientation),
            _buildNavItem(Icons.menu, "More", width, height, orientation),
          ],
        ),
      ),
    );
  }

  GButton _buildNavItem(IconData icon, String label, double width,
      double height, Orientation orientation) {
    return GButton(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      icon: icon,
      text: label,
      iconSize:
          orientation == Orientation.portrait ? height * 0.03 : width * 0.04,
      textStyle: TextStyle(
          fontSize: orientation == Orientation.portrait
              ? width * 0.035
              : width * 0.02,
          color: AppColors.button_Color,
          fontWeight: FontWeight.bold),
    );
  }
}
