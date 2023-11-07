part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class ProdAddEmployeeEvent extends EmployeeEvent {
  const ProdAddEmployeeEvent();
}

class ProdEditEmployeeEvent extends EmployeeEvent {
  const ProdEditEmployeeEvent();
}

class ProdGetEmployeeEvent extends EmployeeEvent {
  const ProdGetEmployeeEvent();
}

class ProdDeleteEmployeeEvent extends EmployeeEvent {
  const ProdDeleteEmployeeEvent();
}
