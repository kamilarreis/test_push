
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:local_notification_awesome/lib/app/app_module.dart';
import 'package:local_notification_awesome/lib/util/external/firebase_config.dart';

import 'lib/app/app_widget.dart';

void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting("pt").then((_) => runApp(ModularApp(module: AppModule(),child: AppWidget(),)));
  final firebaseMessaging = FCM();
  firebaseMessaging.setNotifications();
}