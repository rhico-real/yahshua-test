import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../bloc/auth_bloc/bloc/auth_bloc.dart';

final injector = GetIt.instance;

//This is dependency injection

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies and API services

  //Repositories

  // UseCases

  // Blocs
  injector.registerFactory<AuthBloc>(() => AuthBloc());
}
