import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../local/init_db.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is ProdLoginEvent) {
        await _login(emit, event.email, event.password);
      }
    });
  }

  Future<void> _login(Emitter<AuthState> emit, String? email, String? password) async {
    await InitDb().openBoxes();
    emit(const LoadingAuthState());

    if (email != null && password != null) {
      final dio = Dio();

      var response = await dio
          .post('https://www.yahshuapayroll.com/api/api-auth/', data: {'username': email, 'password': password});

      if (response.statusCode == 200) {
        print(response);
        emit(const SuccessAuthState());
      } else {
        emit(const ErrorAuthState());
      }
    } else {
      emit(const ErrorAuthState());
    }
  }
}
