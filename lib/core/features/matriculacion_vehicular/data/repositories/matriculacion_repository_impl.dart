import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_service.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/params/info_vehiculo_params.dart';
import 'package:sri_movil/core/resources/data_state.dart';

class MatriculacionVehicularRepositoryImpl
    implements MatriculacionVehicularRepository {
  final MatriculacionVehicularApiService _matriculacionVehicularApiService;
  //final AppDatabase _appDatabase;

  //const MatriculacionVehicularRepositoryImpl(this._matriculacionVehicularApiService, this._appDatabase);
  const MatriculacionVehicularRepositoryImpl(
      this._matriculacionVehicularApiService);

  @override
  Future<DataState<InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      InfoVehiculoRequestParams params) async {
    try {
      final httpResponse = await _matriculacionVehicularApiService
          .obtenerInfoVehiculoApi(params.placa);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioError(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
