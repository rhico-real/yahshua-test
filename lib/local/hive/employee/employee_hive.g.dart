// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeHiveAdapter extends TypeAdapter<EmployeeHive> {
  @override
  final int typeId = 1;

  @override
  EmployeeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeHive(
      name: fields[0] as String?,
      hourlyRate: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.hourlyRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
