// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  final _$listAtom = Atom(name: '_ListStore.list');

  @override
  List<String> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(List<String> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$observableListAtom = Atom(name: '_ListStore.observableList');

  @override
  ObservableList<String> get observableList {
    _$observableListAtom.context.enforceReadPolicy(_$observableListAtom);
    _$observableListAtom.reportObserved();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<String> value) {
    _$observableListAtom.context.conditionallyRunInAction(() {
      super.observableList = value;
      _$observableListAtom.reportChanged();
    }, _$observableListAtom, name: '${_$observableListAtom.name}_set');
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void addItem(String item) {
    final _$actionInfo = _$_ListStoreActionController.startAction();
    try {
      return super.addItem(item);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'list: ${list.toString()},observableList: ${observableList.toString()}';
    return '{$string}';
  }
}

mixin _$ReactionStore on _ReactionStore, Store {
  Computed<int> _$computedListCountComputed;

  @override
  int get computedListCount => (_$computedListCountComputed ??=
          Computed<int>(() => super.computedListCount))
      .value;
  Computed<int> _$computedObservableListCountComputed;

  @override
  int get computedObservableListCount =>
      (_$computedObservableListCountComputed ??=
              Computed<int>(() => super.computedObservableListCount))
          .value;

  final _$listCountAtom = Atom(name: '_ReactionStore.listCount');

  @override
  int get listCount {
    _$listCountAtom.context.enforceReadPolicy(_$listCountAtom);
    _$listCountAtom.reportObserved();
    return super.listCount;
  }

  @override
  set listCount(int value) {
    _$listCountAtom.context.conditionallyRunInAction(() {
      super.listCount = value;
      _$listCountAtom.reportChanged();
    }, _$listCountAtom, name: '${_$listCountAtom.name}_set');
  }

  final _$observableListCountAtom =
      Atom(name: '_ReactionStore.observableListCount');

  @override
  int get observableListCount {
    _$observableListCountAtom.context
        .enforceReadPolicy(_$observableListCountAtom);
    _$observableListCountAtom.reportObserved();
    return super.observableListCount;
  }

  @override
  set observableListCount(int value) {
    _$observableListCountAtom.context.conditionallyRunInAction(() {
      super.observableListCount = value;
      _$observableListCountAtom.reportChanged();
    }, _$observableListCountAtom,
        name: '${_$observableListCountAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'listCount: ${listCount.toString()},observableListCount: ${observableListCount.toString()},computedListCount: ${computedListCount.toString()},computedObservableListCount: ${computedObservableListCount.toString()}';
    return '{$string}';
  }
}
