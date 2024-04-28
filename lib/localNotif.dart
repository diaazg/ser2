import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  //initialize notification

  static final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) => null);
  }

  //show simple notif
  static Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'medicines',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  //periodic notifications

  static Future showPeriodicNotifications(
      {int id = 0, String? title, String? body, String? payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 2', 'medicines',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        1, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  //schedule notifications
  //first we should initilaize timezone in main function
  //by import 'package:timezone/data/latest.dart' as tz;
  //and put tz.initializeTimeZones(); in main function
  static Future showScheduleNotifications(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduleDate}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel 3', 'medicines',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
            tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
