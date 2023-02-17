import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

class InfoVehiculoPages extends StatelessWidget {
  const InfoVehiculoPages({super.key});

  void obtenerDatos(BuildContext context) {
    print('Pulsado llamando al UsCase');

    BlocProvider.of<InfoVehiculoBloc>(context, listen: false)
        .add(const ObtenerInfoVehiculoEvent(InfoVehiculoE, "dd"));
  }

  @override
  Widget build(BuildContext context) {
    //final placaController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Valores a pagar'),
        ),
        body: BlocBuilder<InfoVehiculoBloc, InfoVehiculoState>(
          builder: (context, state) {
            if (state.infoVehiculoEntidad != null) {
              return InformacionVehiculo(
                  infoVehiculoEntity: state.infoVehiculoEntidad!);
            } else {
              return Column(
                children: [
                  const Text('Placa:'),
                  const TextField(
                    decoration:
                        InputDecoration(hintText: 'Digite el número de placa'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        obtenerDatos(context);
                      },
                      child: const Text(
                        'Consultar data',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              );
            }
          },
        ));
  }
}

class InformacionVehiculo extends StatelessWidget {
  final InfoVehiculoEntity infoVehiculoEntity;

  const InformacionVehiculo({super.key, required this.infoVehiculoEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Cantón de la matrícula: ${infoVehiculoEntity.cantonMatricula}'),
        Text('Placa: ${infoVehiculoEntity.placa}'),
        Text('Marca: ${infoVehiculoEntity.marca}'),
        Text('Modelo: ${infoVehiculoEntity.modelo}'),
        Text('Año: ${infoVehiculoEntity.anioModelo.toString()}'),
        Text('Clase: ${infoVehiculoEntity.clase}'),
      ],
    );
  }
}
