import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sri_movil/core/errors/exceptions.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_service.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/params/info_vehiculo_params.dart';
import 'package:sri_movil/core/resources/data_state.dart';

/*class MatriculacionVehicularRepositoryImpl
    implements MatriculacionVehicularRepository {
  final MatriculacionVehicularApiService _matriculacionVehicularApiService;
  //final AppDatabase _appDatabase;

  //const MatriculacionVehicularRepositoryImpl(this._matriculacionVehicularApiService, this._appDatabase);
  const MatriculacionVehicularRepositoryImpl(
      this._matriculacionVehicularApiService);

  @override
  Future<DataState<InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required InfoVehiculoRequestParams params}) async {
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
}*/

class MatriculacionVehicularRepositoryImpl
    implements MatriculacionVehicularRepository {
  final MatriculacionVehicularRemoteDataSource _remoteDataSource;

  MatriculacionVehicularRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required String idVehiculo}) async {
    try {
      final infoVehiculo = await _remoteDataSource.obtenerInformacionVehiculo(
          idVehiculo: idVehiculo);
      return Right(infoVehiculo);
    } on ServerException {
      return const Left(ServerFailure(
          message: 'Ha ocurrido un error al obtener los datos del servidor'));
    }
  }
}
