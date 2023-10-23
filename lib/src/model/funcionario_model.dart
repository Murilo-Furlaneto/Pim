import 'package:pim/src/model/pessoa_model.dart';

class FuncionarioModel extends PessoaModel {
  final int codF;
  String email;
  String cpf;
  String senha;
  String cargo;
  double salario;
  int horasTrabalhadas;
  double comissao;
  String pis;
  String cnh;
  String rg;
  String certidaoNascimento;
  String copiaEndereco;
  bool isGestor;

  FuncionarioModel({
    required this.codF,
    required this.email,
    required this.cpf,
    required this.senha,
    required this.cargo,
    required this.salario,
    required this.horasTrabalhadas,
    required this.comissao,
    required this.pis,
    required this.cnh,
    required this.rg,
    required this.certidaoNascimento,
    required this.copiaEndereco,
    required this.isGestor,
    required nome,
  }) : super(nome: nome, cpf: cpf);

  @override
  Map<String, dynamic> toMap() {
    return {
      'codF': codF,
      'email': email,
      'cpf': cpf,
      'senha': senha,
      'cargo': cargo,
      'salario': salario,
      'horasTrabalhadas': horasTrabalhadas,
      'comissao': comissao,
      'pis': pis,
      'cnh': cnh,
      'rg': rg,
      'certidaoNascimento': certidaoNascimento,
      'copiaEndereco': copiaEndereco,
      'isGestor': isGestor,
      'nome': nome,
    };
  }

  factory FuncionarioModel.fromMap(Map<String, dynamic> map) {
    return FuncionarioModel(
      codF: map['codF'] as int,
      email: map['email'] as String,
      cpf: map['cpf'] as String,
      senha: map['senha'] as String,
      cargo: map['cargo'] as String,
      salario: map['salario'] as double,
      horasTrabalhadas: map['horasTrabalhadas'] as int,
      comissao: map['comissao'] as double,
      pis: map['pis'] as String,
      cnh: map['cnh'] as String,
      rg: map['rg'] as String,
      certidaoNascimento: map['certidaoNascimento'] as String,
      copiaEndereco: map['copiaEndereco'] as String,
      isGestor: map['isGestor'] as bool,
      nome: map['nome'] as String,
    );
  }

  // Implemente a função toJson() se necessário
  // Implemente a função fromJson() se necessário

  @override
  String toString() {
    return 'FuncionarioModel{codF: $codF, email: $email, cpf: $cpf, senha: $senha, cargo: $cargo, salario: $salario, horasTrabalhadas: $horasTrabalhadas, comissao: $comissao, pis: $pis, cnh: $cnh, rg: $rg, certidaoNascimento: $certidaoNascimento, copiaEndereco: $copiaEndereco, isGestor: $isGestor, nome: $nome}';
  }

  bool temFeriasNoMes(int mes) {
    // Implemente a lógica para verificar se o funcionário tem férias no mês especificado
    // Retorne true se tiver férias, caso contrário, retorne false
    if (mes == 4) {
      return true;
    } else {
      return false;
    }
  }
}
