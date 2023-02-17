import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

class InfoVehiculoPage extends StatelessWidget {
  const InfoVehiculoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Información del vehículo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<InfoVehiculoBloc, InfoVehiculoState>(
            builder: (context, state) {
              /*if (state is InfoVehiculoLoading) {
                return Center(
                  child: Text("data: ${state.toString()}"),
                );
              }
              if (state is InfoVehiculoDone) {
                return Text(
                    "Dato: ${state.infoVehiculoEntity?.cantonMatricula.toString()}");
              }
              return Text("data: ${state.toString()}");*/

              if (state.infoVehiculoEntidad != null) {
                return Text(
                    "Dato: ${state.infoVehiculoEntidad?.cantonMatricula.toString()}");
              } else {
                return const Text("NO DATA !!!!!!!");
              }
            },
          ),
        ));
  }
}
