// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateAStore on _StateAStore, Store {
  final _$stateAtom = Atom(name: '_StateAStore.state');

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

  final _$_StateAStoreActionController = ActionController(name: '_StateAStore');

  @override
  void switchState() {
    final _$actionInfo = _$_StateAStoreActionController.startAction();
    try {
      return super.switchState();
    } finally {
      _$_StateAStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'state: ${state.toString()}';
    return '{$string}';
  }
}

mixin _$StateBStore on _StateBStore, Store {
  Computed<bool> _$computedStateAStateComputed;

  @override
  bool get computedStateAState => (_$computedStateAStateComputed ??=
          Computed<bool>(() => super.computedStateAState))
      .value;

  @override
  String toString() {
    final string = 'computedStateAState: ${computedStateAState.toString()}';
    return '{$string}';
  }
}
