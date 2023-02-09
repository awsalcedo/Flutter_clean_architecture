import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/model/info_vehiculo_model.dart';

part 'matriculacion_api.g.dart';

@injectable
@RestApi()
abstract class MatriculacionVehicularApi {
  @factoryMethod
  factory MatriculacionVehicularApi(Dio http,
      {@Named("baseURL") String baseUrl}) = _MatriculacionVehicularApi;

      @GET("v1.0/matriculacion/valor/")
      Future<InfoVehiculoModel> obtenerInfoVehiculoApi();
}


