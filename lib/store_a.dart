import 'package:mobx/mobx.dart';

part 'store_a.g.dart';

class StoreA = _StoreA with _$StoreA;

abstract class _StoreA with Store {
  @observable
  bool state = false;

  @action
  void switchState() {
    state = !state;
  }
}
