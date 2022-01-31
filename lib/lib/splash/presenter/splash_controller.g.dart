// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$continueFlowAtom = Atom(name: '_SplashControllerBase.continueFlow');

  @override
  bool get continueFlow {
    _$continueFlowAtom.reportRead();
    return super.continueFlow;
  }

  @override
  set continueFlow(bool value) {
    _$continueFlowAtom.reportWrite(value, super.continueFlow, () {
      super.continueFlow = value;
    });
  }

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  dynamic updateContinueFlow(dynamic value) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction(
        name: '_SplashControllerBase.updateContinueFlow');
    try {
      return super.updateContinueFlow(value);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
continueFlow: ${continueFlow}
    ''';
  }
}
