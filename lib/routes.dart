import 'package:flutter/cupertino.dart';
import 'package:residencial/presentation/visita/lista_visitas.dart';
import 'package:residencial/presentation/visita/visita.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/visita": (BuildContext context) => VisitaPage(),
    "/visitas": (BuildContext context) => ListaVisitasPage(),
  };
}
