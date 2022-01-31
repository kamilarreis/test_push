import 'dart:async';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;
abstract class _SplashControllerBase with Store {

  @observable
  bool continueFlow = false;

  @action
  updateContinueFlow(value) => continueFlow = value;


  getConfigurations() {
    Timer(const Duration(seconds: 3), () =>  updateContinueFlow(true),);
  }

}