// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectModelAdapter extends TypeAdapter<ObjectModel> {
  @override
  final int typeId = 0;

  @override
  ObjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObjectModel(
      id: fields[0] as String,
      name: fields[1] as String,
      data: (fields[2] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ObjectModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
