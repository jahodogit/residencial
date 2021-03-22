import 'package:hive/hive.dart';
import 'package:residencial/domain/models/parking.dart';

part 'visita.g.dart';

@HiveType(typeId: 2)
class Visita extends HiveObject {
  @HiveField(0)
  final int cedula;
  @HiveField(1)
  final String nombre;
  @HiveField(2)
  final String entrada;
  @HiveField(3)
  final String salida;
  @HiveField(4)
  final Parking lot;
  @HiveField(5)
  final String placavehiculo;

  Visita(
      {this.cedula,
      this.nombre,
      this.entrada,
      this.salida,
      this.lot,
      this.placavehiculo});

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "nombre": nombre,
        "entrada": entrada,
        "salida": salida,
        "lot": lot
      };
}
