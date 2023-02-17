part of 'info_vehiculo_bloc.dart';

abstract class InfoVehiculoEvent extends Equatable {
  const InfoVehiculoEvent();

  @override
  List<Object> get props => [];
}

class ObtenerInfoVehiculoEvent extends InfoVehiculoEvent {
  final InfoVehiculoEntity infoVehiculoEntity;
  final String idVehiculo;

  const ObtenerInfoVehiculoEvent(this.infoVehiculoEntity, this.idVehiculo);
}
