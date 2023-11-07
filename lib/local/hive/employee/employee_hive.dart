import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class EmployeeHive {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? hourlyRate;

  EmployeeHive({this.name, this.hourlyRate});
}
