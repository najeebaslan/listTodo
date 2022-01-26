// import 'dart:io';

// import 'package:device_info/device_info.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// 
// import 'package:local_notifaiction/main.dart';
// import 'package:local_notifaiction/models/task.dart';
// import 'package:local_notifaiction/ui/notified_page.dart';
// import 'package:local_notifaiction/ui/theme.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class UtileNotification{


// /* --------------------------- await  ضروري استخدام ال  ------------------------------ */
// //---------------------------------------------------------\
// /* 
// جدولة يوميًا 10:00:00 صباحًا إشعار في '
//                             المنطقة الزمنية المحلية */

//  tz.TZDateTime _nextInstanceOfTenAM() {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }



// //-----------------------------------\
// /* حدد موعدًا أسبوعيًا الساعة 10:00 صباحًا للإشعار في '
//                             المنطقة الزمنية المحلية */


// /* --------------------------- await  ضروري استخدام ال  ------------------------------ */
// //----------------------------------
// /* الجدول الأسبوعي يوم الاثنين 10:00:00 صباحًا للإخطار '
// "في منطقتك الزمنية المحلية */
// //AND USE
// /* جدول شهريًا الإثنين 10:00:00 صباحًا إشعار في '
// منطقتك بالتوقيت المحلي */               
// tz.TZDateTime _nextInstanceOfMondayTenAM() {
//     tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
//     while (scheduledDate.weekday != DateTime.monday) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }



//   //---------------------------------------------

// /* --------------------------- await  ضروري استخدام ال  ------------------------------ */


// /* إظهار الإخطار الذي تنتهي مهلته بعد 3 ثوانٍ */
//   Future<void> _showTimeoutNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('silent channel id', 'silent channel name',
//             channelDescription: 'silent channel description',
//             timeoutAfter: 3000,
//             styleInformation: DefaultStyleInformation(true, true));
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(0, 'timeout notification',
//         'Times out after 3 seconds', platformChannelSpecifics);
//   }
  


// //-----------------------------------------------------------
// //إنشاء قناة الإخطار

//    Future<void> _createNotificationChannel(BuildContext context) async {
//     const AndroidNotificationChannel androidNotificationChannel =
//         AndroidNotificationChannel(
//       'your channel id 2',
//       'your channel name 2',
//       description: 'your channel description 2',
//     );
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidNotificationChannel);

//     await showDialog<void>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               content:
//                   Text('Channel with name ${androidNotificationChannel.name} '
//                       'created'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('OK'),
//                 ),
//               ],
//             ));
//   }

//   //-----------------------------------------------------
//   /* حذف قناة الإعلام */
//   Future<void> _deleteNotificationChannel(BuildContext context) async {
//     const String channelId = 'your channel id 2';
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.deleteNotificationChannel(channelId);

//     await showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: const Text('Channel with id $channelId deleted'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

// //-----------------------------------------------------------------
// //احصل على قنوات الإخطار
//   Future<void> _getNotificationChannels(BuildContext context) async {
//     final Widget notificationChannelsDialogContent =
//         await _getNotificationChannelsDialogContent();
//     await showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: notificationChannelsDialogContent,
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//    Future<Widget> _getNotificationChannelsDialogContent() async {
//     try {
//       final List<AndroidNotificationChannel>? channels =
//           await flutterLocalNotificationsPlugin
//               .resolvePlatformSpecificImplementation<
//                   AndroidFlutterLocalNotificationsPlugin>()!
//               .getNotificationChannels();

//       return Container(
//         width: double.maxFinite,
//         child: ListView(
//           children: <Widget>[
//             const Text(
//               'Notifications Channels',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const Divider(color: Colors.black),
//             if (channels?.isEmpty ?? true)
//               const Text('No notification channels')
//             else
//               for (AndroidNotificationChannel channel in channels!)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text('id: ${channel.id}\n'
//                         'name: ${channel.name}\n'
//                         'description: ${channel.description}\n'
//                         'groupId: ${channel.groupId}\n'
//                         'importance: ${channel.importance.value}\n'
//                         'playSound: ${channel.playSound}\n'
//                         'sound: ${channel.sound?.sound}\n'
//                         'enableVibration: ${channel.enableVibration}\n'
//                         'vibrationPattern: ${channel.vibrationPattern}\n'
//                         'showBadge: ${channel.showBadge}\n'
//                         'enableLights: ${channel.enableLights}\n'
//                         'ledColor: ${channel.ledColor}\n'),
//                     const Divider(color: Colors.black),
//                   ],
//                 ),
//           ],
//         ),
//       );
//     } on PlatformException catch (error) {
//       return Text(
//         'Error calling "getNotificationChannels"\n'
//         'code: ${error.code}\n'
//         'message: ${error.message}',
//       );
//     }
//   }



//   //----------------------------------------------
// //احصل على إشعارات نشطة

//   Future<void> _getActiveNotifications(BuildContext context) async {
//     final Widget activeNotificationsDialogContent =
//         await _getActiveNotificationsDialogContent();
//     await showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: activeNotificationsDialogContent,
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//    Future<Widget> _getActiveNotificationsDialogContent() async {
//     final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     if (!(androidInfo.version.sdkInt >= 23)) {
//       return const Text(
//         '"getActiveNotifications" is available only for Android 6.0 or newer',
//       );
//     }

//     try {
//       final List<ActiveNotification>? activeNotifications =
//           await flutterLocalNotificationsPlugin
//               .resolvePlatformSpecificImplementation<
//                   AndroidFlutterLocalNotificationsPlugin>()!
//               .getActiveNotifications();

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const Text(
//             'Active Notifications',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const Divider(color: Colors.black),
//           if (activeNotifications!.isEmpty)
//             const Text('No active notifications'),
//           if (activeNotifications.isNotEmpty)
//             for (ActiveNotification activeNotification in activeNotifications)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'id: ${activeNotification.id}\n'
//                     'channelId: ${activeNotification.channelId}\n'
//                     'title: ${activeNotification.title}\n'
//                     'body: ${activeNotification.body}',
//                   ),
//                   const Divider(color: Colors.black),
//                 ],
//               ),
//         ],
//       );
//     } on PlatformException catch (error) {
//       return Text(
//         'Error calling "getActiveNotifications"\n'
//         'code: ${error.code}\n'
//         'message: ${error.message}',
//       );
//     }
//   }
// }