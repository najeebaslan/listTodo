//ignore_for_file: avoid_print
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:local_notifaiction/ui/screens/notified_page_screen.dart';
import 'package:local_notifaiction/utils/utils_functions.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initializeNotification() async {
    await _configureLocalTimezone();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      "app_icon",
    );

    //--------------------------------------------------

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  //--------------------------------------------------
  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'repeating description',
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
      icon: 'app_icon',
      color: primaryClr,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    //--------------------------------------------------
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      //this is push one notification
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

  //--------------------------------------------------
  Future<void> scheduledNotification(
    int id,
    DateTime dateTime,
    String name,
    String issue,
    String note,
  ) async {
    /* ------------------------ ===============   This is Notification for First Test me   ===========--------------------------------------------- */
    DateTime dateTimePM = DateTime(
        dateTime.year, dateTime.month, dateTime.day, 20); //this is = 08:00 PM
    DateTime dateTimeAM = DateTime(
        dateTime.year, dateTime.month, dateTime.day, 7); //this is = 07:00 AM
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //     id + 1,
    //     ' التجربة $name  الساعة ${customTimes(dateTimeAM.toString(), 24)}',
    //     // ' سينتهي التنبية الاول ل $name يوم غداً',
    //     ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTime.toString())}',
    //     _convertTime(dateTime.add(const Duration(seconds: 2))),
    //     const NotificationDetails(
    //         android: AndroidNotificationDetails(
    //       'your channel id',
    //       'your channel name',
    //       channelDescription: 'your channel description',
    //       playSound: true,
    //       priority: Priority.high,
    //       importance: Importance.high,
    //       icon: 'app_icon',
    //       color: primaryClr,
    //       largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    //     )),
    //     androidAllowWhileIdle: true,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.absoluteTime,
    //     matchDateTimeComponents: DateTimeComponents.dateAndTime,
    //     payload: '$issue|${dateTime.toString()}|$name|$note');

    /* ------------------------ ===============   This is Notification for First week   ===========--------------------------------------------- */
    //WEEK
    await scheduledNotification1(
        id + 2,
        dateTime.add(const Duration(hours: 132)),
        ' سينتهي التنبية الاول ل $name يوم غداً',
        ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTimePM.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString()); /* this is push notification  The seventh day, the warning ends */

    await scheduledNotification2(
        id + 3,
        dateTime.add(const Duration(days: 6)),
        'سينتهي التنبية الاول ل $name  الساعة ${customTimes(dateTimeAM.toString(), 144)}',
        // '$name الاول  الساعة ${customTimes(dateTime.toString(), 168)}',
        ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTime.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString()); /*this is push notification  Today the alert ends*/

// /* ------------------------ ===============   This is Notification for First 45 day   ===========--------------------------------------------- */

//FIRST45DAYS
    await scheduledNotification1(
        id + 4,
        dateTime
            .add(const Duration(hours: 1224))
            .subtract(const Duration(hours: 12)),
        ' سينتهي التنبية الثاني ل $name يوم غداً',
        ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTimePM.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString()); /* this is push notification for The 45th day after the first week has passed */
    await scheduledNotification1(
        id + 5,
        dateTime.add(const Duration(hours: 1224)),
        ' $name  الثاني الساعة ${customTimes(dateTime.toString(), 1224)}',
        'سينتهي التنبية الثاني ل $name  الساعة ${customTimes(dateTimeAM.toString(), 1224)}',
        // 'تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTime.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString()); /*this is push notification for The 45th day after the first week has passed*/

/* ------------------------ ===============   This is Notification for Next 45 day   ===========--------------------------------------------- */

//NEXT45DAYS
    await scheduledNotification1(
        id + 6,
        dateTime
            .add(const Duration(hours: 2304))
            .subtract(const Duration(hours: 12)),
        ' سينتهي التنبية الثالث ل $name يوم غداً',
        ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTimePM.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString()); /* this is push notification for The 45th day after the first 45th day has passed */
    await scheduledNotification1(
        id + 7,
        dateTime.add(const Duration(hours: 2304)),
        // ' $name  الثالث الساعة ${customTimes(dateTime.toString(), 2304)}',

        'سينتهي التنبية الثالث ل $name  الساعة ${customTimes(dateTimeAM.toString(), 2304)}',
        ' تاريخ دخولة في ${UtilsFunctions.spliteDate(dateTime.toString())}',
        issue,
        name,
        dateTime.toString(),
        note.toString());

    /*this is push notification for The 45th day after the first 45th day has passed*/

/* ------------------------ ===============     ===========--------------------------------------------- */
  }

  Future<void> scheduledNotification1(
      int id,
      DateTime dateTime,
      String name,
      String date,
      String issue,
      String date1,
      String name1,
      String note) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        name.toString(),
        date.toString(),
        _convertTime(dateTime),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
          playSound: true,
          priority: Priority.high,
          importance: Importance.high,
          icon: 'app_icon',
          color: primaryClr,
          largeIcon: DrawableResourceAndroidBitmap('app_icon'),
        )),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        payload: '$issue|${date1.toString()}|$name1|$note');
  }

  Future<void> scheduledNotification2(
      int id,
      DateTime dateTime,
      String name,
      String date,
      String issue,
      String date1,
      String name1,
      String note) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        name.toString(),
        date.toString(),
        _convertTime(dateTime),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
          playSound: true,
          priority: Priority.high,
          importance: Importance.high,
          icon: 'app_icon',
          color: primaryClr,
          largeIcon: DrawableResourceAndroidBitmap('app_icon'),
        )),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        payload: '$issue|${date1.toString()}|$name1|$note');
  }

  tz.TZDateTime _convertTime(DateTime dateTime) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduleDate = tz.TZDateTime.from(
      dateTime,
      tz.local,
    );

    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimezone() async {
    try {
      tz.initializeTimeZones();
      final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZone));
    } catch (e) {
      log('NAJEEB ASLAN ERROR===============>$e');
    }
  }
  //--------------------------------------------------

  void requestIOSPermissions() {
    /* this is for IOS */
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
  //--------------------------------------------------

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    if (payload == 'تغير الموضوع') {
      print('Nothing novigater to');
    } else {
      Get.to(() => NotifidePage(lable: payload));
    }
  }
  //--------------------------------------------------

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(const Text('Welcome to flutter'));
  }

 Future cancelNotificationById(id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  customTimes(dateTime, int number) {
    return UtilsFunctions.differintTime(dateTime.toString(), number)
        .toString()
        .split('|')[4]
        .toString();
  }
}
