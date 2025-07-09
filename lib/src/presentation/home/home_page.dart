import 'package:core/core.dart';
import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

import '../../shared/stores/app_theme_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            AppButton(text: 'Clicar', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
