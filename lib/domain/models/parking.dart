import 'package:hive/hive.dart';
part 'parking.g.dart';

@HiveType(typeId: 1)
class Parking extends HiveObject {
  @HiveField(0)
  final String numero;
  @HiveField(1)
  final String apto;
  @HiveField(2)
  final bool disponible;
  @HiveField(3)
  final String placa;
  @HiveField(4)
  final bool moto;
  @HiveField(5)
  final bool vehiculo;
  @HiveField(6)
  final String placamoto;

  Parking(
      {this.numero,
      this.apto,
      this.disponible = true,
      this.placa,
      this.moto = false,
      this.vehiculo = true,
      this.placamoto = ""});

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
        numero: json['numero'],
        apto: json['apto'],
        disponible: json['disponible'],
        placa: json['placa'],
        moto: json['moto'],
        vehiculo: json['vehiculo'],
        placamoto: json['placamoto']);
  }
}
