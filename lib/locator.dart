import 'package:get_it/get_it.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/data/repository/matriculacion_repository_impl.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MatriculacionVehicularRepositoryImpl);
}
