import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_data_source_impl.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/datasources/remote/matriculacion_service.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/repositories/matriculacion_repository_impl.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
//! External

// Dio client
  injector.registerSingleton<Dio>(Dio());

// Http client

  injector.registerSingleton(http.Client());

//! Features Matriculacion

// Services
  injector.registerSingleton<MatriculacionVehicularApiService>(
      MatriculacionVehicularApiService(injector()));

  injector.registerSingleton<MatriculacionVehicularRemoteDataSource>(
      MatriculacionVehicularRemoteDataSourceImpl(injector()));

// Repositories
  injector.registerSingleton<MatriculacionVehicularRepository>(
      MatriculacionVehicularRepositoryImpl(injector()));

// UseCases
  injector.registerSingleton(InfoVehiculoUseCase(injector()));
  //injector.registerLazySingleton(() => InfoVehiculoUseCase(injector()));

// Bloc
  injector.registerFactory<InfoVehiculoBloc>(
      () => InfoVehiculoBloc(infoVehiculoUseCase: injector()));
}
