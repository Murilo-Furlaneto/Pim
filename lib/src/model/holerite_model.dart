// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:pim/src/model/descontos_model.dart';

class HoleriteModel extends DescontosModel {
  final String _codHolerite = UniqueKey().toString();
  final DateTime dataReferencia;

  HoleriteModel({
    required this.dataReferencia,
    required super.taxaInss,
    required super.irrf,
    required super.faltas,
    required super.fgts,
    required super.vt,
    required super.horasExtra,
    required super.decimoTerceiro,
  });

  String get codigoHolerite => _codHolerite;

 
}
