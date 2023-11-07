part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ProdLoginEvent extends AuthEvent {
  final String? email;
  final String? password;
  const ProdLoginEvent(this.email, this.password);
}
