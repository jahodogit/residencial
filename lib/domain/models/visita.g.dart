// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visita.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitaAdapter extends TypeAdapter<Visita> {
  @override
  final int typeId = 2;

  @override
  Visita read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Visita(
      cedula: fields[0] as int,
      nombre: fields[1] as String,
      entrada: fields[2] as String,
      salida: fields[3] as String,
      lot: fields[4] as Parking,
      placavehiculo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Visita obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cedula)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.entrada)
      ..writeByte(3)
      ..write(obj.salida)
      ..writeByte(4)
      ..write(obj.lot)
      ..writeByte(5)
      ..write(obj.placavehiculo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
