import 'dart:convert';

import 'package:sri_movil/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';

InfoVehiculoModel infoVehiculoModelFromJson(String str) =>
    InfoVehiculoModel.fromJson(json.decode(str));

String infoVehiculoModelToJson(InfoVehiculoModel data) =>
    json.encode(data.toJson());

class InfoVehiculoModel {
  InfoVehiculoModel({
    required this.fechaUltimaMatricula,
    required this.fechaCaducidadMatricula,
    required this.cantonMatricula,
    required this.fechaRevision,
    required this.total,
    this.informacion,
    required this.estadoAuto,
    this.mensajeMotivoAuto,
    required this.placa,
    required this.camvCpn,
    required this.cilindraje,
    required this.fechaCompra,
    required this.anioUltimoPago,
    required this.marca,
    required this.modelo,
    required this.anioModelo,
    required this.paisFabricacion,
    required this.clase,
    required this.servicio,
    required this.tipoUso,
    required this.deudas,
    required this.tasas,
    this.remision,
  });

  int fechaUltimaMatricula;
  int fechaCaducidadMatricula;
  String cantonMatricula;
  int fechaRevision;
  double total;
  dynamic informacion;
  String estadoAuto;
  dynamic mensajeMotivoAuto;
  String placa;
  String camvCpn;
  double cilindraje;
  int fechaCompra;
  int anioUltimoPago;
  String marca;
  String modelo;
  int anioModelo;
  String paisFabricacion;
  String clase;
  String servicio;
  String tipoUso;
  List<Deuda> deudas;
  List<Tasa> tasas;
  dynamic remision;

  factory InfoVehiculoModel.fromJson(Map<String, dynamic> json) =>
      InfoVehiculoModel(
        fechaUltimaMatricula: json["fechaUltimaMatricula"],
        fechaCaducidadMatricula: json["fechaCaducidadMatricula"],
        cantonMatricula: json["cantonMatricula"],
        fechaRevision: json["fechaRevision"],
        total: json["total"] is double ? double.parse(json["total"]) : 0.0,
        informacion: json["informacion"],
        estadoAuto: json["estadoAuto"],
        mensajeMotivoAuto: json["mensajeMotivoAuto"] is String
            ? json["mensajeMotivoAuto"]
            : "",
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
        deudas: json["deudas"] is List<Deuda>
            ? List<Deuda>.from(json["deudas"].map((x) => Deuda.fromJson(x)))
            : [],
        tasas: json["tasas"] is List<Tasa>
            ? List<Tasa>.from(json["tasas"].map((x) => Tasa.fromJson(x)))
            : [],
        remision: json["remision"] is String ? json["remision"] : "",
      );

  Map<String, dynamic> toJson() => {
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
      };

  InfoVehiculoEntity toEntity() {
    return InfoVehiculoEntity(
        fechaUltimaMatricula: fechaUltimaMatricula,
        fechaCaducidadMatricula: fechaCaducidadMatricula,
        cantonMatricula: cantonMatricula,
        fechaRevision: fechaRevision,
        total: total,
        informacion: informacion,
        estadoAuto: estadoAuto,
        mensajeMotivoAuto: mensajeMotivoAuto,
        placa: placa,
        camvCpn: camvCpn,
        cilindraje: cilindraje,
        fechaCompra: fechaCompra,
        anioUltimoPago: anioUltimoPago,
        marca: marca,
        modelo: modelo,
        anioModelo: anioModelo,
        paisFabricacion: paisFabricacion,
        clase: clase,
        servicio: servicio,
        tipoUso: tipoUso,
        deudas: const [],
        tasas: const [],
        remision: remision);
  }
}

class Deuda {
  Deuda({
    required this.descripcion,
    required this.rubros,
    required this.subtotal,
  });

  String descripcion;
  List<Rubro> rubros;
  double subtotal;

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

  String descripcion;
  double valor;
  String periodoFiscal;
  String beneficiario;
  List<DetallesRubro> detallesRubro;

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

  String descripcion;
  int anio;
  double valor;

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

  String descripcion;
  List<Deuda> deudas;
  double subtotal;

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
