import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_experimentation/root_provider.dart';
import 'package:mobx_experimentation/store_a.dart';
import 'package:mobx_experimentation/store_b.dart';
import 'package:provider/provider.dart';

const double defaultSpacing = 8;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootProvider(
      child: MaterialApp(
        title: 'MobX experiment',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("All widget builded");
    final storeA = Provider.of<StoreA>(context, listen: false);
    final storeB = Provider.of<StoreB>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _StateContainer(
              state: storeA.state,
              text: "Store A state without observer",
            ),
            Observer(builder: (context) {
              print("Store A observer builded");
              final state = storeA.state;
              return _StateContainer(
                state: state,
                text: "Store A state",
              );
            }),
            Observer(builder: (context) {
              print("Store B observer builded");
              final state = storeB.storeAState;
              return _StateContainer(
                state: state,
                text: "Store A state from store B",
              );
            }),
            Observer(builder: (context) {
              print("Row observer builded");
              return Row(
                children: <Widget>[
                  Expanded(
                    child: Observer(builder: (context) {
                      print("Store A observer in row builded");
                      return _StateContainer(
                        text: "Store A state in row",
                        state: storeA.state,
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print("Store A from B observer in row builded");
                      return _StateContainer(
                        text: "Store A state from B in row",
                        state: storeB.storeAState,
                      );
                    }),
                  ),
                  Expanded(
                    child: _StateContainer(
                      text: "Store A state from B in row",
                      state: storeA.state,
                    ),
                  ),
                ],
              );
            }),
            RaisedButton(
              child: Text("Change the store A state !"),
              onPressed: () => storeA.switchState(),
            )
          ],
        ),
      ),
    );
  }
}

class _StateContainer extends StatelessWidget {
  const _StateContainer({Key key, @required this.state, @required this.text}) : super(key: key);

  final bool state;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultSpacing),
      padding: EdgeInsets.all(defaultSpacing),
      color: state ? Colors.green : Colors.red,
      child: Text(
        "$text : $state",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
