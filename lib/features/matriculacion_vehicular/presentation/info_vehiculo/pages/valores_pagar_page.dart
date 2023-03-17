import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/di/injector_container.dart' as di;
import 'package:sri_movil/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

class ValoresPagarPage extends StatefulWidget {
  const ValoresPagarPage({super.key});

  @override
  State<ValoresPagarPage> createState() => _ValoresPagarPageState();
}

class _ValoresPagarPageState extends State<ValoresPagarPage> {
  final FirebaseAnalytics _analytics = di.injector<FirebaseAnalytics>();
  final FirebaseAnalyticsObserver _observer =
      di.injector<FirebaseAnalyticsObserver>();

  final TextEditingController _idVehiculoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Valores a Pagar'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: _idVehiculoController,
                decoration: const InputDecoration(
                    hintText: 'Digite el número de placa'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _analytics.logEvent(name: 'Consulta_de_valores_a_pagar');
                    final String idVehiculo =
                        _idVehiculoController.text.toUpperCase();
                    _consultarVehiculo(context, idVehiculo: idVehiculo);
                    _idVehiculoController.text = '';
                  },
                  child: const Text(
                    'Consultar vehículo',
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ));
  }
}

void _consultarVehiculo(BuildContext context, {required String idVehiculo}) {
  BlocProvider.of<InfoVehiculoBloc>(context, listen: false)
      .add(ObtenerInfoVehiculoEvent(idVehiculo: idVehiculo));
  Navigator.pushNamed(context, 'info_vehiculo');
}
