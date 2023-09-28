// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class PessoaModel {
  final String nome;
  final String cpf;

  PessoaModel({
    required this.nome,
    required this.cpf,
  });

  @override
  String toString() => 'PessoaModel(nome: $nome, cpf: $cpf)';
}
