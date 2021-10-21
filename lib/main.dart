import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/example_model.dart';
import 'package:provider_example/pages/provider_example.dart';

import 'pages/change_notifier_example.dart';
import 'providers/coin_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ExampleModel()),
        ChangeNotifierProvider(create: (context) => CoinProvider()),
      ],
      child: MaterialApp(
        title: 'Provider Example',
        debugShowCheckedModeBanner: false,
        home: const ChangeNotifierExamplePage(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      ),
    );
  }
}
