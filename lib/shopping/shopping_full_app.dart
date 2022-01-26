
// import 'package:UIKit/utils/custom/navigation/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:local_notifaiction/services/app_theme_notifier.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/shopping/utils.dart';
import 'package:local_notifaiction/ui/screens/home_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

// import '../../AppTheme.dart';
// import '../../AppThemeNotifier.dart';
import 'shopping_cart_screen.dart';
import 'shopping_home_screen.dart';
import 'shopping_profile_screen.dart';
import 'shopping_search_screen.dart';

class ShoppingFullApp extends StatefulWidget {
  @override
  _ShoppingFullAppState createState() => _ShoppingFullAppState();
}

class _ShoppingFullAppState extends State<ShoppingFullApp> {
  int _currentIndex = 1;
  PageController? _pageController;

  late MyNavigationBarTheme navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        navigationBarTheme =
            AppTheme.getNavigationThemeFromMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: FxAppTheme.theme,
            home: Scaffold(
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                     const HomeScreen(),
                       
                    // ShoppingHomeScreen(),
                    ShoppingSearchScreen(),
                  ShoppingCartScreen(),
                  // const  AddTaskPage(),
                    ShoppingProfileScreen(root: context,)
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavigation(
                animationDuration: Duration(milliseconds: 350),
                selectedItemOverlayColor:
                    navigationBarTheme.selectedOverlayColor,
                backgroundColor: navigationBarTheme.backgroundColor,
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() => _currentIndex = index);
                  _pageController!.jumpToPage(index);
                },
                items: <CustomBottomNavigationBarItem>[
                  CustomBottomNavigationBarItem(
                      title: "الصفحة الرئيسية",
                      icon: Icon(MdiIcons.storeOutline, size: 22),
                      activeIcon: Icon(MdiIcons.store, size: 22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Search",
                      icon: Icon(MdiIcons.magnify, size: 22),
                      activeIcon: Icon(MdiIcons.magnify, size: 22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                      
                  CustomBottomNavigationBarItem(
                      title: "Cart",
                      icon: Icon(MdiIcons.cartOutline, size: 22),
                      activeIcon: Icon(MdiIcons.cart, size: 22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Profile",
                      icon: Icon(
                        MdiIcons.accountOutline,
                        size: 22,
                      ),
                      activeIcon: Icon(
                        MdiIcons.account,
                        size: 22,
                      ),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                ],
              ),
            ));
      },
    );
  }

}
