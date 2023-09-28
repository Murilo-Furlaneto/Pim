import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/home_page.dart';

class UserRepository {
  List<FuncionarioModel> userList = [
    // Data = ano, mes, dia

    FuncionarioModel(
        codF: 1,
        nome: 'Murilo Furlaneto',
        cpf: '183765282040',
        email: 'murilo.furlaneto@gmail.com',
        senha: 'murilo1234',
        cargo: 'Programador',
        salario: 5000.00,
        horasTrabalhadas: 40,
        comissao: 0.05,
        pis: 1234567,
        cnh: 'A/B',
        rg: '1234567',
        certcodFaoNascimento: DateTime(2000, 07, 13),
        copiaEndereco: 'Rua X, Vila Prudente - Sao Paulo',
        isGestor: false,
        tipoFuncionario: TipoFuncionario.padrao),

    FuncionarioModel(
        codF: 2,
        nome: 'Maria Santos',
        cpf: '07959392856734',
        email: 'mariaSantos@gmail.com',
        senha: 'mari652',
        cargo: 'Analista de Sistemas',
        salario: 7500.00,
        horasTrabalhadas: 40,
        comissao: 0.10,
        pis: 2345678,
        cnh: 'A',
        rg: '35269034',
        certcodFaoNascimento: DateTime(1978, 05, 15),
        copiaEndereco: 'Rua Parana,1508, Murumbi - Sao Paulo',
        isGestor: false,
        tipoFuncionario: TipoFuncionario.padrao),

    FuncionarioModel(
        codF: 3,
        nome: 'Carlos Ferreira',
        cpf: '132456788908',
        email: 'carlos@gmail.com',
        senha: 'CarLin22033',
        cargo: 'Designer gráfico',
        salario: 4000.00,
        horasTrabalhadas: 30,
        comissao: 0.01,
        pis: 3456789,
        cnh: 'B',
        rg: '765432109',
        certcodFaoNascimento: DateTime(1990, 12, 07),
        copiaEndereco: 'Rua Tancredo Neves,750, Interlagos - São Paulo',
        isGestor: false,
        tipoFuncionario: TipoFuncionario.padrao),

    FuncionarioModel(
      codF: 4,
      nome: 'Ana Oliveira',
      cpf: '3828485959505',
      email: 'anaOliveira@gmail.com',
      senha: 'Ana7764',
      cargo: 'Assistente de Marketing',
      salario: 3000.00,
      horasTrabalhadas: 30,
      comissao: 0.01,
      pis: 4567890,
      cnh: 'B',
      rg: '765432109',
      certcodFaoNascimento: DateTime(1980, 11, 23),
      copiaEndereco: 'Rua Princesa Isabel,1400, Dahma - Sao Paulo',
      isGestor: false,
      tipoFuncionario: TipoFuncionario.padrao,
    ),
    FuncionarioModel(
      codF: 5,
      nome: 'Pedro Alves',
      cpf: '224535667777',
      email: 'pedroalves45@gmail.com',
      senha: 'Pê42209',
      cargo: 'Gerente de Projetos',
      salario: 10000.00,
      horasTrabalhadas: 40,
      comissao: 0.15,
      pis: 5678901,
      cnh: 'CNH567',
      rg: '654321098',
      certcodFaoNascimento: DateTime(2001, 03, 2),
      copiaEndereco: 'Avenida IX, Liberdade  - Sao Paulo',
      isGestor: false,
      tipoFuncionario: TipoFuncionario.padrao,
    ),

    FuncionarioModel(codF: 6, nome: 'João da Silva', cpf: '18753683106', email: 'joaoSilvaRH@gmail.com', senha: 'Tekcz12', cargo: 'Gestor de Recursos Humanos (RH)', salario: 10000.00, horasTrabalhadas: 37, comissao: 0, pis: 1368455, cnh: 'A', rg: '34408584268', certcodFaoNascimento: DateTime(1980,07,21), copiaEndereco: 'Avenida Paulista, 1050- Sao Paulo', isGestor: true, tipoFuncionario: TipoFuncionario.gestor),
  ]; // Lista de usuários



  bool existeUsuario() {
    return userList.isNotEmpty;
  }

  void adicionarUsuario(FuncionarioModel user) {
    userList.add(user);
  }

  void vericaUsuarioLista(
      String nome, String email, String senha, BuildContext context) {
    bool foundName = userList.contains(nome);
    bool foundEmail = userList.contains(email);
    bool foundSenha = userList.contains(senha);
    if (foundName && foundEmail && foundSenha) {
      return;
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Cadastre-se'),
              ));
    }
  }
}


/**
 * 
  List<FuncionarioModel> userList = [
    FuncionarioModel(
        nome: "Murilo Furlaneto",
        email: "murilo.furlaneto@gmail.com",
        senha: "murilo1234"),
    FuncionarioModel(
        nome: "Maria Santos", email: ": maria@gmail.com", senha: "senha123"),
    FuncionarioModel(
        nome: "Carlos Ferreira",
        email: "carlos@gmail.com",
        senha: "minhasenha34"),
    FuncionarioModel(
        nome: "Ana Oliveira", email: "ana@gmail.com", senha: "98765"),
    FuncionarioModel(
        nome: "Pedro Alves", email: "pedro@gmai.com", senha: "123abc"),
  
  ]; // Lista de usuários
 */