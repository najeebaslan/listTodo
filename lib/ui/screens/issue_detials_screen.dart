import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:local_notifaiction/models/task.dart';
import 'package:local_notifaiction/services/app_theme_notifier.dart';
import 'package:local_notifaiction/services/apptheme.dart';
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/widgets/bottom_sheet.dart';
import 'package:local_notifaiction/ui/widgets/decrostion.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';

/* يجب اضافة التعديل والحذف وانهاء المهمة في هذه الصفحة */
class IssueDetails extends StatefulWidget {
  final Issue task;
  const IssueDetails(
    this.task, {
    Key? key,
  }) : super(key: key);

  @override
  State<IssueDetails> createState() => _IssueDetailsState();
}

class _IssueDetailsState extends State<IssueDetails> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  static const Color HMColorWhite = Color(0xFFffffff);
  bool _hasCallSupport = false;
  Future<void>? _launched;
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.task.date.toString() + 'wwwwwwwwwwwwwwwwww');
    // DateTime dateTime1 = DateTime.parse('2021-12-07 10:00:00.000');

    // DateTime dateTime = DateTime.parse('2021-11-00 00:00:00.000');
    /* This is to see how much is left to alert in the first week */
    String weekAlarm =
        UtilsFunctions.remainingDays(widget.task.date, 144).toString();
    //this is for check validity data
    String checkeWeek = weekAlarm.toString().split('|')[1].toString();
/* This is to see how much is left to alert in the first 45 day */
    String first45DayAlarm =
        UtilsFunctions.remainingDays(widget.task.date, 1224).toString();
    //this is for check validity data
    String checkefirst45Day =
        first45DayAlarm.toString().split('|')[1].toString();
/* This is to see how much is left to alert in the next 45 day*/
    String next45DayAlarm =
        UtilsFunctions.remainingDays(widget.task.date, 2304).toString();
    //this is for check validity data
    String checkeNext45Day = next45DayAlarm.toString().split('|')[1].toString();
/* this is enter issue */
    String enter = UtilsFunctions.datas(
        UtilsFunctions.replisDate1(widget.task.date, 0), 1);

    /* this is first  week */
    String week = UtilsFunctions.datas(
        UtilsFunctions.replisDate1(widget.task.date, 144), 1);
    /* this is first 45 day */

    String first45 = UtilsFunctions.datas(
        UtilsFunctions.replisDate1(widget.task.date, 1224), 1);
    /* htis is netx 45 day  */
    String next45 = UtilsFunctions.datas(
        UtilsFunctions.replisDate1(widget.task.date, 2304), 1);
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                backgroundColor: StyleWidget.white,
                appBar: AppBar(
                  backgroundColor: context.theme.backgroundColor,
                  //Get.isDarkMode ? Colors.grey[600] : Colors.white,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black
                        // Get.isDarkMode ? Colors.white : Colors.grey,
                        ),
                  ),
                  title: Text(
                    widget.task.name.toString(),
                    style: const TextStyle(
                        color: Colors.black, fontFamily: StyleWidget.fontName),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'الاسم: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.task.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            height: MySize.size26,
                            width: MySize.size30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              color: primaryClr,
                            ),
                            child: Icon(
                              Icons.keyboard_control,
                              size: MySize.size22,
                              color: StyleWidget.white,
                            ).onTap(() {
                              ShowBottomSheet.costumBottomSheet(
                                  issue: widget.task,
                                  context: context,
                                  setState: setState,
                                  key: 1,
                                  themeData: themeData);
                            }),
                          ),
                        ],
                      ),
                      5.height,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'منذ: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: enter,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          8.width,
                          Icon(
                            MdiIcons.earth,
                            size: MySize.size20,
                            color: primaryClr,
                          ),
                        ],
                      ),
                      5.height,
                      Row(
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'الهاتف: ',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.task.phoneNu.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      3.height,
                      divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'التنبية الاول: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: week,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      3.height,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'يتبقى: ',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: checkeWeek != '0'
                                          ? weekAlarm
                                                  .toString()
                                                  .split('|')[0]
                                                  .toString() +
                                              weekAlarm
                                                  .toString()
                                                  .split('|')[1]
                                                  .toString()
                                          : weekAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          8.width,
                          Container(
                            height: 8,
                            width: 70,
                            decoration: BoxDecoration(
                              color: HexColor('#87A0E5').withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Wrap(
                              children: <Widget>[
                                Container(
                                  width: UtilsFunctions.animiatiopnWeek(
                                      checkeWeek != '0'
                                          ? int.parse(weekAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString())
                                          : 0,
                                      0),
                                  height: 8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      HexColor('#87A0E5'),
                                      HexColor('#87A0E5').withOpacity(0.5),
                                    ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                )
                              ],
                            ),
                          ).paddingTop(4),
                        ],
                      ),
                      3.height,
                      divider(),

