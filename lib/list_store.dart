import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  List<String> list = [];

  @observable
  ObservableList<String> observableList = ObservableList.of([]);

  @action
  void addItem(String item) {
    list = [
      ...list,
      item,
    ];
    observableList.add(item);
  }
}

class ReactionStore extends _ReactionStore with _$ReactionStore {
  ReactionStore({@required ListStore listStore}) : super(listStore: listStore);
}

abstract class _ReactionStore with Store {
  _ReactionStore({@required ListStore listStore}) : _listStore = listStore {
    _reactionListDisposer = reaction<List<String>>(
      (_) => _listStore.list,
      updateCount,
      fireImmediately: true,
    );
    _reactionObservableListDisposer = reaction<List<String>>(
      (_) => _listStore.observableList,
      updateCount,
      fireImmediately: true,
    );
  }

  ReactionDisposer _reactionListDisposer;
  ReactionDisposer _reactionObservableListDisposer;

  final ListStore _listStore;

  @observable
  int listCount;

  @observable
  int observableListCount;

  @computed
  int get computedListCount => _listStore.list.length;

  @computed
  int get computedObservableListCount => _listStore.list.length;

  void updateCount(List<String> list) {
    listCount = list.length;
  }

  void updateObservableListCount(List<String> observableList) {
    observableListCount = observableList.length;
  }

  void dispose() {
    _reactionListDisposer();
    _reactionObservableListDisposer();
  }
}
