import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_experimentation/store_a.dart';

part 'store_b.g.dart';

class StoreB extends _StoreB with _$StoreB {
  StoreB({@required StoreA storeA}) : super(storeA: storeA);
}

abstract class _StoreB with Store {
  _StoreB({@required StoreA storeA}) : _storeA = storeA;

  final StoreA _storeA;

  @computed
  bool get storeAState => _storeA.state;
}
