import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _selectedIndex = 0;
  // late PersistentTabController _controller;

  List pages = [
    const MainFoodPage(),
    const Center(child: Text("Next Page")),
    const Center(child: Text("Next next Page")),
    const Center(child: Text("Next next next Page")),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     const MainFoodPage(),
  //     const Center(child: Text("Next Page")),
  //     const Center(child: Text("Next next Page")),
  //     const Center(child: Text("Next next next Page")),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.archivebox_fill),
  //       title: ("Archive"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.cart_fill),
  //       title: ("Cart"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.person),
  //       title: ("Me"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
          ]
        ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(                                           
  //     context,
  //     controller: _controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),
  //     handleAndroidBackButtonPress: true, // Default is true.
  //     resizeToAvoidBottomInset:
  //         true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
  //     stateManagement: true, // Default is true.
  //     hideNavigationBarWhenKeyboardAppears: true,
  //     // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
  //     padding: const EdgeInsets.only(top: 8),
  //     backgroundColor: Colors.grey.shade900,
  //     isVisible: true,
  //     animationSettings: const NavBarAnimationSettings(
  //       navBarItemAnimation: ItemAnimationSettings(
  //         // Navigation Bar's items animation properties.
  //         duration: Duration(milliseconds: 400),
  //         curve: Curves.ease,
  //       ),
  //       screenTransitionAnimation: ScreenTransitionAnimationSettings(
  //         // Screen transition animation on change of selected tab.
  //         animateTabTransition: true,
  //         duration: Duration(milliseconds: 200),
  //         screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
  //       ),
  //     ),
  //     confineToSafeArea: true,
  //     navBarHeight: kBottomNavigationBarHeight,
  //     navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property
  //   );
  // }

}
