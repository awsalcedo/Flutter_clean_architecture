import 'package:flutter/material.dart';
import 'package:sri_movil/pages.dart';

class AppRoutes {
  static const initialRoute = "info_vehiculo";

  static Map<String, Widget Function(BuildContext)> routes = {
    'info_vehiculo': (BuildContext context) => const InfoVehiculoPages(),
  };
}
