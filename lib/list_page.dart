import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_experimentation/list_store.dart';
import 'package:mobx_experimentation/main.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('All widget built');

    final listStore = Provider.of<ListStore>(context, listen: false);
    final reactionStore = Provider.of<ReactionStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Count')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const _Title(text: 'With individual observer'),
              Wrap(
                children: <Widget>[
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'List store list count : ${listStore.list.length}',
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'List store observable list count : ${listStore.observableList.length}',
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'Reaction store computed list count : ${reactionStore.computedListCount}',
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'Reaction store computed observable list count : ${reactionStore.computedObservableListCount}',
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'Reaction store reaction list count : ${reactionStore.listCount}',
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    return Expanded(
                      child: _CountContainer(
                        text: 'Reaction store reaction observable list count : ${reactionStore.observableListCount}',
                      ),
                    );
                  }),
                ],
              ),
              RaisedButton(
                child: const Text('Add item'),
                onPressed: () {
                  listStore.addItem(count.toString());
                  count++;
                },
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
