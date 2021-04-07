import 'package:hive/hive.dart';
import 'package:residencial/domain/models/parking.dart';

part 'visita.g.dart';

@HiveType(typeId: 2)
class Visita extends HiveObject {
  @HiveField(0)
  String cedula;
  @HiveField(1)
  String nombre;
  @HiveField(2)
  String entrada;
  @HiveField(3)
  String salida;
  @HiveField(4)
  Parking lot;
  @HiveField(5)
  String placavehiculo;
  @HiveField(6)
  int sincronizado;

  Visita(
      {this.cedula,
      this.nombre,
      this.entrada,
      this.salida,
      this.lot,
      this.placavehiculo,
      this.sincronizado = 0});

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "nombre": nombre,
        "entrada": entrada,
        "salida": salida,
        "lot": lot,
        "placavehiculo": placavehiculo
      };
}
