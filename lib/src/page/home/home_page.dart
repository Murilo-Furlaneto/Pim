import 'package:flutter/material.dart';
import 'package:pim/src/components/home_components.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/controller/provider/user_provider.dart';
import 'package:pim/src/controller/services/app_services.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/home/cadastro_home.dart';
import 'package:pim/src/page/home/configuracao_page.dart';
import 'package:pim/src/page/home/folha_pagamento_page.dart';
import 'package:pim/src/page/home/funcionario_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FuncionarioModel? funcionario;
  final AppServices _appServices = AppServices();
  final UserRepository repository = UserRepository();
  bool isGestor = false;
  int selectedIndex = 0;

  FuncionarioModel buscarUsuario(int i) {
    funcionario = repository.userList[i];
    _appServices.verificaUsurario(funcionario!);
    return funcionario!;
  }

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

  @override
  void initState() {
    super.initState();
    buscarUsuario(selectedIndex);
    verificaGestor(funcionario!);
  }

  void navigatorPage(BuildContext context, int index) {
    List<Widget> navegacao;

    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    navegacao = [
      const CadastroFuncionarioPage(),
      FuncionarioListPage(),
      const ConfiguracaoPage(),
      FolhaPagamentoPage(
        funcionario: funcionario!,
      ),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navegacao[index]),
    );
  }

  bool verificaGestor(FuncionarioModel funcionario) {
    if (funcionario.isGestor == true) {
      print(funcionario.isGestor);
      return isGestor = true;
    } else {
      return isGestor = false;
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
      child: SafeArea(
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
                _listaOpcoes.length,
                (index) {
                  return HomeComponents(
                    function: () {
                      navigatorPage(context, index);
                    },
                    icon: _listaIcones[index],
                    description: _listaOpcoes[index],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
