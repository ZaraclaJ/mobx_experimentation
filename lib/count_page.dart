import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_experimentation/counter_store.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class CountPage extends StatelessWidget {
  const CountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('All widget built');

    final countStore = Provider.of<CountStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Count')),
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
                    child: _CountContainer(
                      text: '${countStore.count}',
                    ),
                  ),
                  Expanded(
                    child: _CountContainer(
                      text: countStore.countString,
                    ),
                  ),
                  Expanded(
                    child: _CountContainer(
                      text: countStore.computedCountString,
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
                      return _CountContainer(
                        text: '${countStore.count}',
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _CountContainer(
                        text: countStore.countString,
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _CountContainer(
                        text: countStore.computedCountString,
                      );
                    }),
                  ),
                ],
              ),
              const _Title(text: 'Color With individual observer'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _ColorContainer(
                        color: countStore.color,
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      print('Store B observer built');
                      return _ColorContainer(
                        color: countStore.computedColor,
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
                      child: _CountContainer(
                        text: '${countStore.count}',
                      ),
                    ),
                    Expanded(
                      child: _CountContainer(
                        text: countStore.countString,
                      ),
                    ),
                    Expanded(
                      child: _CountContainer(
                        text: countStore.computedCountString,
                      ),
                    ),
                  ],
                );
              }),
              RaisedButton(
                child: const Text('Increment count !'),
                onPressed: countStore.increment,
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

class _CountContainer extends StatelessWidget {
  const _CountContainer({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultSpacing),
      padding: const EdgeInsets.all(defaultSpacing),
      color: Colors.grey,
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultSpacing),
      padding: const EdgeInsets.all(defaultSpacing),
      color: color,
      child: const SizedBox(
        height: 10,
      ),
    );
  }
}
