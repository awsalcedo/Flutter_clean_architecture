import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
import 'obtener_info_vehiculo_test.mocks.dart';

@GenerateMocks([MatriculacionVehicularRepository])
void main() {
  late MockMatriculacionVehicularRepository
      mockMatriculacionVehicularRepository;
  late InfoVehiculoUseCase usecase;

  setUp(() {
    mockMatriculacionVehicularRepository =
        MockMatriculacionVehicularRepository();
    usecase = InfoVehiculoUseCase(mockMatriculacionVehicularRepository);
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

  test(
      'debería devolver un error cuando falla obtener la información del vehículo',
      () async {
    // arrange
    final failure = NetworkFailure();
    when(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(
            idVehiculo: idVehiculo))
        .thenAnswer((_) async => Left(failure));

    // act
    final result = await usecase(idVehiculo: idVehiculo);

    // assert
    expect(result, Left(failure));
    verify(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(
        idVehiculo: idVehiculo));
    verifyNoMoreInteractions(mockMatriculacionVehicularRepository);
  });

  test('debería obtener la información del vehículo desde el repository',
      () async {
    // arrange
    when(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(
            idVehiculo: idVehiculo))
        .thenAnswer((_) async => Right(infoVehiculo));

    // act
    final result = await usecase(idVehiculo: idVehiculo);

    // assert
    expect(result, Right(infoVehiculo));
    verify(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(
        idVehiculo: idVehiculo));
    verifyNoMoreInteractions(mockMatriculacionVehicularRepository);
  });
}
