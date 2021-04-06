import 'package:hive/hive.dart';
part 'parking.g.dart';

@HiveType(typeId: 1)
class Parking extends HiveObject {
  @HiveField(0)
  final String numero;
  @HiveField(1)
  final String apto;
  @HiveField(2)
  int disponible;
  @HiveField(3)
  final String placa;
  @HiveField(4)
  final int moto;
  @HiveField(5)
  final int vehiculo;
  @HiveField(6)
  final String placamoto;

  Parking(
      {this.numero,
      this.apto,
      this.disponible,
      this.placa,
      this.moto,
      this.vehiculo,
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

  Map<String, dynamic> toJson() => {
        "numero": numero,
        "apto": apto,
        "disponible": disponible,
        "placa": placa,
        "moto": moto,
        "vehiculo": vehiculo,
        "placamoto": placamoto
      };
}
