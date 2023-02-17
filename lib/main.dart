import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';
import 'package:sri_movil/core/routes/app_routes.dart';
//import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/pages/info_vehiculo_page.dart';

import 'core/di/injector_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initializeDependencies();
  runApp(const SriMovilApp());
}

class SriMovilApp extends StatelessWidget {
  const SriMovilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.injector<InfoVehiculoBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        ));
  }
}
