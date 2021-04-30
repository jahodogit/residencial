import 'package:flutter/cupertino.dart';
import 'package:residencial/presentation/detector/detector.dart';
import 'package:residencial/presentation/visitor/visit_list.dart';
import 'package:residencial/presentation/visitor/visit.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/visit": (BuildContext context) => VisitPage(),
    "/visitors": (BuildContext context) => VisitListPage(),
    "/detector": (BuildContext context) => DetectorPage(),
  };
}
