import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'hive/employee/employee_hive.dart';

class InitDb {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    //Register Hive TypeAdapters
    Hive.registerAdapter(EmployeeHiveAdapter());
  }

  Future<void> openBoxes() async {
    await Hive.openBox<EmployeeHive>('employee');
  }
}
