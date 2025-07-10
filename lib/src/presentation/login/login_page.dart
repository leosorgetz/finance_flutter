import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('Login Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const AppText.titleSm('You have pushed the button this many times:'),
              AppButton.primary(text: 'Clicar', onPressed: () {}),
              AppButton.secondary(text: 'Clicar', onPressed: () {}),
              AppInput(),
            ],
          ),
        ),
      ),
    );
  }
}
