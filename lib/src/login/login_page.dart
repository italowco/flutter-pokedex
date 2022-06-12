import 'package:flutter/material.dart';

import '../sample_feature/pokedex_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  late String _username;
  late String _password;

  bool isKeyboardVisible = false;

  Image buildLogo() {
    return Image.asset(
      'assets/images/app-logo.png',
      scale: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        body: Form(
            key: _formKey,
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // if (!isKeyboard) buildLogo(),
                  TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Usuário',
                      fillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor adicione o email';
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Senha',
                        fillColor: Colors.black),
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor adicione a senha';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.restorablePushNamed(
                              context, PokemonList.routeName);
                        }
                      },
                      child: Text('Entrar'),
                    ),
                  )
                ],
              ),
            ) // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
