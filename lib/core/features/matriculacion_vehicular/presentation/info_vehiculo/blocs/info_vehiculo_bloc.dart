import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

part 'info_vehiculo_event.dart';
part 'info_vehiculo_state.dart';

class InfoVehiculoBloc extends Bloc<InfoVehiculoEvent, InfoVehiculoState> {
  final InfoVehiculoUseCase infoVehiculoUseCase;

  InfoVehiculoBloc({required this.infoVehiculoUseCase})
      : super(InfoVehiculoInitialState()) {
    on<ObtenerInfoVehiculoEvent>((event, emit) async {
      emit(InfoVehiculoLoadingState());

      final failureOrInfoVehiculo =
          await infoVehiculoUseCase(idVehiculo: event.idVehiculo);
      emit(_eitherInfoVehiculoOrErrorState(failureOrInfoVehiculo));
    });
  }

  InfoVehiculoState _eitherInfoVehiculoOrErrorState(
      Either<Failure, InfoVehiculoEntity> failureOrInfoVehiculo) {
    return failureOrInfoVehiculo.fold(
        (failure) => InfoVehiculoError(_mapFailureToMessage(failure)),
        (infoVehiculo) => InfoVehiculoLoaded(infoVehiculo));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Error inesperado';
    }
  }
}
