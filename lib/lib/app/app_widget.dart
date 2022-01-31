import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  @override
  void initState(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Observer(builder: (context){
      return MaterialApp (
        title: "App Appium",
        theme: ThemeData(primaryColor: Colors.teal, bottomAppBarColor: Colors.tealAccent,),
        debugShowCheckedModeBanner: false,
        initialRoute: Modular.initialRoute,
        navigatorObservers: [],
      ).modular();
    });
  }
}
