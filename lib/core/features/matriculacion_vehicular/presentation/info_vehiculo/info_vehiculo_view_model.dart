import 'package:flutter/foundation.dart';
import 'package:sri_movil/core/features/matriculacion_vehicular/domain/usecase/info_vehiculo_use_case.dart';

class InfoVehiculoViewModel extends ChangeNotifier {
  InfoVehiculoViewModel({required this.infoVehiculoUseCase});
  final InfoVehiculoUseCase infoVehiculoUseCase;
}
