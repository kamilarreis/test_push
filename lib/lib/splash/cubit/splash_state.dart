import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SuccessState extends SplashState{

}

class LoadingState extends SplashState {
}

class ErrorState extends SplashState {
  ErrorState({required this.mensagem});
  final String mensagem;
}