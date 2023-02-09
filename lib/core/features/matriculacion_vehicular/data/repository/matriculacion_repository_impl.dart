import 'package:dartz/dartz.dart';
import 'package:sri_movil/core/error/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/repository/matriculacion_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';

@Injectable(as: MatriculacionVehicularRepository)
class MatriculacionVehicularRepositoryImpl
    implements MatriculacionVehicularRepository {
  final MatriculacionVehicularRepository _matriculacionVehicularRepository;

  MatriculacionVehicularRepositoryImpl(this._matriculacionVehicularRepository);

  @override
  Future<Either<Failure,InfoVehiculoEntity>> obtenerInfoVehiculoApi({required String placa}) =>
      _matriculacionVehicularRepository.obtenerInfoVehiculoApi(placa: placa);
}
