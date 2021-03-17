// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParkingAdapter extends TypeAdapter<Parking> {
  @override
  final int typeId = 1;

  @override
  Parking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Parking(
      numero: fields[0] as String,
      apto: fields[1] as String,
      disponible: fields[2] as bool,
      placa: fields[3] as String,
      moto: fields[4] as bool,
      vehiculo: fields[5] as bool,
      placamoto: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Parking obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.numero)
      ..writeByte(1)
      ..write(obj.apto)
      ..writeByte(2)
      ..write(obj.disponible)
      ..writeByte(3)
      ..write(obj.placa)
      ..writeByte(4)
      ..write(obj.moto)
      ..writeByte(5)
      ..write(obj.vehiculo)
      ..writeByte(6)
      ..write(obj.placamoto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParkingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
