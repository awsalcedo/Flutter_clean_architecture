import 'dart:convert';

import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';

class InfoVehiculoModel extends InfoVehiculoEntity {
  const InfoVehiculoModel({
    required int fechaUltimaMatricula,
    required int fechaCaducidadMatricula,
    required String cantonMatricula,
    required int fechaRevision,
    required double total,
    required String informacion,
    required String estadoAuto,
    required String mensajeMotivoAuto,
    required String placa,
    required String camvCpn,
    required int cilindraje,
    required int fechaCompra,
    required int anioUltimoPago,
    required String marca,
    required String modelo,
    required int anioModelo,
    required String paisFabricacion,
    required String clase,
    required String servicio,
    required String tipoUso,
    List<Deuda>? deudas,
    List<Tasa>? tasas,
    required String remision,
  }) : super(
            fechaUltimaMatricula: 0,
            fechaCaducidadMatricula: 0,
            cantonMatricula: '',
            fechaRevision: 0,
            total: 0.0,
            informacion: '',
            estadoAuto: '',
            mensajeMotivoAuto: '',
            placa: '',
            camvCpn: '',
            cilindraje: 0,
            fechaCompra: 0,
            anioUltimoPago: 0,
            marca: '',
            modelo: '',
            anioModelo: 0,
            paisFabricacion: '',
            clase: '',
            servicio: '',
            tipoUso: '',
            deudas: null,
            tasas: null,
            remision: '');

  factory InfoVehiculoModel.fromJson(Map<String, dynamic> json) =>
      InfoVehiculoModel(
        fechaUltimaMatricula: json["fechaUltimaMatricula"],
        fechaCaducidadMatricula: json["fechaCaducidadMatricula"],
        cantonMatricula: json["cantonMatricula"],
        fechaRevision: json["fechaRevision"],
        total: json["total"]?.toDouble(),
        informacion: json["informacion"],
        estadoAuto: json["estadoAuto"],
        mensajeMotivoAuto: json["mensajeMotivoAuto"],
        placa: json["placa"],
        camvCpn: json["camvCpn"],
        cilindraje: json["cilindraje"],
        fechaCompra: json["fechaCompra"],
        anioUltimoPago: json["anioUltimoPago"],
        marca: json["marca"],
        modelo: json["modelo"],
        anioModelo: json["anioModelo"],
        paisFabricacion: json["paisFabricacion"],
        clase: json["clase"],
        servicio: json["servicio"],
        tipoUso: json["tipoUso"],
        deudas: List<Deuda>.from(json["deudas"].map((x) => Deuda.fromJson(x))),
        tasas: List<Tasa>.from(json["tasas"].map((x) => Tasa.fromJson(x))),
        remision: json["remision"],
      );

  /*Map<String, dynamic> toJson() => {
        "fechaUltimaMatricula": fechaUltimaMatricula,
        "fechaCaducidadMatricula": fechaCaducidadMatricula,
        "cantonMatricula": cantonMatricula,
        "fechaRevision": fechaRevision,
        "total": total,
        "informacion": informacion,
        "estadoAuto": estadoAuto,
        "mensajeMotivoAuto": mensajeMotivoAuto,
        "placa": placa,
        "camvCpn": camvCpn,
        "cilindraje": cilindraje,
        "fechaCompra": fechaCompra,
        "anioUltimoPago": anioUltimoPago,
        "marca": marca,
        "modelo": modelo,
        "anioModelo": anioModelo,
        "paisFabricacion": paisFabricacion,
        "clase": clase,
        "servicio": servicio,
        "tipoUso": tipoUso,
        "deudas": List<dynamic>.from(deudas.map((x) => x.toJson())),
        "tasas": List<dynamic>.from(tasas.map((x) => x.toJson())),
        "remision": remision,
      };*/
}

class Deuda {
  Deuda({
    required this.descripcion,
    required this.rubros,
    required this.subtotal,
  });

  final String descripcion;
  final List<Rubro> rubros;
  final double subtotal;

  //factory Deuda.fromRawJson(String str) => Deuda.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Deuda.fromJson(Map<String, dynamic> json) => Deuda(
        descripcion: json["descripcion"],
        rubros: List<Rubro>.from(json["rubros"].map((x) => Rubro.fromJson(x))),
        subtotal: json["subtotal"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "rubros": List<dynamic>.from(rubros.map((x) => x.toJson())),
        "subtotal": subtotal,
      };
}

class Rubro {
  Rubro({
    required this.descripcion,
    required this.valor,
    required this.periodoFiscal,
    required this.beneficiario,
    required this.detallesRubro,
  });

  final String descripcion;
  final double valor;
  final String periodoFiscal;
  final String beneficiario;
  final List<DetallesRubro> detallesRubro;

  factory Rubro.fromJson(Map<String, dynamic> json) => Rubro(
        descripcion: json["descripcion"],
        valor: json["valor"]?.toDouble(),
        periodoFiscal: json["periodoFiscal"],
        beneficiario: json["beneficiario"],
        detallesRubro: List<DetallesRubro>.from(
            json["detallesRubro"].map((x) => DetallesRubro.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "valor": valor,
        "periodoFiscal": periodoFiscal,
        "beneficiario": beneficiario,
        "detallesRubro":
            List<dynamic>.from(detallesRubro.map((x) => x.toJson())),
      };
}

class DetallesRubro {
  DetallesRubro({
    required this.descripcion,
    required this.anio,
    required this.valor,
  });

  final String descripcion;
  final int anio;
  final double valor;

  factory DetallesRubro.fromJson(Map<String, dynamic> json) => DetallesRubro(
        descripcion: json["descripcion"],
        anio: json["anio"],
        valor: json["valor"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "anio": anio,
        "valor": valor,
      };
}

class Tasa {
  Tasa({
    required this.descripcion,
    required this.deudas,
    required this.subtotal,
  });

  final String descripcion;
  final List<Deuda> deudas;
  final double subtotal;

  factory Tasa.fromJson(Map<String, dynamic> json) => Tasa(
        descripcion: json["descripcion"],
        deudas: List<Deuda>.from(json["deudas"].map((x) => Deuda.fromJson(x))),
        subtotal: json["subtotal"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "deudas": List<dynamic>.from(deudas.map((x) => x.toJson())),
        "subtotal": subtotal,
      };
}
