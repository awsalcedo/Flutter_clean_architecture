import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

class InfoVehiculoPages extends StatelessWidget {
  const InfoVehiculoPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Valores a pagar'),
        ),
        body: BlocBuilder<InfoVehiculoBloc, InfoVehiculoState>(
          builder: (context, state) {
            if (state is InfoVehiculoInitialState) {
              return _buildLoading();
            } else if (state is InfoVehiculoLoaded) {
              return InformacionVehiculo(
                  infoVehiculoEntity: state.infoVehiculoEntidad!);
            } else if (state is InfoVehiculoError) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ));
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());

class InformacionVehiculo extends StatelessWidget {
  final InfoVehiculoEntity infoVehiculoEntity;

  const InformacionVehiculo({super.key, required this.infoVehiculoEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 400,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color.fromARGB(255, 196, 193, 193), width: 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cantón de la matrícula: ${infoVehiculoEntity.cantonMatricula}'),
          Text('Placa: ${infoVehiculoEntity.placa}'),
          Text('Marca: ${infoVehiculoEntity.marca}'),
          Text('Modelo: ${infoVehiculoEntity.modelo}'),
          Text('Año: ${infoVehiculoEntity.anioModelo.toString()}'),
          Text('Clase: ${infoVehiculoEntity.clase}'),
        ],
      ),
    );
  }
}
