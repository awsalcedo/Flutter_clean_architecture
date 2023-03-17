import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/network/network_info.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';

class MatriculacionVehicularRepositoryImpl
    implements MatriculacionVehicularRepository {
  final MatriculacionVehicularRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MatriculacionVehicularRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required String idVehiculo}) async {
    var result = await networkInfo.isConnected;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      final infoVehiculoEither = await remoteDataSource
          .obtenerInformacionVehiculo(idVehiculo: idVehiculo);
      return infoVehiculoEither.fold((failure) => Left(failure),
          (infoVehiculoModel) => Right(infoVehiculoModel.toEntity()));
    } else {
      return Left(NetworkFailure());
    }

    /*final infoVehiculoEither = await _remoteDataSource
        .obtenerInformacionVehiculo2(idVehiculo: idVehiculo);
    return infoVehiculoEither.fold((failure) => Left(failure),
        (infoVehiculoModel) => Right(infoVehiculoModel.toEntity()));*/
  }
}
