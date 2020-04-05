import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_experimentation/state_store.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class StatePage extends StatelessWidget {
  const StatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('All widget built');

    final stateA = Provider.of<StateAStore>(context, listen: false);
    final stateB = Provider.of<StateBStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('State')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const _Title(text: 'Without observer'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _StateContainer(
                      state: stateA.state,
                      text: 'Store A state ',
                      color: stateA.color,
                    ),
                  ),
                  Expanded(
                    child: _StateContainer(
                      state: stateB.computedStateAState,
                      text: 'Store A state from B',
                      color: stateA.color,
                    ),
                  ),
                  Expanded(
                    child: _StateContainer(
                      state: stateB.computedStateAState,
                      text: 'Computed Store A state from B ',
                      color: stateA.color,
                    ),
                  ),
                ],
              ),
              const _Title(text: 'With individual observer'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store A observer built');
                      return _StateContainer(
                        state: true,
                        text: 'Store A state',
                        color: stateA.color,
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _StateContainer(
                        state: true,
                        text: 'Store A state from store B',
                        color: stateA.color,
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _StateContainer(
                        state: true,
                        text: 'Computed Store A state from store B',
                        color: stateA.color,
                      );
                    }),
                  ),
                ],
              ),
              const _Title(text: 'With global observer'),
              Observer(builder: (context) {
                print('Row observer built');
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: _StateContainer(
                        text: 'Store A state',
                        state: stateA.state,
                        color: stateA.color,
                      ),
                    ),
                    Expanded(
                      child: _StateContainer(
                        text: 'Store A state from B',
                        state: stateB.stateAState,
                        color: stateA.color,
                      ),
                    ),
                    Expanded(
                      child: _StateContainer(
                        text: 'Computed Store A state from B',
                        state: stateB.computedStateAState,
                        color: stateA.color,
                      ),
                    ),
                  ],
                );
              }),
              RaisedButton(
                child: const Text('Change the store A state !'),
                onPressed: stateA.switchState,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultSpacing),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _StateContainer extends StatelessWidget {
  const _StateContainer({Key key, @required this.state, @required this.text, @required this.color}) : super(key: key);

  final bool state;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultSpacing),
      padding: const EdgeInsets.all(defaultSpacing),
      color: color,
      child: Text(
        '$text : $state',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
