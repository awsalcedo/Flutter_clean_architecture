import 'package:sri_movil/configuracion_global.dart';
import 'package:sri_movil/core/errors/exceptions.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';
import 'package:http/http.dart' as http;

class MatriculacionVehicularRemoteDataSourceImpl
    implements MatriculacionVehicularRemoteDataSource {
  final http.Client _client;

  MatriculacionVehicularRemoteDataSourceImpl(this._client);

  @override
  Future<InfoVehiculoModel> obtenerInformacionVehiculo(
      {required String idVehiculo}) async {
    final url = Uri.parse(kBaseUrl + kEndPointMatriculacion + idVehiculo);
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return infoVehiculoModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
