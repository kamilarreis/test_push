import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class SuccessState extends HomeState{

}

class LoadingState extends HomeState {
}

class ErrorState extends HomeState {
  ErrorState({required this.mensagem});
  final String mensagem;
}