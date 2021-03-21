import 'package:residencial/domain/models/parking.dart';

class Visita {
  final int cedula;
  final String nombre;
  final String entrada;
  final String salida;
  final Parking lot;

  Visita({this.cedula, this.nombre, this.entrada, this.salida, this.lot});

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "nombre": nombre,
        "entrada": entrada,
        "salida": salida,
        "lot": lot
      };
}
