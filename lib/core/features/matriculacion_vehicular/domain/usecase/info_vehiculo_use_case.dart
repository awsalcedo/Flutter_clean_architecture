import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
//import 'package:sri_movil/core/params/info_vehiculo_params.dart';
//import 'package:sri_movil/core/resources/data_state.dart';
//import 'package:sri_movil/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

/*class InfoVehiculoUseCase
    implements
        UseCase<DataState<InfoVehiculoEntity>, InfoVehiculoRequestParams> {
  final MatriculacionVehicularRepository _repository;

  InfoVehiculoUseCase(this._repository);

  @override
  Future<DataState<InfoVehiculoEntity>> call(
      {required InfoVehiculoRequestParams params}) {
    return _repository.obtenerInfoVehiculoApi(params: params);
  }
}*/

class InfoVehiculoUseCase {
  final MatriculacionVehicularRepository _repository;

  InfoVehiculoUseCase(this._repository);

  Future<Either<Failure, InfoVehiculoEntity>> call(
      {required String idVehiculo}) async {
    return _repository.obtenerInfoVehiculoApi(idVehiculo: idVehiculo);
  }
}
