import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:local_notifaiction/services/app_theme_notifier.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/services/notification_services.dart';
import 'package:local_notifaiction/shopping/shopping_home_screen.dart';
import 'package:local_notifaiction/shopping/shopping_profile_screen.dart';
import 'package:local_notifaiction/shopping/shopping_search_screen.dart';
import 'package:local_notifaiction/ui/widgets/custom_transitions.dart';
import 'package:local_notifaiction/utils/error_response.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:provider/provider.dart';
import '../../services/app_theme_notifier.dart';
import 'add_issue_screen.dart';
import 'home_screen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  GSMainScreenState createState() => GSMainScreenState();
}

class GSMainScreenState extends State<MyNavigationBar> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();

    // setLangaueg();
  }

  late MyNavigationBarTheme navigationBarTheme;
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);

    var myHeight = MediaQuery.of(context).size.height;
    var myWidth = MediaQuery.of(context).size.width;

    log(myHeight.toString() + 'Height');
    log(myWidth.toString() + 'Width');

    log(context.height.toString() + 'myHeight');
    log(context.width.toString() + 'myWidth');

    themeData = Theme.of(context);
    final List<Widget> pages = [
      const HomeScreen(),
      const ShoppingSearchScreen(),
      const AddTaskPage(
        issue: null,
      ),
      ShoppingProfileScreen(
        root: context,
      )
    ];

    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      navigationBarTheme =
          AppTheme.getNavigationThemeFromMode(value.themeMode());
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            appBar: customAppBar(context, notifyHelper),
            key: globalScaffoldKey,
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: onTabTapped,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(color: Color(0xff3d63ff)),
              unselectedIconTheme: IconThemeData(color: Colors.grey[300]),
              selectedItemColor:
                  Get.isDarkMode ? const Color(0xFF757575) : Colors.black,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.grey[700]),
                    activeIcon: const Icon(
                      Icons.home,
                      color: Color(0xff3d63ff),
                    ),
                    label: "الصفحة الرئيسية"),
                BottomNavigationBarItem(
                    //MdiIcons.tune,
                    icon: Icon(
                      Icons.filter_alt,
                      color: Colors.grey[700],
                    ),
                    activeIcon: const Icon(
                      Icons.filter_alt,
                      color: Color(0xff3d63ff),
                    ),
                    label: "الفلترة"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box,
                    color: Colors.grey[700],
                  ),
                  activeIcon: const Icon(
                    Icons.add_box,
                    color: Color(0xff3d63ff),
                  ),
                  label: "اظافة متهم",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[700],
                  ),
                  label: "الاعدادات",
                  activeIcon: const Icon(
                    Icons.settings,
                    color: Color(0xff3d63ff),
                  ),
                ),
              ],
            ),
          ));
    });
  }

  PreferredSizeWidget customAppBar(BuildContext context, notifyHelper) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          // ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title: 'تغير الموضوع',
            body: Get.isDarkMode ? " الفاتح" : " الداكن",
          );
          // notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : MdiIcons.weatherNight,
          size: 22,

          color: FxAppTheme.theme.colorScheme.primary,
          // color: Get.isDarkMode ? Colors.grey : Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            ErrorResponse.awesomeDialog(
              error: 'سيتم تفعيل الخدمة قربياً',
              context: context,
              dialogType: DialogType.INFO,
            );

            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) => SelectThemeDialog());
            // await MySharedPreferences.getLanguageType();
          },
          icon: Icon(
            // MdiIcons.languageC,
            Icons.language,
            size: 25,

            color: FxAppTheme.theme.colorScheme.primary,
          ),
        ),
        20.width,
        Container(
          padding: const EdgeInsets.only(right: 15, top: 5),
          //  FxSpacing.nBottom(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // FxText.sh1("Welcome", letterSpacing: 0, fontWeight: 600),
              InkWell(
                onTap: () => Navigator.push(
                    context, CostumNvigator(NotificationDialog())),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      MdiIcons.bellOutline,
                      color: FxAppTheme.theme.colorScheme.onBackground
                          .withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: FxContainer.rounded(
                        padding: FxSpacing.zero,
                        height: 14,
                        width: 14,
                        color: FxAppTheme.theme.colorScheme.primary,
                        child: Center(
                          child: FxText.overline(
                            "2",
                            color: FxAppTheme.theme.colorScheme.onPrimary,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
