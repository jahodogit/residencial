import 'package:flutter/cupertino.dart';
import 'package:residencial/presentation/detector/detector.dart';
import 'package:residencial/presentation/visitor/lista_visitas.dart';
import 'package:residencial/presentation/visitor/visita.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/visita": (BuildContext context) => VisitaPage(),
    "/visitas": (BuildContext context) => ListaVisitasPage(),
    "/detector": (BuildContext context) => DetectorPage(),
  };
}
