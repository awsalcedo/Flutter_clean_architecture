import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sri_movil/core/extensions/date_extension.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

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
            if (state is InfoVehiculoLoadedState) {
              return InformacionVehiculo(
                  infoVehiculoEntity: state.infoVehiculoEntidad!);
            } else if (state is InfoVehiculoErrorState) {
              return Text(state.message);
            } else {
              return _buildLoading();
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: const Text(
                'Información del vehículo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Placa:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.placa,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Cantón de la matrícula:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.cantonMatricula,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Marca:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.marca,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Modelo:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.modelo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Año de modelo:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.anioModelo.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'País:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.paisFabricacion,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Último año de pago:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.anioUltimoPago.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Clase:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.clase,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Fecha de caducidad de la matrícula:',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                infoVehiculoEntity.fechaCaducidadMatricula.toShortDateString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
