import 'dart:convert';
import 'dart:ffi';

import 'package:sri_movil/core/features/matriculacion_vehicular/domain/entities/info_vehiculo_entity.dart';

InfoVehiculoModel infoVehiculoModelFromJson(String str) =>
    InfoVehiculoModel.fromJson(json.decode(str));

String infoVehiculoModelToJson(InfoVehiculoModel data) =>
    json.encode(data.toJson());

class InfoVehiculoModel extends InfoVehiculoEntity {
  final int fechaUltimaMatricula;
  final int fechaCaducidadMatricula;
  final String cantonMatricula;
  final int fechaRevision;
  final double total;
  final String informacion;
  final String estadoAuto;
  final String mensajeMotivoAuto;
  final String placa;
  final String camvCpn;
  final double cilindraje;
  final int fechaCompra;
  final int anioUltimoPago;
  final String marca;
  final String modelo;
  final int anioModelo;
  final String paisFabricacion;
  final String clase;
  final String servicio;
  final String tipoUso;
  final List<DeudaModel> deudas;
  final List<TasaModel> tasas;
  final String remision;

  const InfoVehiculoModel({
    required this.fechaUltimaMatricula,
    required this.fechaCaducidadMatricula,
    required this.cantonMatricula,
    required this.fechaRevision,
    required this.total,
    required this.informacion,
    required this.estadoAuto,
    required this.mensajeMotivoAuto,
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
    required this.remision,
  }) : super(
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
            deudas: deudas,
            tasas: tasas,
            remision: remision);

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
        /*deudas: List<DeudaModel>.from(
            json["deudas"].map((x) => DeudaModel.fromJson(x))),*/
        deudas: json["deudas"] is List<DeudaModel>
            ? List<DeudaModel>.from(
                json["deudas"].map((x) => DeudaModel.fromJson(x)))
            : [],
        /*tasas: List<TasaModel>.from(
            json["tasas"].map((x) => TasaModel.fromJson(x))),*/
        tasas: json["tasas"] is List<TasaModel>
            ? List<TasaModel>.from(
                json["tasas"].map((x) => TasaModel.fromJson(x)))
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
}

class DeudaModel extends Deuda {
  const DeudaModel({
    required this.descripcion,
    required this.rubros,
    required this.subtotal,
  }) : super(descripcion: descripcion, rubros: rubros, subtotal: subtotal);

  final String descripcion;
  final List<RubroModel> rubros;
  final double subtotal;

  factory DeudaModel.fromJson(Map<String, dynamic> json) => DeudaModel(
        descripcion: json["descripcion"],
        rubros: List<RubroModel>.from(
            json["rubros"].map((x) => RubroModel.fromJson(x))),
        subtotal: json["subtotal"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "rubros": List<dynamic>.from(rubros.map((x) => x.toJson())),
        "subtotal": subtotal,
      };
}

class RubroModel extends Rubro {
  const RubroModel({
    required this.descripcion,
    required this.valor,
    required this.periodoFiscal,
    required this.beneficiario,
    required this.detallesRubro,
  }) : super(
            descripcion: descripcion,
            valor: valor,
            periodoFiscal: periodoFiscal,
            beneficiario: beneficiario,
            detallesRubro: detallesRubro);

  final String descripcion;
  final double valor;
  final String periodoFiscal;
  final String beneficiario;
  final List<DetallesRubroModel> detallesRubro;

  factory RubroModel.fromJson(Map<String, dynamic> json) => RubroModel(
        descripcion: json["descripcion"],
        valor: json["valor"]?.toDouble(),
        periodoFiscal: json["periodoFiscal"],
        beneficiario: json["beneficiario"],
        detallesRubro: List<DetallesRubroModel>.from(
            json["detallesRubro"].map((x) => DetallesRubroModel.fromJson(x))),
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

class DetallesRubroModel extends DetallesRubro {
  const DetallesRubroModel({
    required this.descripcion,
    required this.anio,
    required this.valor,
  }) : super(descripcion: descripcion, anio: anio, valor: valor);

  final String descripcion;
  final int anio;
  final double valor;

  factory DetallesRubroModel.fromJson(Map<String, dynamic> json) =>
      DetallesRubroModel(
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

class TasaModel extends Tasa {
  const TasaModel({
    required this.descripcion,
    required this.deudas,
    required this.subtotal,
  }) : super(descripcion: descripcion, deudas: deudas, subtotal: subtotal);

  final String descripcion;
  final List<DeudaModel> deudas;
  final double subtotal;

  factory TasaModel.fromJson(Map<String, dynamic> json) => TasaModel(
        descripcion: json["descripcion"],
        deudas: List<DeudaModel>.from(
            json["deudas"].map((x) => DeudaModel.fromJson(x))),
        subtotal: json["subtotal"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "deudas": List<dynamic>.from(deudas.map((x) => x.toJson())),
        "subtotal": subtotal,
      };
}
