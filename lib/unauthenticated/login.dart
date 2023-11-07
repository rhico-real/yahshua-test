import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/bloc/auth_bloc.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Yahshua Test - Rhico Abueme",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: loginController,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(MyApp.navigatorKey.currentContext!)
                          .add(ProdLoginEvent(loginController.text, passwordController.text));
                    },
                    child: const Text("Login"))
              ]),
        ),
      ),
    );
  }
}
