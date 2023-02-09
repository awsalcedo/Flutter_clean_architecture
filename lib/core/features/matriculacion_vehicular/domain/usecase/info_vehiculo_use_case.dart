import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sri_movil/core/error/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repository/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/usecases/usecase.dart';

@injectable
class InfoVehiculoUseCase extends UseCase<InfoVehiculoEntity, Params> {
  final MatriculacionVehicularRepository _repository;
  InfoVehiculoUseCase(this._repository);

  @override
  Future<Either<Failure, InfoVehiculoEntity>> call(
      Params params) async {
    return await _repository.obtenerInfoVehiculoApi(params.placa);
  }
}


class Params extends Equatable {
  final String placa;

  const Params({required this.placa}) : super();
  
  @override
  List<Object?> get props {return [placa];}
  
}