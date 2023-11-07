import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yahshua_test/local/init_db.dart';

import '../authenticated/dashboard.dart';
import '../bloc/auth_bloc/bloc/auth_bloc.dart';
import 'login.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();
    InitDb().openBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, state) {
          if (state is LoadingAuthState) {
            return false;
          }

          return true;
        },
        builder: (context, state) {
          if (state is ErrorAuthState || state is AuthInitial) {
            return const LoginPage();
          } else if (state is SuccessAuthState) {
            return const Dashboard();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
