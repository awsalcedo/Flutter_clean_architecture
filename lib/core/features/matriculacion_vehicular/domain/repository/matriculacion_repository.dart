import 'package:dartz/dartz.dart';
import 'package:sri_movil/core/error/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';

abstract class MatriculacionVehicularRepository {
  Future<Either<Failure,InfoVehiculoEntity>> obtenerInfoVehiculoApi(String placa);
}