//Next
                      3.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'التنبية الثاني: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: first45,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      3.height,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'يتبقى: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: checkefirst45Day != '0'
                                          ? first45DayAlarm
                                                  .toString()
                                                  .split('|')[0]
                                                  .toString() +
                                              first45DayAlarm
                                                  .toString()
                                                  .split('|')[1]
                                                  .toString()
                                          : first45DayAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          8.width,
                          Container(
                            height: 8,
                            width: 70,
                            decoration: BoxDecoration(
                              color: HexColor('#F56E98').withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Wrap(
                              children: <Widget>[
                                Container(
                                  width: UtilsFunctions.animiatiopnFirst45Day(
                                      checkefirst45Day != '0'
                                          ? int.parse(first45DayAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString())
                                          : 0,
                                      0),
                                  height: 8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      HexColor('#F56E98').withOpacity(0.7),
                                      HexColor('#F56E98'),
                                    ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ).paddingTop(4),
                        ],
                      ),

                      3.height,
                      divider(),

                      //Therd

                      3.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'التنبية الثالث: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: next45,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      3.height,
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'يتبقى: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: checkeNext45Day != '0'
                                          ? next45DayAlarm
                                                  .toString()
                                                  .split('|')[0]
                                                  .toString() +
                                              next45DayAlarm
                                                  .toString()
                                                  .split('|')[1]
                                                  .toString()
                                          : next45DayAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          8.width,
                          Container(
                            height: 8,
                            width: 70,
                            decoration: BoxDecoration(
                              color: HexColor('#F1B440').withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Wrap(
                              children: <Widget>[
                                Container(
                                  width: UtilsFunctions.animiatiopnNext45Day(
                                      checkeNext45Day != '0'
                                          ? int.parse(next45DayAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString())
                                          : 0,
                                      0),
                                  // ((widget.lingth
                                  // (snapshot.data.length)
                                  // -
                                  // 0.0)),
                                  height: 8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      HexColor('#F1B440').withOpacity(0.7),
                                      HexColor('#F1B440'),
                                    ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ).paddingTop(4),
                        ],
                      ),
                      5.height,

                      divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'رقم القضية: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.task.issueNumber.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )),
                          4.width,
                          const Text(
                            'النشاط => ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          widget.task.isCompleted == 0
                              ? Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: MySize.size36,
                                )
                              : Icon(
                                  Icons.dangerous_outlined,
                                  color: Colors.red,
                                  size: MySize.size36,
                                ),
                        ],
                      ),
                      5.height,

                      divider(),
                      Row(
                        children: [
                          const Text("التواصل بوكيل المتهم",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500))
                              .expand(),
                          Container(
                            width: 35,
                            height: 35,
                            child: const Icon(Icons.call, color: HMColorWhite)
                                .onTap(
                              _hasCallSupport
                                  ? () => setState(() {
                                        _launched = _makePhoneCall(
                                            widget.task.phoneNu.toString());
                                      })
                                  : null,
                            ),
                            decoration:
                                const BoxDecoration(color: Colors.greenAccent),
                          )
                              .cornerRadiusWithClipRRect(16)
                              .paddingOnly(left: 8, right: 8),
                          20.width,
                          Container(
                            width: 35,
                            height: 35,
                            child: const Icon(
                              Icons.message_rounded,
                              color: HMColorWhite,
                            ).onTap(
                              _hasCallSupport
                                  ? () => setState(() {
                                        _launched = smsMessage(
                                            widget.task.phoneNu.toString());
                                      })
                                  : null,
                            ),
                            decoration:
                                const BoxDecoration(color: Color(0xFF2979ff)),
                          )
                              .cornerRadiusWithClipRRect(16)
                              .paddingOnly(left: 4, right: 4),
                        ],
                      ),

                      4.height,
                      divider(),
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  text: 'الملاحظة: ',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.task.note.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                          4.width,
                        ],
                      ),
                    ],
                  ),
                ).paddingAll(10)),
          ));
    });
  }

  smsMessage(String? text) async {
    // Android
    var uri = 'sms:+$text?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      var uri = 'sms:+$text?body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}

Widget divider() {
  return Row(
    children: const [
      Expanded(
        child: Divider(
          color: Color(0xFF000000),
        ),
      )
    ],
  );
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;
  final Color color;
  final Color colorTitle;
  final Color colorshow;
  final FontWeight fontWeight;
  final double? fontSize;
  const DescriptionTextWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.colorshow,
      required this.colorTitle,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  bool flag = true;
  late String firstHalf;
  late String secondHalf;
  @override
  void initState() {
    super.initState();

    if (widget.text.length > 20) {
      firstHalf = widget.text.substring(0, 20);
      secondHalf = widget.text.substring(20, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: secondHalf.isEmpty
          ? Text(
              secondHalf,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: StyleWidget.fontName,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
                color: widget.color,
              ),
            ).paddingOnly(left: 100.0)
          : Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'الملاحظة ',
                    style: TextStyle(
                      fontFamily: StyleWidget.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      overflow: TextOverflow.clip,
                      letterSpacing: -0.1,
                      color: widget.colorTitle,

                      // fontFamily: 'Cairo',
                      // fontSize: 14,
                      // letterSpacing: -0.2,
                      // color:widget.colorTitle ,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: flag
                              ? (firstHalf + "...")
                              : (firstHalf + secondHalf),
                          style: TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontSize: widget.fontSize,
                            letterSpacing: -0.2,
                            fontWeight: widget.fontWeight,
                            color: widget.color,
                          )),
                    ],
                  ),
                ).paddingOnly(left: 100.0),

                // ),
                // Text(
                //   flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontFamily: 'Cairo',
                //     fontSize: 14,
                //     letterSpacing: -0.2,
                //     color: widget.color,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      flag ? "أضهار المزيد" : "أضهار أقل",
                      style: TextStyle(color: widget.colorshow),
                    ),
                  ],
                ).onTap(() {
                  setState(() {
                    flag = !flag;
                  });
                }).paddingOnly(right: 100.0, left: 12),
              ],
            ),
    );
  }
}

class FxDashedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const FxDashedDivider(
      {this.height = 1,
      this.color = Colors.black,
      this.dashWidth = 10,
      this.dashSpace = 10});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
