// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pim/src/model/pessoa_model.dart';

enum TipoFuncionario {
  gestor,
  padrao,
}

class FuncionarioModel extends PessoaModel {
  final int codF;
  final String email;
  final String senha;
  final String cargo;
  final double salario;
  final double horasTrabalhadas;
  final double comissao;
  final double pis;
  final String cnh;
  final String rg;
  final DateTime certcodFaoNascimento;
  final String copiaEndereco;
  bool isGestor = false;
  final TipoFuncionario tipoFuncionario;

  FuncionarioModel({
    required this.codF,
    required nome,
    required cpf,
    required this.email,
    required this.senha,
    required this.cargo,
    required this.salario,
    required this.horasTrabalhadas,
    required this.comissao,
    required this.pis,
    required this.cnh,
    required this.rg,
    required this.certcodFaoNascimento,
    required this.copiaEndereco,
    required this.isGestor,
    required this.tipoFuncionario,
  }) : super(nome: nome, cpf: cpf);

  bool imprimirTipoFuncionario() {
    if (tipoFuncionario == TipoFuncionario.gestor) {
      return isGestor = true;
    } else {
      return isGestor = false;
    }
  }

}
/**
 * // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:pim/src/model/pessoa_model.dart';

enum TipoFuncionario {
  gestor,
  padrao,
}

class FuncionarioModel extends PessoaModel {
  final String email;
  final String senha;
  final String cargo;
  final double salario;
  final double horasTrabalhadas;
  final double comissao;
  final double pis;
  final String cnh;
  final String rg;
  final String tituloEleitor;
  final String certcodFaoNascimento;
  final String copiaEndereco;
  bool isGestor = false;
  final TipoFuncionario tipoFuncionario;

  FuncionarioModel({
    nome,
    cpf,
    required this.email,
    required this.senha,
    required this.cargo,
    required this.salario,
    required this.horasTrabalhadas,
    required this.comissao,
    required this.pis,
    required this.cnh,
    required this.rg,
    required this.tituloEleitor,
    required this.certcodFaoNascimento,
    required this.copiaEndereco,
    required this.isGestor,
    required this.tipoFuncionario,
  }) : super(nome: nome, cpf: cpf);

  bool imprimirTipoFuncionario() {
    if (tipoFuncionario == TipoFuncionario.gestor) {
      return isGestor = true;
    } else {
      return isGestor = false;
    }
  }

  FuncionarioModel copyWith({
    String? email,
    String? senha,
    String? cargo,
    double? salario,
    double? horasTrabalhadas,
    double? comissao,
    double? pis,
    String? cnh,
    String? rg,
    String? tituloEleitor,
    String? certcodFaoNascimento,
    String? copiaEndereco,
    bool? isGestor,
    TipoFuncionario? tipoFuncionario,
  }) {
    return FuncionarioModel(
      email: email ?? this.email,
      senha: senha ?? this.senha,
      cargo: cargo ?? this.cargo,
      salario: salario ?? this.salario,
      horasTrabalhadas: horasTrabalhadas ?? this.horasTrabalhadas,
      comissao: comissao ?? this.comissao,
      pis: pis ?? this.pis,
      cnh: cnh ?? this.cnh,
      rg: rg ?? this.rg,
      tituloEleitor: tituloEleitor ?? this.tituloEleitor,
      certcodFaoNascimento: certcodFaoNascimento ?? this.certcodFaoNascimento,
      copiaEndereco: copiaEndereco ?? this.copiaEndereco,
      isGestor: isGestor ?? this.isGestor,
      tipoFuncionario: tipoFuncionario ?? this.tipoFuncionario,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'senha': senha,
      'cargo': cargo,
      'salario': salario,
      'horasTrabalhadas': horasTrabalhadas,
      'comissao': comissao,
      'pis': pis,
      'cnh': cnh,
      'rg': rg,
      'tituloEleitor': tituloEleitor,
      'certcodFaoNascimento': certcodFaoNascimento,
      'copiaEndereco': copiaEndereco,
      'isGestor': isGestor,
      'tipoFuncionario': tipoFuncionario.toString(),
    };
  }

  factory FuncionarioModel.fromMap(Map<String, dynamic> map) {
    return FuncionarioModel(
      email: map['email'] as String,
      senha: map['senha'] as String,
      cargo: map['cargo'] as String,
      salario: map['salario'] as double,
      horasTrabalhadas: map['horasTrabalhadas'] as double,
      comissao: map['comissao'] as double,
      pis: map['pis'] as double,
      cnh: map['cnh'] as String,
      rg: map['rg'] as String,
      tituloEleitor: map['tituloEleitor'] as String,
      certcodFaoNascimento: map['certcodFaoNascimento'] as String,
      copiaEndereco: map['copiaEndereco'] as String,
      isGestor: map['isGestor'] as bool,
      tipoFuncionario: map['tipoFuncionario'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory FuncionarioModel.fromJson(String source) =>
      FuncionarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @overrcodFe
  String toString() {
    return 'FuncionarioModel(email: $email, senha: $senha, cargo: $cargo, salario: $salario, horasTrabalhadas: $horasTrabalhadas, comissao: $comissao, pis: $pis, cnh: $cnh, rg: $rg, tituloEleitor: $tituloEleitor, certcodFaoNascimento: $certcodFaoNascimento, copiaEndereco: $copiaEndereco, isGestor: $isGestor, tipoFuncionario: $tipoFuncionario)';
  }

  @overrcodFe
  bool operator ==(covariant FuncionarioModel other) {
    if (codFentical(this, other)) return true;

    return other.email == email &&
        other.senha == senha &&
        other.cargo == cargo &&
        other.salario == salario &&
        other.horasTrabalhadas == horasTrabalhadas &&
        other.comissao == comissao &&
        other.pis == pis &&
        other.cnh == cnh &&
        other.rg == rg &&
        other.tituloEleitor == tituloEleitor &&
        other.certcodFaoNascimento == certcodFaoNascimento &&
        other.copiaEndereco == copiaEndereco &&
        other.isGestor == isGestor &&
        other.tipoFuncionario == tipoFuncionario;
  }

  @overrcodFe
  int get hashCode {
    return email.hashCode ^
        senha.hashCode ^
        cargo.hashCode ^
        salario.hashCode ^
        horasTrabalhadas.hashCode ^
        comissao.hashCode ^
        pis.hashCode ^
        cnh.hashCode ^
        rg.hashCode ^
        tituloEleitor.hashCode ^
        certcodFaoNascimento.hashCode ^
        copiaEndereco.hashCode ^
        isGestor.hashCode ^
        tipoFuncionario.hashCode;
  }
}

 */