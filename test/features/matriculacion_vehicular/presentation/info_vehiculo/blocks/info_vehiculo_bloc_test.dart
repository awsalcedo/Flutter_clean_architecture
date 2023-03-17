import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
import 'package:sri_movil/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';
import 'info_vehiculo_bloc_test.mocks.dart';

@GenerateMocks([InfoVehiculoUseCase])
void main() {
  late InfoVehiculoBloc infoVehiculoBloc;
  late MockInfoVehiculoUseCase mockInfoVehiculoUseCase;

  setUp(() {
    mockInfoVehiculoUseCase = MockInfoVehiculoUseCase();
    infoVehiculoBloc =
        InfoVehiculoBloc(infoVehiculoUseCase: mockInfoVehiculoUseCase);
  });

  const idVehiculo = "GXH0323";

  final List<DetallesRubro> detallesRubro = [
    const DetallesRubro(descripcion: "TASA", anio: 2023, valor: 62.64)
  ];

  final List<Rubro> rubros = [
    Rubro(
        descripcion: "TASA SPPAT",
        valor: 62.64,
        periodoFiscal: "2023 - 2023",
        beneficiario: "SPPAT",
        detallesRubro: detallesRubro),
  ];

  final List<Deuda> deudas = [
    Deuda(
        descripcion: "PAGO DEL VALOR DE LA MATRÍCULA",
        rubros: rubros,
        subtotal: 46.00)
  ];

  final List<Tasa> tasas = [
    Tasa(descripcion: "NACIONAL", deudas: deudas, subtotal: 62.64)
  ];

  final infoVehiculo = InfoVehiculoEntity(
      fechaUltimaMatricula: 1430110800000,
      fechaCaducidadMatricula: 1588050000000,
      cantonMatricula: "GUAYAQUIL",
      fechaRevision: 1527483600000,
      total: 108.64,
      informacion: "",
      estadoAuto: "ASIGNADO",
      mensajeMotivoAuto: "",
      placa: "GXH0323",
      camvCpn: "G00298732",
      cilindraje: 3800.0,
      fechaCompra: 1134363600000,
      anioUltimoPago: 2022,
      marca: "MITSUBISHI",
      modelo: "MONTERO 5P 3.8 TA FULL EQUIPO",
      anioModelo: 2006,
      paisFabricacion: "JAPON",
      clase: "JEEP",
      servicio: "PARTICULAR",
      tipoUso: "NO APLICA",
      deudas: deudas,
      tasas: tasas,
      remision: "");

  final serverError = ServerFailure();
  final networkError = NetworkFailure();

  blocTest<InfoVehiculoBloc, InfoVehiculoState>(
    'debería emitir [InfoVehiculoLoadingState, InfoVehiculoErrorState] '
    'cuando la obtención de información del vehículo falla con una falla del servidor',
    build: () {
      when(mockInfoVehiculoUseCase(idVehiculo: idVehiculo))
          .thenAnswer((_) async => Left(serverError));
      return infoVehiculoBloc;
    },
    act: (bloc) =>
        bloc.add(const ObtenerInfoVehiculoEvent(idVehiculo: idVehiculo)),
    expect: () => [
      InfoVehiculoLoadingState(),
      const InfoVehiculoErrorState('Error de servidor.'),
    ],
  );

  group('ObtenerInfoVehiculoEvent', () {
    blocTest(
      'debería emitir [InfoVehiculoLoadingState, InfoVehiculoLoadedState] '
      'cuando la obtención de información del vehículo tiene éxito',
      build: () {
        when(mockInfoVehiculoUseCase(idVehiculo: idVehiculo))
            .thenAnswer((_) async => Right(infoVehiculo));
        return infoVehiculoBloc;
      },
      act: (bloc) =>
          bloc.add(const ObtenerInfoVehiculoEvent(idVehiculo: idVehiculo)),
      expect: () =>
          [InfoVehiculoLoadingState(), InfoVehiculoLoadedState(infoVehiculo)],
    );

    blocTest(
      'debería emitir [InfoVehiculoLoadingState, InfoVehiculoErrorState] '
      'cuando la obtención de información del vehículo falla con una falla en la red',
      build: () {
        when(mockInfoVehiculoUseCase(idVehiculo: idVehiculo))
            .thenAnswer((_) async => Left(networkError));
        return infoVehiculoBloc;
      },
      act: (bloc) =>
          bloc.add(const ObtenerInfoVehiculoEvent(idVehiculo: idVehiculo)),
      expect: () => [
        InfoVehiculoLoadingState(),
        const InfoVehiculoErrorState('Error de red.')
      ],
    );
  });
}
