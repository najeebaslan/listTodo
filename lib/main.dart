import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_notifaiction/services/theme_services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'Api/issue_provider.dart';
import 'db/db_helper.dart';
import 'services/app_theme_notifier.dart';
import 'ui/screens/navigation_bar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init(); //this is for Initialized GetStorage
//نجيب اسماعيل عبدة علي عسلان
  await initialize(); //this is for package nb_utils
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<AppThemeNotifier>(
          create: (_) => AppThemeNotifier(),
        ),
        ChangeNotifierProvider<FxAppThemeNotifier>(
          create: (_) => FxAppThemeNotifier(),
        ),
        ChangeNotifierProvider<IssueProvder>(
          create: (_) => IssueProvder(),
        ),
      ], child: const MyApp()),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FxAppTheme.getThemeFromThemeMode(),
        home: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // translations: LocaleString(),
            locale: const Locale('tr', 'US'),
            theme: FxAppTheme.getThemeFromThemeMode(),
            themeMode: ThemeServices().theme,
            home: const MyNavigationBar()),
      );
    });
  }
}

//1- git add .

//2- git commit -m " new message public"
//git push -u origin master
/*3- git push origin master -f */   // or //    /* 3- git push -u origin master */
//172.27.5.3-172.27.255.254 The new
//172.31.21.3-172.31.25.254 The old
//B8:D7:AF:02:0D:53  



