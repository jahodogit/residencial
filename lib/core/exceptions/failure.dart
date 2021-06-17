import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({
    required this.message
  });
}
