import 'dart:convert';
import 'dart:developer';

import 'package:coffee_now/app.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handler(RemoteMessage message) async {
  log("title : ${message.notification?.title}");
  log("body : ${message.notification?.body}");
  log("payload : ${message.data}");
}

abstract class APIMessagingService {
  Future<void> initNotifications();
  Future initPushNotifications();

  Future<void> initLocalNotification();
}

class APIMessagingServiceImpl implements APIMessagingService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notitfication",
    description: "this channel is used for local notification",
    importance: Importance.defaultImportance,
    playSound: true,
    enableLights: true,
    enableVibration: true,
    showBadge: true,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  @override
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    log("Token : $fcmToken");
    await initPushNotifications();
    await initLocalNotification();
  }

  static void handelMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      Routes.notification,
      arguments: message,
    );
  }

  @override
  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.getInitialMessage().then(
          (value) => handelMessage(value),
        );
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handelMessage(event);
    });
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      if (notification == null) return;

      await _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidChannel.id,
              androidChannel.name,
              channelDescription: androidChannel.description,
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }

  @override
  Future<void> initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: ios);
    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotificationResponse,
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(androidChannel);
  }

  static void _onDidReceiveBackgroundNotificationResponse(details) {
    final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
    handelMessage(message);
  }

  static void _onDidReceiveNotificationResponse(details) {
    final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
    handelMessage(message);
  }
}
