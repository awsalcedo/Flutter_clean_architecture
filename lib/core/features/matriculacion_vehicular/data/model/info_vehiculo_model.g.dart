// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_vehiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoVehiculoModel _$InfoVehiculoModelFromJson(Map<String, dynamic> json) =>
    InfoVehiculoModel(
      fechaUltimaMatricula: json['fechaUltimaMatricula'] as int,
      fechaCaducidadMatricula: json['fechaCaducidadMatricula'] as int,
      cantonMatricula: json['cantonMatricula'] as String,
      fechaRevision: json['fechaRevision'] as int,
      total: (json['total'] as num).toDouble(),
      informacion: json['informacion'] as String,
      estadoAuto: json['estadoAuto'] as String,
      mensajeMotivoAuto: json['mensajeMotivoAuto'] as String,
      placa: json['placa'] as String,
      camvCpn: json['camvCpn'] as String,
      cilindraje: (json['cilindraje'] as num).toDouble(),
      fechaCompra: json['fechaCompra'] as int,
      anioUltimoPago: json['anioUltimoPago'] as int,
      marca: json['marca'] as String,
      modelo: json['modelo'] as String,
      anioModelo: json['anioModelo'] as int,
      paisFabricacion: json['paisFabricacion'] as String,
      clase: json['clase'] as String,
      servicio: json['servicio'] as String,
      tipoUso: json['tipoUso'] as String,
      deudas: (json['deudas'] as List<dynamic>)
          .map((e) => Deuda.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasas: (json['tasas'] as List<dynamic>)
          .map((e) => Tasa.fromJson(e as Map<String, dynamic>))
          .toList(),
      remision: json['remision'] as String,
    );

Map<String, dynamic> _$InfoVehiculoModelToJson(InfoVehiculoModel instance) =>
    <String, dynamic>{
      'fechaUltimaMatricula': instance.fechaUltimaMatricula,
      'fechaCaducidadMatricula': instance.fechaCaducidadMatricula,
      'cantonMatricula': instance.cantonMatricula,
      'fechaRevision': instance.fechaRevision,
      'total': instance.total,
      'informacion': instance.informacion,
      'estadoAuto': instance.estadoAuto,
      'mensajeMotivoAuto': instance.mensajeMotivoAuto,
      'placa': instance.placa,
      'camvCpn': instance.camvCpn,
      'cilindraje': instance.cilindraje,
      'fechaCompra': instance.fechaCompra,
      'anioUltimoPago': instance.anioUltimoPago,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'anioModelo': instance.anioModelo,
      'paisFabricacion': instance.paisFabricacion,
      'clase': instance.clase,
      'servicio': instance.servicio,
      'tipoUso': instance.tipoUso,
      'deudas': instance.deudas,
      'tasas': instance.tasas,
      'remision': instance.remision,
    };

Deuda _$DeudaFromJson(Map<String, dynamic> json) => Deuda(
      descripcion: json['descripcion'] as String,
      rubros: (json['rubros'] as List<dynamic>)
          .map((e) => Rubro.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$DeudaToJson(Deuda instance) => <String, dynamic>{
      'descripcion': instance.descripcion,
      'rubros': instance.rubros,
      'subtotal': instance.subtotal,
    };

Rubro _$RubroFromJson(Map<String, dynamic> json) => Rubro(
      descripcion: json['descripcion'] as String,
      valor: (json['valor'] as num).toDouble(),
      periodoFiscal: json['periodoFiscal'] as String,
      beneficiario: json['beneficiario'] as String,
      detallesRubro: (json['detallesRubro'] as List<dynamic>)
          .map((e) => DetallesRubro.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RubroToJson(Rubro instance) => <String, dynamic>{
      'descripcion': instance.descripcion,
      'valor': instance.valor,
      'periodoFiscal': instance.periodoFiscal,
      'beneficiario': instance.beneficiario,
      'detallesRubro': instance.detallesRubro,
    };

DetallesRubro _$DetallesRubroFromJson(Map<String, dynamic> json) =>
    DetallesRubro(
      descripcion: json['descripcion'] as String,
      anio: json['anio'] as int,
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$DetallesRubroToJson(DetallesRubro instance) =>
    <String, dynamic>{
      'descripcion': instance.descripcion,
      'anio': instance.anio,
      'valor': instance.valor,
    };

Tasa _$TasaFromJson(Map<String, dynamic> json) => Tasa(
      descripcion: json['descripcion'] as String,
      deudas: (json['deudas'] as List<dynamic>)
          .map((e) => Deuda.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$TasaToJson(Tasa instance) => <String, dynamic>{
      'descripcion': instance.descripcion,
      'deudas': instance.deudas,
      'subtotal': instance.subtotal,
    };
