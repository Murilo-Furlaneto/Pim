import 'package:flutter/material.dart';
import 'package:pim/src/components/home_components.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/controller/provider/user_provider.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/home/cadastro_home.dart';
import 'package:pim/src/page/home/configuracao_page.dart';
import 'package:pim/src/page/home/folha_pagamento_page.dart';
import 'package:pim/src/page/home/funcionario_list_page.dart';
import 'package:pim/src/page/home/gerador_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email, required this.senha});

  final String email;
  final String senha;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FuncionarioModel? funcionario;
  final UserRepository repository = UserRepository();
  bool isGestor = false;

  @override
  void initState() {
    super.initState();
    buscarUsuario(widget.email, widget.senha);
    verificarGestor();
  }

  void verificarGestor() {
    isGestor = repository.verificarGestor(widget.email, widget.senha);
  }

  FuncionarioModel buscarUsuario(String email, String senha) {
    return funcionario = repository.userList.firstWhere(
      (user) => user.email == email && user.senha == senha,
    );
  }

  final List<String> _listaOpcoesGestor = [
    "Cadastrar funcionário",
    "Lista de funcionários",
    "Configurações",
    "Holerite",
    "Gerar folha de pagamento",
  ];

  final List<String> _listaOpcoesFuncionario = [
    "Lista de funcionários",
    "Configurações",
    "Holerite",
  ];

  final List<IconData> _listaIconesGestor = [
    Icons.person_add,
    Icons.groups,
    Icons.settings,
    Icons.payments,
    Icons.currency_exchange
  ];

  final List<IconData> _listaIconesFuncionario = [
    Icons.groups,
    Icons.settings,
    Icons.payments,
  ];

  void navigatorPage(BuildContext context, int index) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    if (isGestor) {
      List<Widget> navegacao = [
        const CadastroFuncionarioPage(),
        const FuncionarioListPage(),
        ConfiguracaoPage(
          funcionarioModel: funcionario!,
        ),
        FolhaPagamentoPage(
          funcionario: funcionario!,
        ),
        const GeradorPage(),
      ];

      if (index < navegacao.length) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navegacao[index]),
        );
      }
    } else {
      List<Widget> navegacao = [
        const FuncionarioListPage(),
        ConfiguracaoPage(
          funcionarioModel: funcionario!,
        ),
        FolhaPagamentoPage(
          funcionario: funcionario!,
        ),
      ];

      if (index < navegacao.length) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navegacao[index]),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var tamanhoDaTela = MediaQuery.of(context).size;

    final double alturaDeCadaItem =
        (tamanhoDaTela.height - kToolbarHeight - 24) / 5;
    final double larguraDeCadaItem = tamanhoDaTela.width / 3;
    final double razaoDeAspecto = larguraDeCadaItem / alturaDeCadaItem;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: razaoDeAspecto,
            children: List.generate(
              isGestor
                  ? _listaOpcoesGestor.length
                  : _listaOpcoesFuncionario.length,
              (index) {
                if (index == 4 && !isGestor) {
                  // Não mostrar "Gerar folha de pagamento" se não for gestor
                  return const SizedBox.shrink();
                }
                return HomeComponents(
                  function: () {
                    navigatorPage(context, index);
                  },
                  icon: isGestor
                      ? _listaIconesGestor[index]
                      : _listaIconesFuncionario[index],
                  description: isGestor
                      ? _listaOpcoesGestor[index]
                      : _listaOpcoesFuncionario[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
