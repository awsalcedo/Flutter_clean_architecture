//import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
//import 'package:sri_movil/core/features/matriculacion_vehicular/domain/repositories/matriculacion_repository.dart';
//import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';
import 'package:sri_movil/core/params/info_vehiculo_params.dart';
import 'package:sri_movil/injector.dart';

void main(List<String> args) async {
  initializeDependencies();
  //final repository = MatriculacionVehicularRepository();
  var params = InfoVehiculoRequestParams("GXH0323");
  final usecase = InfoVehiculoUseCase(injector());

  final resp = await usecase(params);
  print(resp.data.toString());
}
