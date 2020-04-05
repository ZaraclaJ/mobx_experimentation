// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountStore on _CountStore, Store {
  Computed<String> _$computedCountStringComputed;

  @override
  String get computedCountString => (_$computedCountStringComputed ??=
          Computed<String>(() => super.computedCountString))
      .value;
  Computed<Color> _$computedColorComputed;

  @override
  Color get computedColor =>
      (_$computedColorComputed ??= Computed<Color>(() => super.computedColor))
          .value;

  final _$countAtom = Atom(name: '_CountStore.count');

  @override
  int get count {
    _$countAtom.context.enforceReadPolicy(_$countAtom);
    _$countAtom.reportObserved();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.context.conditionallyRunInAction(() {
      super.count = value;
      _$countAtom.reportChanged();
    }, _$countAtom, name: '${_$countAtom.name}_set');
  }

  final _$_CountStoreActionController = ActionController(name: '_CountStore');

  @override
  void increment() {
    final _$actionInfo = _$_CountStoreActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'count: ${count.toString()},computedCountString: ${computedCountString.toString()},computedColor: ${computedColor.toString()}';
    return '{$string}';
  }
}
