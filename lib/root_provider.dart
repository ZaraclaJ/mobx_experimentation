import 'package:flutter/widgets.dart';
import 'package:mobx_experimentation/store_a.dart';
import 'package:mobx_experimentation/store_b.dart';
import 'package:provider/provider.dart';

class RootProvider extends StatelessWidget {
  const RootProvider({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Instantiate all the global providers
      providers: [
        Provider<StoreA>(
          create: (context) => StoreA(),
        ),
        Provider<StoreB>(
          create: (context) => StoreB(storeA: Provider.of<StoreA>(context, listen: false)),
        ),
      ],
      child: child,
    );
  }
}
