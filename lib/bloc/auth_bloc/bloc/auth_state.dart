part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState();
}

class SuccessAuthState extends AuthState {
  const SuccessAuthState();
}

class ErrorAuthState extends AuthState {
  const ErrorAuthState();
}
