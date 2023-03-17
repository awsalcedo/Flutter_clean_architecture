import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MatriculacionVehicularRepository {
  Future<Either<Failure, InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required String idVehiculo});
}
