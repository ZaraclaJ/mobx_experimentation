# mobx_experimentation

A project to play with the [mobX](https://mobx.netlify.com/getting-started) package.

This project aims to experiment when there are dependencies between different Stores. A simple example is :
```dart
abstract class _StateA with Store {
  @observable
  bool state = false;

  @action
  void switchState() {
    state = !state;
  }
}

abstract class _StateA with Store {
  _StateA({@required StateA stateA}) : _stateA = stateA;

  final StateA _stateA;

  @computed
  bool get stateAState => _stateA.state;
}
```

It helps to understand the concept of @computed even if the observable comes from an other store.
There are logs in the view to see which part of the code is rebuilt when the observables change.

<img src="Home.png" alt="drawing" width="200"/>
<img src="State.png" alt="drawing" width="200"/>
<img src="Count.png" alt="drawing" width="200"/>
<img src="List.png" alt="drawing" width="200"/>





