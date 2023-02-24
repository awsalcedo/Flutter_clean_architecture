import 'package:flutter/material.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/pages/valores_pagar_page.dart';
import 'package:sri_movil/pages.dart';

class AppRoutes {
  static const initialRoute = "valores_pagar";

  static Map<String, Widget Function(BuildContext)> routes = {
    'valores_pagar': (BuildContext context) => const ValoresPagarPage(),
    'info_vehiculo': (BuildContext context) => const InfoVehiculoPages(),
  };
}
