import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yahshua_test/utils/multi_valuelistenable.dart';

import '../local/hive/employee/employee_hive.dart';
import '../local/hive_functionalities.dart';
import '../local/init_db.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController hourlyRateController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  ValueNotifier<List<EmployeeHive?>> listEmployeesNotifier = ValueNotifier([]);
  ValueNotifier<List<EmployeeHive?>> filteredListEmployeesNotifier = ValueNotifier([]);

  @override
  void initState() {
    // InitDb().openBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<EmployeeHive>('employee').listenable(),
            builder: (context, Box<EmployeeHive> employeeBox, child) {
              print("-----------------test-----------------");
              listEmployeesNotifier.value.clear();
              filteredListEmployeesNotifier.value.clear();

              for (int i = 0; i < employeeBox.length; i++) {
                listEmployeesNotifier.value.add(employeeBox.getAt(i));
                filteredListEmployeesNotifier.value.add(employeeBox.getAt(i));
              }

              return MultiValueListenableBuilder(
                  valueListenables: [listEmployeesNotifier, filteredListEmployeesNotifier],
                  builder: (context, val, child) {
                    return Column(
                      children: [
                        TextField(
                          controller: searchController,
                          decoration: const InputDecoration(label: Text("Search Employee")),
                          onChanged: (_) {
                            List<EmployeeHive> filteredList = [];
                            if (searchController.text.isNotEmpty) {
                              for (EmployeeHive? employee in filteredListEmployeesNotifier.value) {
                                if (employee != null &&
                                    (employee.name!.contains(searchController.text) ||
                                        employee.hourlyRate!.contains(searchController.text))) {
                                  filteredList.add(employee);
                                }
                              }

                              filteredListEmployeesNotifier.value = [];
                              filteredListEmployeesNotifier.value.addAll(filteredList);
                            } else {
                              filteredListEmployeesNotifier.value = [];
                              for (EmployeeHive? employeeHive in listEmployeesNotifier.value) {
                                filteredListEmployeesNotifier.value.add(employeeHive);
                              }
                            }
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredListEmployeesNotifier.value.length,
                              itemBuilder: (context, index) {
                                EmployeeHive? employeeHive = filteredListEmployeesNotifier.value[index];
                                return Dismissible(
                                  background: Container(color: Colors.red),
                                  key: UniqueKey(),
                                  onDismissed: (_) {
                                    employeeBox.deleteAt(index);
                                  },
                                  child: ListTile(
                                    onTap: () {
                                      nameController.text = employeeHive?.name ?? "";
                                      hourlyRateController.text = employeeHive?.hourlyRate ?? "";

                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    TextField(controller: nameController),
                                                    TextField(controller: hourlyRateController),
                                                    const SizedBox(height: 10),
                                                    OutlinedButton(
                                                        onPressed: () async {
                                                          EmployeeHive employeeHive = EmployeeHive(
                                                              name: nameController.text,
                                                              hourlyRate: hourlyRateController.text);

                                                          final employeeBox = Hive.box<EmployeeHive>('employee');
                                                          await employeeBox
                                                              .putAt(index, employeeHive)
                                                              .then((_) => Navigator.pop(context));
                                                        },
                                                        child: const Text("Update Employee"))
                                                  ],
                                                ),
                                              ));
                                    },
                                    title: Text(
                                      employeeHive?.name ?? "",
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      employeeHive?.hourlyRate ?? "",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            nameController.clear();
            hourlyRateController.clear();

            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(controller: nameController),
                          TextField(controller: hourlyRateController),
                          const SizedBox(height: 10),
                          OutlinedButton(
                              onPressed: () {
                                EmployeeHive employeeHive =
                                    EmployeeHive(name: nameController.text, hourlyRate: hourlyRateController.text);

                                HiveFunctionalities().addEmployee(employeeHive);

                                nameController.clear();
                                hourlyRateController.clear();

                                Navigator.pop(context);
                              },
                              child: const Text("Add Employee"))
                        ],
                      ),
                    ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
