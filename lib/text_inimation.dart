import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';

import 'services/app_theme_notifier.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  String TapToExpandIt = 'يليتبليتبحلختيحخليبل';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' to reparent its subtree, a widget must arrive at its new location in the'
      ' tree in the same animation frame in which it was removed from its old'
      ' location the tree.';
  bool isExpanded = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const Align(
              alignment: Alignment.bottomRight,
              // child:
              //  AddTodoButton(),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(
                  horizontal: isExpanded ? 25 : 0,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(20),
                height: isExpanded ? 230 : 330,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1200),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff6F12E8).withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(5, 10),
                    ),
                  ],
                  color: const Color(0xff6F12E8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(isExpanded ? 20 : 0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'اسم المتهم: نجيب اسماعيل عبدة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 27,
                              ).expand(),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'تاريخ الدخول : 2021/12/22',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'المتبقي لتنبية الاول :12 يوم ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'المتبقي لتنبية الثاني : 17 يوم',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'المتبقي لتنبية الثالث : 2021/12/22',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ).expand(),
                            ],
                          ),
                        ],
                      ),
                      isExpanded
                          ? const SizedBox()
                          : const SizedBox(height: 20),
                      AnimatedCrossFade(
                        firstChild: const Text(
                          '',
                          style: TextStyle(
                            fontSize: 0,
                          ),
                        ),
                        secondChild: Column(
                          children: const [Text('pro')],
                        ),
                        // Text(
                        //   Sentence,
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 15.7,
                        //   ),
                        // ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 1200),
                        reverseDuration: Duration.zero,
                        sizeCurve: Curves.fastLinearToSlowEaseIn,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isExpanded2 = !isExpanded2;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(
                  horizontal: isExpanded2 ? 25 : 0,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(20),
                height: isExpanded2 ? 70 : 330,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1200),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFF5050).withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(5, 10),
                    ),
                  ],
                  color: const Color(0xffFF5050),
                  borderRadius: BorderRadius.all(
                    Radius.circular(isExpanded2 ? 20 : 0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TapToExpandIt,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          isExpanded2
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 27,
                        ),
                      ],
                    ).expand(),
                    isExpanded2 ? const SizedBox() : const SizedBox(height: 20),
                    AnimatedCrossFade(
                      firstChild: const Text(
                        '',
                        style: TextStyle(
                          fontSize: 0,
                        ),
                      ),
                      secondChild: Text(
                        Sentence,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.7,
                        ),
                      ),
                      crossFadeState: isExpanded2
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 1200),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* --------------------------------------------------------- mian New */
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutx/themes/app_theme.dart';
// import 'package:flutx/themes/app_theme_notifier.dart';
// 
// import 'package:get_storage/get_storage.dart';
// import 'package:local_notifaiction/services/theme_services.dart';
// import 'package:local_notifaiction/shopping/shopping_full_app.dart';
// import 'package:local_notifaiction/ui/bottom_navigation/custom_bottom_navigation.dart';
// import 'package:provider/provider.dart';
// import 'db/db_helper.dart';
// import 'ui/home_page.dart';
// import 'ui/theme.dart';
// import 'services/app_theme_notifier.dart';

// Future<void> main() async {
// //You will need to initialize AppThemeNotifier class for theme changes.
//   WidgetsFlutterBinding.ensureInitialized();

