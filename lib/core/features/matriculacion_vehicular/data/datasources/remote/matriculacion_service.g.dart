// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matriculacion_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MatriculacionVehicularApiService
    implements MatriculacionVehicularApiService {
  _MatriculacionVehicularApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'srienlinea.sri.gob.ec/movil-servicios/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<InfoVehiculoModel>> obtenerInfoVehiculoApi(placa) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<InfoVehiculoModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'v1.0/matriculacion/valor/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InfoVehiculoModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
