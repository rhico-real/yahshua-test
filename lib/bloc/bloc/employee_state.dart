part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

final class EmployeeInitial extends EmployeeState {
  const EmployeeInitial();
}

final class LoadingEmployeeState extends EmployeeState {
  const LoadingEmployeeState();
}

final class SuccessEmployeeState extends EmployeeState {
  const SuccessEmployeeState();
}

final class ErrorEmployeeState extends EmployeeState {
  const ErrorEmployeeState();
}
