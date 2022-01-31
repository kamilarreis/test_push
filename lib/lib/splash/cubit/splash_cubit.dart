import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_awesome/lib/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit() : super(LoadingState());

  bool continueFlow = false;

  updateContinueFlow(value) => continueFlow = value;


  getConfigurations() {
    Timer(const Duration(seconds: 3), () =>  emit(SuccessState()));
  }
}