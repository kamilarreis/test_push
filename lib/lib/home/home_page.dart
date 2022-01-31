import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_notification_awesome/lib/home/cubit/home_cubit.dart';
import 'package:local_notification_awesome/lib/home/cubit/home_state.dart';
import 'package:local_notification_awesome/lib/home/home_component.dart';
import 'package:local_notification_awesome/lib/plant_stats_page.dart';
import 'package:local_notification_awesome/lib/util/component/utilities.dart';
import 'package:local_notification_awesome/lib/util/component/widgets.dart';
import 'package:local_notification_awesome/lib/util/external/firebase_config.dart';
import 'package:local_notification_awesome/lib/util/external/notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => HomeComponent().getAlert(context),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Notification Created on ${notification.channelKey}',
        ),
      ));
    });

    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const PlantStatsPage(),
        ),
        (route) => route.isFirst,
      );
    });
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
      return BlocProvider<HomeCubit>(
        create: (context) => Modular.get<HomeCubit>(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingState) {
               return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const AppBarTitle(),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Modular.to.pushReplacementNamed(
                              Modular.initialRoute + "page", forRoot: true);
                        },
                        icon: const Icon(
                          Icons.insert_chart_outlined_rounded,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PlantImage(),
                        const SizedBox(
                          height: 25,
                        ),
                        HomePageButtons(
                          onPressedOne: ()async{
                              createPlantFoodNotification(context);
                              },
                            onPressedTwo: () async {
                            NotificationWeekAndTime? pickedSchedule =
                            await pickSchedule(context);

                            if (pickedSchedule != null) {
                              createWaterReminderNotification(pickedSchedule);
                            }
                          },
                          onPressedThree: cancelScheduledNotifications,
                        ),
                      ],
                    ),
                  ),
                );
              }
              else if(state is SuccessState){
                FCM().setNotifications();
              }
              return Container();
            },
          ),
        ),
      );
    }
}
