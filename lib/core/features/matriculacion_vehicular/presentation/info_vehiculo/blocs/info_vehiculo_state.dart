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

class InfoVehiculoLoaded extends InfoVehiculoState {
  final InfoVehiculoEntity newInfoVehiculoEntity;

  const InfoVehiculoLoaded(this.newInfoVehiculoEntity)
      : super(infoVehiculoEntidad: newInfoVehiculoEntity);
}

class InfoVehiculoError extends InfoVehiculoState {
  final String message;

  const InfoVehiculoError(this.message);

  @override
  List<Object> get props => [message];
}
