// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_a.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreA on _StoreA, Store {
  final _$stateAtom = Atom(name: '_StoreA.state');

  @override
  bool get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(bool value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$_StoreAActionController = ActionController(name: '_StoreA');

  @override
  void switchState() {
    final _$actionInfo = _$_StoreAActionController.startAction();
    try {
      return super.switchState();
    } finally {
      _$_StoreAActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'state: ${state.toString()}';
    return '{$string}';
  }
}
