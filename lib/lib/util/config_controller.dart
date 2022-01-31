import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


class ConfigController {

  static String primaryGradientColor = "#62E949";
  static String secundaryGradientColor = "#2EB74D";
  static String primaryButtonGradientColor = "#00E1EF";
  static String secundaryButtonGradientColor = "#3424F4";
  static String primaryLogin = "#1b2028";
  static String secundaryLogin = "#2a363c";

  String appName = "";

  Color primaryColor = Color.fromARGB(0, 0, 0, 1);

  Color accentColor = Color.fromARGB(0, 0, 0, 1);

  Color primaryColorDark = Color.fromARGB(0, 0, 0, 1);

  Color primaryGradientButtonColor = HexColor.fromHex(primaryButtonGradientColor);

  Color secundaryGradientButtonColor = HexColor.fromHex(secundaryButtonGradientColor);

  Color primaryLoginButtonColor = HexColor.fromHex(primaryLogin);

  Color secundaryLoginButtonColor = HexColor.fromHex(secundaryLogin);

  initialConfig() {
    appName = "App ";
    primaryColor = HexColor.fromHex(primaryGradientColor);
    primaryColorDark = HexColor.fromHex(secundaryGradientColor);
  }

  BoxDecoration defaultGradient() {
   return BoxDecoration (
      gradient: LinearGradient(
       begin: Alignment.topRight,
       end: Alignment.bottomLeft,
       colors: [ primaryColor, primaryColorDark]
   ),
    );
  }

  BoxDecoration defaultGradientBorder() {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ primaryColor, primaryColorDark]
      ),
    );
  }
  BoxDecoration defaultLogin(){
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ primaryLoginButtonColor, secundaryLoginButtonColor]
      ),
    );
  }



  BoxDecoration defaultGradientBorderLeftRight() {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ primaryColor, primaryColorDark]
      ),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    );
  }

  BoxDecoration defaultBorder(Color cor1, Color cor2) {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ cor1, cor2]
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),

    );
  }
  BoxDecoration defaultBorderGradiente(Color cor1, Color cor2) {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ cor1, cor2]
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),

    );
  }

  BoxDecoration defaultButtonGradient() {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ secundaryGradientButtonColor, primaryGradientButtonColor]
      ),
      borderRadius: BorderRadius.all(Radius.circular(3)),
    );
  }

  BoxDecoration defaultButtonGradientRounded() {
    return BoxDecoration (
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ secundaryGradientButtonColor, primaryGradientButtonColor]
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );
  }

  BoxDecoration defaultRadius() {
    return BoxDecoration (
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white
    );
  }

  BoxDecoration defaultRadiusColor(Color color) {
    return BoxDecoration (
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color
    );
  }
  BoxDecoration defaultRadiusTop() {
    return BoxDecoration (
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10) ),
        color: Colors.white
    );
  }
  BoxDecoration defaultBorderRadius(Color color) {
    return BoxDecoration (
      borderRadius: BorderRadius.all(Radius.circular(0)),
      color: color,
      border: Border.all()
    );
  }
  BoxDecoration defaultRadiusWhite() {
    return BoxDecoration (
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Colors.white
    );
  }

  // BoxDecoration defaultButtonGradientCancel() {
  //   return BoxDecoration (
  //     gradient: LinearGradient(
  //         begin: Alignment.topRight,
  //         end: Alignment.bottomLeft,
  //         colors: [cancelGradientButtonColorRight, cancelGradientButtonColorLeft ]
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(3)),
  //   );
  // }

}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}