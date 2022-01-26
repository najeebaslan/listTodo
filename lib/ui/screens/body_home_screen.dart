import 'package:flutter/material.dart';
import 'package:local_notifaiction/models/task.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:local_notifaiction/services/my_size.dart';
import 'package:local_notifaiction/ui/widgets/style.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:nb_utils/nb_utils.dart';

class BodyHomeScreen extends StatefulWidget {
  final Issue? issue;
  final int lingth;
  const BodyHomeScreen(
    this.issue,
    this.lingth, {
    Key? key,
  }) : super(key: key);

  @override
  _BodeMain createState() => _BodeMain();
}

class _BodeMain extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: cardUsers(),
          )
        ],
      ),
    );
  }

  cardUsers() {
    // DateTime dateTime1 = DateTime.parse('2021-12-06 01:50:00.000');
    print(widget.issue!.date.toString());
    /* This is to see how much is left to alert in the first week */

    String weekAlarm =
        UtilsFunctions.remainingDays(widget.issue!.date, 144).toString();
    //this is for check validity data
    String checkeWeek = weekAlarm.toString().split('|')[1].toString();
/* This is to see how much is left to alert in the first 45 day */
    String first45DayAlarm =
        UtilsFunctions.remainingDays(widget.issue!.date, 1224).toString();
    //this is for check validity data
    String checkefirst45Day =
        first45DayAlarm.toString().split('|')[1].toString();

/* This is to see how much is left to alert in the next 45 day*/
    String next45DayAlarm =
        UtilsFunctions.remainingDays(widget.issue!.date, 2304).toString();
    String checkeNext45Day = next45DayAlarm.toString().split('|')[1].toString();

    String name = widget.issue?.name.toString() ?? "";
    String issue = widget.issue?.issue.toString() ?? "";
    String date = widget.issue!.date.toString();
    // DateTime.now().year;
    DateTime dateTime = DateTime.parse(
      widget.issue!.date.toString(),
    );
    var thieWeek = dateTime.add(const Duration(hours: 144));
    var firstNoti = dateTime.add(const Duration(hours: 1224));
    var nextNoti = dateTime.add(const Duration(hours: 2304));

    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      elevation: 5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            5.height,

            //  Wrap(
            //   children: <Widget>[

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    columnData(name, 'الاسم: ', null),
                    columnData(issue, 'التهمة: ', null),
                    5.height,
                    columnData(UtilsFunctions.spliteDate(date),
                        'تاريخ الدخول: ', 14.5),
                  ],
                ).expand(),
                name.length < 7
                    ? Container(
                        width: 90,
                      )
                    : Container(
                        width: 0,
                      ),
                //This Circal Animation

                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: <Widget>[
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: StyleWidget.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        border: Border.all(
                            width: 4,
                            color: StyleWidget.nearlyDarkBlue.withOpacity(0.2)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            checkeNext45Day != '0'
                                ? next45DayAlarm
                                        .toString()
                                        .split('|')[0]
                                        .toString()
                                    // +' % '
                                    +
                                    next45DayAlarm
                                        .toString()
                                        .split('|')[1]
                                        .toString()
                                : 'مكتمل',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: StyleWidget.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.0,
                              color: StyleWidget.nearlyDarkBlue,
                            ),
                          ),
                          Text(
                            'المدة الكاملة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: StyleWidget.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              letterSpacing: 0.0,
                              color: StyleWidget.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(bottom: 4, right: 5, top: 4, left: 0),
                    //نجيب اسماعيل  عبده علي عسلان
                    CustomPaint(
                      painter: CurvePainter(
                          colors: [
                            StyleWidget.nearlyDarkBlue,
                            HexColor("#8A98E8"),
                            HexColor("#8A98E8")
                          ],
                          angle:
                              //360,
                              UtilsFunctions.animiatiopnNext45Day(
                                      checkeNext45Day != '0'
                                          ? int.parse(next45DayAlarm
                                              .toString()
                                              .split('|')[0]
                                              .toString())
                                          : int.parse(next45DayAlarm
                                              .toString()
                                              .split('|')[1]
                                              .toString()),
                                      1) *
                                  (9)),
                      child: const SizedBox(
                        width: 95,
                        // MySize.size95,
                        height: 95,
                      ),
                    ),
                    //   ],
                    // ),
                    // ),
                  ],
                ),
                // ),
              ],
            ).paddingAll(MySize.size6!),
            2.height,
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2.100,
              color: StyleWidget.background,
            ),
            5.height,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'التنبية الاول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: StyleWidget.fontName,
                        fontSize: 13,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: StyleWidget.darkText,
                      ),
                    ),
                    Container(
                      height: 4,
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
                            //(widget.lingth - 0.0),
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                HexColor('#87A0E5'),
                                HexColor('#87A0E5').withOpacity(0.5),
                              ]),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          )
                        ],
                      ),
                    ).paddingTop(4),
                    Text(
                      '${UtilsFunctions.spliteDate(thieWeek.toString())}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: StyleWidget.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: StyleWidget.grey.withOpacity(0.5),
                      ),
                    ).paddingTop(6),
                  ],
                ).expand(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'التنبية الثاني',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontSize: 13,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                            color: StyleWidget.darkText,
                          ),
                        ),
                        Container(
                          height: 4,
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
                                height: 4,
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
                        ),
                        Text(
                          '${UtilsFunctions.spliteDate(firstNoti.toString())}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: StyleWidget.grey.withOpacity(0.5),
                          ),
                        ).paddingTop(4),
                      ],
                    ),
                  ],
                ).expand(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'التنبية الثالث',
                          style: TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontSize: 13,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                            color: StyleWidget.darkText,
                          ),
                        ),
                        Container(
                          height: 4,
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
                                height: 4,
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
                        Row(
                          children: [
                            Text(
                              ' ${UtilsFunctions.spliteDate(nextNoti.toString())} ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: StyleWidget.fontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: StyleWidget.grey.withOpacity(0.5),
                              ),
                            ).paddingTop(6),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).expand(),
              ],
            ).paddingOnly(left: 10, right: 10, top: 5),
            10.height,
          ],
        ),

        // ),
      ).paddingOnly(left: 7, right: 7, bottom: 0),
    );
  }

  columnData(data, text, double? myFalse) {
    return
        // Column(
        //   children: <Widget>[
        Row(
      children: <Widget>[
        Flexible(
          child: Text(
            text.length > 22 ? text.substring(0, 20) + '...' : text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                // fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                // 13,
                overflow: TextOverflow.ellipsis,
                letterSpacing: -0.1,
                color: Colors.black
                //StyleWidget.darkerText.withOpacity(0.9)
                // StyleWidget.darkText,
                // StyleWidget.grey.withOpacity(0.7),
                ),
          ),
        ),
        Flexible(
          child: Text(
            data.length > 20 ? data.substring(0, 20) + '...' : data,
            textAlign: TextAlign.center,
            style: TextStyle(
                // fontFamily: 'Cairo',
                fontSize: myFalse ?? 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
                overflow: TextOverflow.ellipsis,
                color: StyleWidget.dark_grey.withOpacity(0.9)
                //Colors.black
                // StyleWidget.darkText,
                ),
          ),
        ),
        // ],
        // ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  final double angle;
  final List<Color> colors;

  CurvePainter({required this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    // ignore: unnecessary_null_comparison
    if (colors != null) {
      colorsList = colors;
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    const gradient1 = SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = Paint();
    cPaint.shader = gradient1.createShader(rect);
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(const Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
