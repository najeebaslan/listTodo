
// import 'package:UIKit/utils/Generator.dart';
// import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:local_notifaiction/shopping/generator.dart';
import 'package:local_notifaiction/services/app_theme_notifier.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';

// import '../../AppTheme.dart';
// import '../../AppThemeNotifier.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => TermsDialog());
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                ),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                        ),
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          "Read Terms",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
                              color: themeData.colorScheme.onPrimary),
                        )),
                  ),
                )));
      },
    );
  }
}

class TermsDialog extends StatefulWidget {
  @override
  _TermsDialogState createState() => _TermsDialogState();
}

class _TermsDialogState extends State<TermsDialog> {
  bool? isChecked = false;

  late String text1,text2,text3,text4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text1 = Generator.getDummyText(16);
    text2 = Generator.getDummyText(12);
    text3 = Generator.getDummyText(20);
    text4 = Generator.getDummyText(24);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Center(
                    child: Text(
                        "Terms \& Conditions",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ).expand( ),
                Icon(MdiIcons.download)
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                "1. Return policy",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                text1,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,


                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Text(
                "2. Replace Policy",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                text2,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                    height: 1.25,letterSpacing: 0.1
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Text(
                "3. Coupon policy",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                text3,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                    height: 1.25,letterSpacing: 0.1
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Text(
                "4. Other",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                text4,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                    height: 1.25,letterSpacing: 0.1
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  Container(
                        margin: EdgeInsets.only(left: MySize.size0!),
                        child: Text(
                          "Buying this product, you agree to the all conditions",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                        )).expand( )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Decline",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 600))),
                    TextButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Accept",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
                              color: themeData.colorScheme.primary),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
