// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdicionalModel {
  final double horasExtra;
  final double decimoTerceiro;

  AdicionalModel({
    required this.horasExtra,
    required this.decimoTerceiro,
  });

  double calcularAdicional(
      double salario, double horasExtra, double decimoTerceiro) {
     return salario = salario + horasExtra + decimoTerceiro;
  }

  AdicionalModel copyWith({
    double? horasExtra,
    double? decimoTerceiro,
  }) {
    return AdicionalModel(
      horasExtra: horasExtra ?? this.horasExtra,
      decimoTerceiro: decimoTerceiro ?? this.decimoTerceiro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'horasExtra': horasExtra,
      'decimoTerceiro': decimoTerceiro,
    };
  }

  factory AdicionalModel.fromMap(Map<String, dynamic> map) {
    return AdicionalModel(
      horasExtra: map['horasExtra'] as double,
      decimoTerceiro: map['decimoTerceiro'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdicionalModel.fromJson(String source) =>
      AdicionalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AdicionalModel(horasExtra: $horasExtra, decimoTerceiro: $decimoTerceiro)';

  @override
  bool operator ==(covariant AdicionalModel other) {
    if (identical(this, other)) return true;

    return other.horasExtra == horasExtra &&
        other.decimoTerceiro == decimoTerceiro;
  }

  @override
  int get hashCode => horasExtra.hashCode ^ decimoTerceiro.hashCode;
}
