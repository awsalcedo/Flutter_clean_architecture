import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';

part 'matriculacion_service.g.dart';

@RestApi()
abstract class MatriculacionVehicularApiService {
  factory MatriculacionVehicularApiService(Dio dio,
      {@Named("BASE_URL") String baseUrl}) = _MatriculacionVehicularApiService;

  @GET("v1.0/matriculacion/valor/")
  Future<HttpResponse<InfoVehiculoModel>> obtenerInfoVehiculoApi(String placa);

  /*@GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles({
    @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  });*/
}
