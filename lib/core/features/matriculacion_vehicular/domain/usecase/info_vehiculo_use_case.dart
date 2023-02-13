import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/params/info_vehiculo_params.dart';
import 'package:sri_movil/core/resources/data_state.dart';
import 'package:sri_movil/core/usecase/usecase.dart';

class InfoVehiculoUseCase
    implements
        UseCase<DataState<InfoVehiculoEntity>, InfoVehiculoRequestParams> {
  final MatriculacionVehicularRepository _repository;

  InfoVehiculoUseCase(this._repository);

  @override
  Future<DataState<InfoVehiculoEntity>> call(InfoVehiculoRequestParams params) {
    return _repository.obtenerInfoVehiculoApi(params);
  }
}
