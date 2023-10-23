// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class PessoaModel {
  String nome;
  final String cpf;

  PessoaModel({
    required this.nome,
    required this.cpf,
  });

  @override
  String toString() => 'PessoaModel(nome: $nome, cpf: $cpf)';
}
