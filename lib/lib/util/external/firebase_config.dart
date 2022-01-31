import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:local_notification_awesome/lib/util/component/utilities.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data.containsKey('data')) {
    // Handle data message
    final data = message.data['data'];
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final notification = message.data['notification'];
  }
  // Or do other work.
}

class FCM{
  final _firebaseMessaging = FirebaseMessaging.instance;

  String streamCtlr = "";
  String titleCtlr = "";
  String bodyCtlr = "";

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
          (message) async {
        if (message.data.containsKey('data')) {
          // Handle data message
          streamCtlr = message.data['data'].toString();
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          streamCtlr = message.data['notification'];
        }
        // Or do other work.
        titleCtlr = message.notification!.title!;
        bodyCtlr + message.notification!.body!;
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: createUniqueId(),
            channelKey: 'basic_channel',
            title:
            '${Emojis.money_money_bag + Emojis.plant_cactus} ' + titleCtlr,
            body: bodyCtlr,
            bigPicture: 'asset://assets/app_icon.png',
            notificationLayout: NotificationLayout.BigPicture,
          ),
        );
      },
    );
    // With this token you can test it easily on your phone
    final token = _firebaseMessaging.getToken().then((value) => log('Token: $value'));

  }
  dispose() {
    // streamCtlr.close();
    // bodyCtlr.close();
    // titleCtlr.close();
  }
}