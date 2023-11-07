import 'package:hive/hive.dart';

import 'hive/employee/employee_hive.dart';

class HiveFunctionalities {
  addEmployee(EmployeeHive employeeHive) async {
    final employeeBox = Hive.box<EmployeeHive>('employee');
    await employeeBox.add(employeeHive);
  }

  editEmployee(EmployeeHive employeeHive) async {}

  deleteEmployee(EmployeeHive employeeHive) {}
}
