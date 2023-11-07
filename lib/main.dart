import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yahshua_test/utils/approutes.dart';

import 'bloc/auth_bloc/bloc/auth_bloc.dart';
import 'http/injector.dart';
import 'local/init_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///initialize injector
  await initializeDependencies();

  await InitDb().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => injector()..add(const ProdLoginEvent(null, null))),
      ],
      child: MaterialApp(
        title: 'Yahshua Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        navigatorKey: MyApp.navigatorKey,
      ),
    );
  }
}
