import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CountStore = _CountStore with _$CountStore;

abstract class _CountStore with Store {
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }

  String get countString => 'Total without computed : $count';

  @computed
  String get computedCountString => 'Computed total : $count';
}
