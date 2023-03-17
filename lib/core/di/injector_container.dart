import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:sri_movil/core/network/network_info.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_data_source_impl.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/repositories/matriculacion_repository_impl.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
import 'package:sri_movil/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
import 'package:sri_movil/features/matriculacion_vehicular/presentation/info_vehiculo/blocs/info_vehiculo_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
//! External
// Http client
  injector.registerSingleton(http.Client());

  // Firebase Analytics Google Analytics G4

  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);

  injector.registerSingleton<FirebaseAnalytics>(firebaseAnalytics);
  injector.registerSingleton<FirebaseAnalyticsObserver>(observer);

// Network info
  injector
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));
  injector.registerLazySingleton(() => Connectivity());
//! Features Matriculacion

// Services

  injector.registerSingleton<MatriculacionVehicularRemoteDataSource>(
      MatriculacionVehicularRemoteDataSourceImpl(injector()));

// Repositories
  injector.registerSingleton<MatriculacionVehicularRepository>(
      MatriculacionVehicularRepositoryImpl(injector(), injector()));

// UseCases
  injector.registerSingleton(InfoVehiculoUseCase(injector()));
  //injector.registerLazySingleton(() => InfoVehiculoUseCase(injector()));

// Bloc
  injector.registerFactory<InfoVehiculoBloc>(
      () => InfoVehiculoBloc(infoVehiculoUseCase: injector()));
}
