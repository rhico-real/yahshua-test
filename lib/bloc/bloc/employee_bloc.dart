import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(const EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) {});
  }
}
