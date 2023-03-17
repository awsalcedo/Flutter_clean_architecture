import 'package:dartz/dartz.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';

abstract class MatriculacionVehicularRemoteDataSource {
  Future<Either<Failure, InfoVehiculoModel>> obtenerInformacionVehiculo(
      {required String idVehiculo});
}
