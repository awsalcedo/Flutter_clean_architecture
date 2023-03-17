import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/network/network_info.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart'
    as entity;
import 'package:sri_movil/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/repositories/matriculacion_repository_impl.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'matriculacion_repository_impl_test.mocks.dart';

@GenerateMocks([MatriculacionVehicularRemoteDataSource, NetworkInfo])
void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockMatriculacionVehicularRemoteDataSource
      mockMatriculacionVehicularRemoteDataSource;
  late MatriculacionVehicularRepository matriculacionVehicularRepository;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockMatriculacionVehicularRemoteDataSource =
        MockMatriculacionVehicularRemoteDataSource();
    matriculacionVehicularRepository = MatriculacionVehicularRepositoryImpl(
        mockMatriculacionVehicularRemoteDataSource, mockNetworkInfo);
  });

  group('Matriculacion vehicular repository', () {
    test('debería devolver un NetworkFailure cuando no hay conexión a internet',
        () async {
      const idVehiculo = "GXH0323";
      // arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => ConnectivityResult.none);
      // act
      final result = await matriculacionVehicularRepository
          .obtenerInfoVehiculoApi(idVehiculo: idVehiculo);
      // assert
      expect(result, equals(Left(NetworkFailure())));
      verify(mockNetworkInfo.isConnected);
      verifyZeroInteractions(mockMatriculacionVehicularRemoteDataSource);
    });

    test(
        'debería devolver InfoVehiculoEntity cuando la llamada a la API es exitosa',
        () async {
      const idVehiculo = "GXH0323";
      // arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => ConnectivityResult.wifi);
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

      final infoVehiculoModel = InfoVehiculoModel(
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

      final entity.InfoVehiculoEntity infoVehiculoEntity =
          infoVehiculoModel.toEntity();

      when(mockMatriculacionVehicularRemoteDataSource
              .obtenerInformacionVehiculo(idVehiculo: idVehiculo))
          .thenAnswer((_) async => Right(infoVehiculoModel));

      // act
      final result = await matriculacionVehicularRepository
          .obtenerInfoVehiculoApi(idVehiculo: idVehiculo);

      // assert
      expect(result, equals(Right(infoVehiculoEntity)));
      verify(mockNetworkInfo.isConnected);
      verify(mockMatriculacionVehicularRemoteDataSource
          .obtenerInformacionVehiculo(idVehiculo: idVehiculo));
      verifyNoMoreInteractions(mockMatriculacionVehicularRemoteDataSource);
    });
  });
}
