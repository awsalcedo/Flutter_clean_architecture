import 'package:equatable/equatable.dart';

class InfoVehiculoEntity extends Equatable {
  const InfoVehiculoEntity({
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

  @override
  List<Object> get props {
    return [
      fechaUltimaMatricula,
      fechaCaducidadMatricula,
      cantonMatricula,
      fechaRevision,
      total,
      informacion,
      estadoAuto,
      mensajeMotivoAuto,
      placa,
      camvCpn,
      cilindraje,
      fechaCompra,
      anioUltimoPago,
      marca,
      modelo,
      anioModelo,
      paisFabricacion,
      clase,
      servicio,
      tipoUso,
      deudas, //[],
      tasas, //[],
      remision
    ];
  }
}

class Deuda extends Equatable {
  const Deuda({
    required this.descripcion,
    required this.rubros,
    required this.subtotal,
  });

  final String descripcion;
  final List<Rubro> rubros;
  final double subtotal;

  @override
  List<Object?> get props => [descripcion, rubros, subtotal];
}

class Rubro extends Equatable {
  const Rubro({
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

  @override
  List<Object?> get props =>
      [descripcion, valor, periodoFiscal, beneficiario, detallesRubro];
}

class DetallesRubro extends Equatable {
  const DetallesRubro({
    required this.descripcion,
    required this.anio,
    required this.valor,
  });

  final String descripcion;
  final int anio;
  final double valor;

  @override
  List<Object?> get props => [descripcion, anio, valor];
}

class Tasa extends Equatable {
  const Tasa({
    required this.descripcion,
    required this.deudas,
    required this.subtotal,
  });

  final String descripcion;
  final List<Deuda> deudas;
  final double subtotal;

  @override
  List<Object?> get props => [descripcion, deudas, subtotal];
}
