import 'package:flutter/widgets.dart';
import 'package:mobx_experimentation/counter_store.dart';
import 'package:mobx_experimentation/list_store.dart';
import 'package:mobx_experimentation/state_store.dart';
import 'package:provider/provider.dart';

class RootProvider extends StatelessWidget {
  const RootProvider({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Instantiate all the global providers
      providers: [
        Provider<StateAStore>(
          create: (context) => StateAStore(),
        ),
        Provider<StateBStore>(
          create: (context) => StateBStore(stateA: Provider.of<StateAStore>(context, listen: false)),
        ),
        Provider<CountStore>(
          create: (context) => CountStore(),
        ),
        Provider<ListStore>(
          create: (context) => ListStore(),
        ),
        Provider<ReactionStore>(
          create: (context) => ReactionStore(listStore: Provider.of<ListStore>(context, listen: false)),
        ),
      ],
      child: child,
    );
  }
}
