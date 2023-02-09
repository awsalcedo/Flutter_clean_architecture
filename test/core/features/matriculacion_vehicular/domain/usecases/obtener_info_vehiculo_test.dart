import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repository/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

class MockMatriculacionVehicularRepository extends Mock
    implements MatriculacionVehicularRepository {}

@GenerateMocks([MockMatriculacionVehicularRepository])
void main() {
  final mockMatriculacionVehicularRepository =
      MockMatriculacionVehicularRepository();
  final usecase = InfoVehiculoUseCase(mockMatriculacionVehicularRepository);

  const placa = "GXH0323";

  final List<DetallesRubro> detallesRubro = [
    DetallesRubro(descripcion: "TASA", anio: 2023, valor: 62.64)
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

  final vehiculo = InfoVehiculoEntity(
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

  test('debería obtener el vehículo desde el repository', () async {
    when(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(placa))
        .thenAnswer((_) async => Right(vehiculo));

    final result = await usecase(const Params(placa: placa));

    expect(result, Right(vehiculo));

    verify(mockMatriculacionVehicularRepository.obtenerInfoVehiculoApi(placa));

    verifyNoMoreInteractions(mockMatriculacionVehicularRepository);
  });
}
