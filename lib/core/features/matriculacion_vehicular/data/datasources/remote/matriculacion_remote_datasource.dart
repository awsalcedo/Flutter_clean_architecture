import 'package:sri_movil/core/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';

abstract class MatriculacionVehicularRemoteDataSource {
  Future<InfoVehiculoModel> obtenerInformacionVehiculo(
      {required String idVehiculo});
}
