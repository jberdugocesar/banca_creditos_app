// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:banca_creditos_app/ui/pages/credit_history.dart';
import 'package:banca_creditos_app/ui/pages/home_page.dart';

int bottomNavBarIndex = 0;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      const HomePage(),
      const CreditHistoryPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    const double iconsize = 30;
    return [
      PersistentBottomNavBarItem(
          title: "Home",
          icon: const Icon(Icons.home_filled,
              size: iconsize, color: Color(0xFF42006E))),
      PersistentBottomNavBarItem(
        title: "Historial Créditos",
        icon:
            const Icon(Icons.wallet, size: iconsize, color: Color(0xFF42006E)),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    //Put controlelrs here
    logInfo("this is the index ${_controller.index}");
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(context),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
