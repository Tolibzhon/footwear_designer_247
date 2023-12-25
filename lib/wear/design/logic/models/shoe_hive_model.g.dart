// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeHiveModelAdapter extends TypeAdapter<ShoeHiveModel> {
  @override
  final int typeId = 1;

  @override
  ShoeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      imagePath: fields[2] as String,
      material: fields[3] as String,
      shoeSize: fields[4] as int,
      heelHight: fields[5] as int,
      toeShoes: fields[6] as String,
      additionalInserts: (fields[7] as List).cast<String>(),
      primaryColors: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShoeHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.material)
      ..writeByte(4)
      ..write(obj.shoeSize)
      ..writeByte(5)
      ..write(obj.heelHight)
      ..writeByte(6)
      ..write(obj.toeShoes)
      ..writeByte(7)
      ..write(obj.additionalInserts)
      ..writeByte(8)
      ..write(obj.primaryColors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
