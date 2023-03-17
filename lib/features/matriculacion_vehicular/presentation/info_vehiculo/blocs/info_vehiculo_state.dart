part of 'info_vehiculo_bloc.dart';

abstract class InfoVehiculoState extends Equatable {
  final String? idVehiculo;
  final InfoVehiculoEntity? infoVehiculoEntidad;
  const InfoVehiculoState({this.idVehiculo, this.infoVehiculoEntidad});

  @override
  List<Object> get props => [];
}

class InfoVehiculoInitialState extends InfoVehiculoState {}

class InfoVehiculoLoadingState extends InfoVehiculoState {}

class InfoVehiculoLoadedState extends InfoVehiculoState {
  final InfoVehiculoEntity newInfoVehiculoEntity;

  const InfoVehiculoLoadedState(this.newInfoVehiculoEntity)
      : super(infoVehiculoEntidad: newInfoVehiculoEntity);
}

class InfoVehiculoErrorState extends InfoVehiculoState {
  final String message;

  const InfoVehiculoErrorState(this.message);

  @override
  List<Object> get props => [message];
}
