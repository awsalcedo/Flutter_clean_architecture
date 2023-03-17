import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

part 'info_vehiculo_event.dart';
part 'info_vehiculo_state.dart';

class InfoVehiculoBloc extends Bloc<InfoVehiculoEvent, InfoVehiculoState> {
  final InfoVehiculoUseCase infoVehiculoUseCase;

  InfoVehiculoBloc({required this.infoVehiculoUseCase})
      : super(InfoVehiculoInitialState()) {
    on<ObtenerInfoVehiculoEvent>(_onObtenerInfoVehiculoEvent);
  }

  _onObtenerInfoVehiculoEvent(
      ObtenerInfoVehiculoEvent event, Emitter<InfoVehiculoState> emit) async {
    emit(InfoVehiculoLoadingState());

    final infoVehiculoEither =
        await infoVehiculoUseCase(idVehiculo: event.idVehiculo);
    emit(_eitherInfoVehiculoOrErrorState(infoVehiculoEither));
  }

  InfoVehiculoState _eitherInfoVehiculoOrErrorState(
      Either<Failure, InfoVehiculoEntity> infoVehiculoEither) {
    return infoVehiculoEither.fold(
        (failure) => InfoVehiculoErrorState(_mapFailureToMessage(failure)),
        (infoVehiculo) => InfoVehiculoLoadedState(infoVehiculo));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Error de servidor.';
      case NetworkFailure:
        return 'Error de red.';
      default:
        return 'Error inesperado.';
    }
  }
}