//   WidgetsFlutterBinding.ensureInitialized();
//   await DBHelper.initDB();
//   await GetStorage.init(); //this is for Initialized GetStorage
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) {
//     runApp(ChangeNotifierProvider<AppThemeNotifier>(
//       create: (context) => AppThemeNotifier(),
//       child: ChangeNotifierProvider<FxAppThemeNotifier>(
//         create: (context) => FxAppThemeNotifier(),
//         child: const MyApp(),
//       ),
//     ));
//   });

//   // runApp(ChangeNotifierProvider<AppThemeNotifier>(
//   //   create: (context) => AppThemeNotifier(),
//   //   child: ChangeNotifierProvider<FxAppThemeNotifier>(
//   //     create: (context) => FxAppThemeNotifier(),
//   //     child: const MyApp(),
//   //   ),
//   // ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppThemeNotifier>(
//         builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
//       return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: Themes.light.copyWith(
//             pageTransitionsTheme: const PageTransitionsTheme(
//               builders: <TargetPlatform, PageTransitionsBuilder>{
//                 TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//                 TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//               },
//             ),
//           ),
//           darkTheme: Themes.dark.copyWith(
//             pageTransitionsTheme: const PageTransitionsTheme(
//               builders: <TargetPlatform, PageTransitionsBuilder>{
//                 TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//                 TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//               },
//             ),
//           ),
//           themeMode: ThemeServices().theme,
//           home: const HomePage());

//       // MaterialApp(
//       //   debugShowCheckedModeBanner: false,
//       // theme: FxAppTheme.getThemeFromThemeMode(),
//       //     GetMaterialApp(
//       //   debugShowCheckedModeBanner: false,

//       //   title: 'Flutter Demo',
//       //   // translations: LocaleString(),
//       //   locale: const Locale('tr', 'US'),
//       //   theme: FxAppTheme.getThemeFromThemeMode(),
//       //   // Themes.light.copyWith(
//       //   //   pageTransitionsTheme: const PageTransitionsTheme(
//       //   //     builders: <TargetPlatform, PageTransitionsBuilder>{
//       //   //       TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//       //   //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       //   //     },
//       //   //   ),
//       //   // ),
//       //   darkTheme: Themes.dark.copyWith(
//       //     pageTransitionsTheme: const PageTransitionsTheme(
//       //       builders: <TargetPlatform, PageTransitionsBuilder>{
//       //         TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//       //         TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       //       },
//       //     ),
//       //   ),
//       //   themeMode: ThemeServices().theme,
//       //   home: MyCustomBottomNavigation()
//       // // const  HomePage()
//       //   // ShoppingFullApp()
//       //   // const SinglePageItem(
//       //   //   iconData: MdiIcons.shoppingOutline,
//       //   //   navigation: MyHomePage(),
//       //   //   title: "Shopping",
//       //   // ),
//       //   //ShoppingRegisterScreen()
//       //   // const MyCustomBottomNavigation()
//       // );
//     });

//     // GetMaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     title: 'Flutter Demo',
//     //     translations: LocaleString(),
//     //     locale: const Locale('tr', 'US'),
//     //     theme: Themes.light.copyWith(
//     //       pageTransitionsTheme: const PageTransitionsTheme(
//     //         builders: <TargetPlatform, PageTransitionsBuilder>{
//     //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//     //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//     //         },
//     //       ),
//     //     ),
//     //     darkTheme: Themes.dark.copyWith(
//     //       pageTransitionsTheme: const PageTransitionsTheme(
//     //         builders: <TargetPlatform, PageTransitionsBuilder>{
//     //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//     //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//     //         },
//     //       ),
//     //     ),
//     //     themeMode: ThemeServices().theme,
//     //     home: CustomBottomNavigationWidget());
//   }
// }

// // git branch -M master
// //git remote add origin https://github.com/najeebaslan/issue.git
// // git push -u origin master







/* --------------------------------------------------------- mian old */




// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutx/themes/app_theme.dart';
// import 'package:flutx/themes/app_theme_notifier.dart';
// 
// import 'package:get_storage/get_storage.dart';
// import 'package:local_notifaiction/services/theme_services.dart';
// import 'package:local_notifaiction/shopping/shopping_full_app.dart';
// import 'package:local_notifaiction/ui/bottom_navigation/custom_bottom_navigation.dart';
// import 'package:provider/provider.dart';
// import 'db/db_helper.dart';
// import 'ui/home_page.dart';
// import 'ui/theme.dart';
// import 'services/app_theme_notifier.dart';

// Future<void> main() async {
// //You will need to initialize AppThemeNotifier class for theme changes.
//   WidgetsFlutterBinding.ensureInitialized();

//   WidgetsFlutterBinding.ensureInitialized();
//   await DBHelper.initDB();
//   await GetStorage.init(); //this is for Initialized GetStorage
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) {
//     runApp(ChangeNotifierProvider<AppThemeNotifier>(
//       create: (context) => AppThemeNotifier(),
//       child: ChangeNotifierProvider<FxAppThemeNotifier>(
//         create: (context) => FxAppThemeNotifier(),
//         child:const  MyApp(),
//       ),
//     ));
//   });

//   // runApp(ChangeNotifierProvider<AppThemeNotifier>(
//   //   create: (context) => AppThemeNotifier(),
//   //   child: ChangeNotifierProvider<FxAppThemeNotifier>(
//   //     create: (context) => FxAppThemeNotifier(),
//   //     child: const MyApp(),
//   //   ),
//   // ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
    
    
//     Consumer<AppThemeNotifier>(
//         builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
//       return
//           // MaterialApp(
//           //   debugShowCheckedModeBanner: false,
//           // theme: FxAppTheme.getThemeFromThemeMode(),
//           GetMaterialApp(
//         debugShowCheckedModeBanner: false,

//         title: 'Flutter Demo',
//         // translations: LocaleString(),
//         locale: const Locale('tr', 'US'),
//         theme: FxAppTheme.getThemeFromThemeMode(),
//         // Themes.light.copyWith(
//         //   pageTransitionsTheme: const PageTransitionsTheme(
//         //     builders: <TargetPlatform, PageTransitionsBuilder>{
//         //       TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//         //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//         //     },
//         //   ),
//         // ),
//         darkTheme: Themes.dark.copyWith(
//           pageTransitionsTheme: const PageTransitionsTheme(
//             builders: <TargetPlatform, PageTransitionsBuilder>{
//               TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//               TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//             },
//           ),
//         ),
//         themeMode: ThemeServices().theme,
//         home: MyCustomBottomNavigation()
//       // const  HomePage()
//         // ShoppingFullApp()
//         // const SinglePageItem(
//         //   iconData: MdiIcons.shoppingOutline,
//         //   navigation: MyHomePage(),
//         //   title: "Shopping",
//         // ),
//         //ShoppingRegisterScreen()
//         // const MyCustomBottomNavigation()
//       );
//     });

//     // GetMaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     title: 'Flutter Demo',
//     //     translations: LocaleString(),
//     //     locale: const Locale('tr', 'US'),
//     //     theme: Themes.light.copyWith(
//     //       pageTransitionsTheme: const PageTransitionsTheme(
//     //         builders: <TargetPlatform, PageTransitionsBuilder>{
//     //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//     //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//     //         },
//     //       ),
//     //     ),
//     //     darkTheme: Themes.dark.copyWith(
//     //       pageTransitionsTheme: const PageTransitionsTheme(
//     //         builders: <TargetPlatform, PageTransitionsBuilder>{
//     //           TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//     //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//     //         },
//     //       ),
//     //     ),
//     //     themeMode: ThemeServices().theme,
//     //     home: CustomBottomNavigationWidget());
//   }
// }

// // git branch -M master
// //git remote add origin https://github.com/najeebaslan/issue.git
// // git push -u origin master