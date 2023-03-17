import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sri_movil/configuracion_global.dart';
import 'package:sri_movil/core/errors/exceptions.dart';
import 'package:sri_movil/core/errors/failures.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/datasources/remote/matriculacion_remote_datasource.dart';
import 'package:sri_movil/features/matriculacion_vehicular/data/models/info_vehiculo_model.dart';
import 'package:http/http.dart' as http;

class MatriculacionVehicularRemoteDataSourceImpl
    implements MatriculacionVehicularRemoteDataSource {
  final http.Client _client;

  MatriculacionVehicularRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, InfoVehiculoModel>> obtenerInformacionVehiculo(
      {required String idVehiculo}) async {
    try {
      final url = Uri.parse(kBaseUrl + kEndPointMatriculacion + idVehiculo);
      final response =
          await _client.get(url).timeout(const Duration(milliseconds: 30000));
      if (response.statusCode == 200) {
        //final jsonBody = jsonDecode(response.body);
        final decodedData = json.decode(response.body);
        final infoVehiculoModel = InfoVehiculoModel.fromJson(decodedData);
        return Right(infoVehiculoModel);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
