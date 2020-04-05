import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'state_store.g.dart';

class StateAStore = _StateAStore with _$StateAStore;

abstract class _StateAStore with Store {
  @observable
  bool state = false;

  @action
  void switchState() {
    state = !state;
  }

  Color get color => state ? Colors.green : Colors.red;
}

class StateBStore extends _StateBStore with _$StateBStore {
  StateBStore({@required StateAStore stateA}) : super(stateA: stateA);
}

abstract class _StateBStore with Store {
  _StateBStore({@required StateAStore stateA}) : _stateA = stateA;

  final StateAStore _stateA;

  @computed
  bool get computedStateAState => _stateA.state && true;

  bool get stateAState => _stateA.state && true;
  Color get color => _stateA.state ? Colors.green : Colors.red;
}
