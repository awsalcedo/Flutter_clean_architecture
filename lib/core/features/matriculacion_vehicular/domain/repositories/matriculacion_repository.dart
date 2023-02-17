import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
//import 'package:sri_movil/core/params/info_vehiculo_params.dart';
//import 'package:sri_movil/core/resources/data_state.dart';
import 'package:dartz/dartz.dart';

/*abstract class MatriculacionVehicularRepository {
  Future<DataState<InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required InfoVehiculoRequestParams params});
}*/

abstract class MatriculacionVehicularRepository {
  Future<Either<Failure, InfoVehiculoEntity>> obtenerInfoVehiculoApi(
      {required String idVehiculo});
}
