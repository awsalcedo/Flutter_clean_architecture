import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:dartz/dartz.dart';

class InfoVehiculoUseCase {
  final MatriculacionVehicularRepository _repository;

  InfoVehiculoUseCase(this._repository);

  Future<Either<Failure, InfoVehiculoEntity>> call(
      {required String idVehiculo}) async {
    return _repository.obtenerInfoVehiculoApi(idVehiculo: idVehiculo);
  }
}
