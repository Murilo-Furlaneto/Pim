import 'package:flutter/material.dart';
import 'package:pim/src/components/home_components.dart';
import 'package:pim/src/page/cadastrorio_page.dart';
import 'package:pim/src/page/configuracao_page.dart';
import 'package:pim/src/page/folha_pagamento_page.dart';
import 'package:pim/src/page/funcionario_list_page.dart';
import 'package:pim/src/page/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<String> _listaOpcoes = [
    "Cadastrar funcionário",
    "Lista de funcionários",
    "Configurações",
    "Folha de pagamento",
  ];

  final List<IconData> _listaIcones = [
    Icons.person_add,
    Icons.groups,
    Icons.settings,
    Icons.payments,
  ];

  void navigatorPage(BuildContext context, int index) {
    final List<Widget> navegacao = [
      const CadastroFuncionarioPage(),
      FuncionarioListPage(),
      const ConfiguracaoPage(),
      const FolhaPagamentoPage(),
    ];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navegacao[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tamanhoDaTela = MediaQuery.of(context).size;

    /*24 é a barra de notificação no android*/
    final double alturaDeCadaItem =
        (tamanhoDaTela.height - kToolbarHeight - 24) / 5;
    final double larguraDeCadaItem = tamanhoDaTela.width / 3;
    final double razaoDeAspecto = larguraDeCadaItem / alturaDeCadaItem;

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
            child: GridView.count(
              //cria um grid com 2 colunas
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: razaoDeAspecto,
              children: List.generate(
                _listaOpcoes.length,
                (index) {
                  return HomeComponents(
                      function: () {
                        navigatorPage(context, index);
                      },
                      icon: _listaIcones[index],
                      description: _listaOpcoes[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
