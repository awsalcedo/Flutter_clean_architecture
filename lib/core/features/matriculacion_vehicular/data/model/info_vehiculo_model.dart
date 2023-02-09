import 'package:json_annotation/json_annotation.dart';
part 'info_vehiculo_model.g.dart';

@JsonSerializable()
class InfoVehiculoModel {
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
  final List<Deuda> deudas;
  final List<Tasa> tasas;
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
  });

  factory InfoVehiculoModel.fromJson(Map<String, dynamic> json) {return _$InfoVehiculoModelFromJson(json);}
    
}

@JsonSerializable()
class Deuda {
  Deuda({
    required this.descripcion,
    required this.rubros,
    required this.subtotal,
  });

  String descripcion;
  List<Rubro> rubros;
  double subtotal;

  factory Deuda.fromJson(Map<String, dynamic> json) {return _$DeudaFromJson(json);}
  
}

@JsonSerializable()
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

  factory Rubro.fromJson(Map<String, dynamic> json) {return _$RubroFromJson(json);}
        
}

@JsonSerializable()
class DetallesRubro {
  DetallesRubro({
    required this.descripcion,
    required this.anio,
    required this.valor,
  });

  final String descripcion;
  final int anio;
  final double valor;

  factory DetallesRubro.fromJson(Map<String, dynamic> json) {return _$DetallesRubroFromJson(json);}
   
}

@JsonSerializable()
class Tasa {
  Tasa({
    required this.descripcion,
    required this.deudas,
    required this.subtotal,
  });

  final String descripcion;
  final List<Deuda> deudas;
  final double subtotal;

  factory Tasa.fromJson(Map<String, dynamic> json) {return _$TasaFromJson(json);}
        
}
