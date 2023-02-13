import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_service.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/repositories/matriculacion_repository_impl.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
// Dio client
  injector.registerSingleton<Dio>(Dio());

// Services
  injector.registerSingleton<MatriculacionVehicularApiService>(
      MatriculacionVehicularApiService(injector()));

// Repositories
  injector.registerSingleton<MatriculacionVehicularRepository>(
      MatriculacionVehicularRepositoryImpl(injector()));

// UseCases
  injector.registerSingleton(InfoVehiculoUseCase(injector()));
}
