// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pim/src/model/adicional_model.dart';

class DescontosModel extends AdicionalModel{
  final double taxaInss;
  final double irrf;
  final double faltas;
  final double fgts;
  final double vt;

  DescontosModel({
    required this.taxaInss,
    required this.irrf,
    required this.faltas,
    required this.fgts,
    required this.vt, required super.horasExtra, required super.decimoTerceiro,
  });

  double calcularDecontos(double salario, double taxaInss, double irff,
      double faltas, double fgts, double vt) {
   return salario = salario - taxaInss - irrf - faltas - fgts - vt;
  }

}
