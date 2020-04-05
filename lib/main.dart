import 'package:flutter/material.dart';
import 'package:mobx_experimentation/count_page.dart';
import 'package:mobx_experimentation/root_provider.dart';
import 'package:mobx_experimentation/state_page.dart';

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
        home: Scaffold(
          appBar: AppBar(title: const Text('Home')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                _HomeButton(
                  page: StatePage(),
                  text: 'State',
                ),
                _HomeButton(
                  page: CountPage(),
                  text: 'Count',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({Key key, @required this.page, @required this.text}) : super(key: key);

  final Widget page;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      onPressed: () => Navigator.push<void>(
        context,
        MaterialPageRoute<void>(builder: (context) => page),
      ),
    );
  }
}
