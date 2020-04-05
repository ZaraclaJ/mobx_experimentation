import 'package:flutter/material.dart';
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

  Color get color {
    if (count > 10) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @computed
  Color get computedColor {
    if (count > 10) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
