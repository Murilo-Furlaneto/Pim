import 'package:flutter/material.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/controller/provider/theme_provider.dart';
import 'package:pim/src/controller/services/app_services.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/auth/login_page.dart';
import 'package:provider/provider.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({
    super.key,
  });

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  bool darkMode = false;
  final AppServices _appServices = AppServices();
  final UserRepository repository = UserRepository();
  late FuncionarioModel funcionarioModel;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    inicializarPreferences();
  }

  inicializarPreferences() async {
    darkMode = await _appServices.getTheme();
    setState(() {});
  }

  FuncionarioModel buscarUsuario(int i) {
    funcionarioModel = repository.userList[i];
    _appServices.verificaUsurario(funcionarioModel);
    return funcionarioModel;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 80,
                width: 270,
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(buscarUsuario(selectedIndex).nome),
                  subtitle: Text(buscarUsuario(selectedIndex).email),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Modo Escuro',
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (bool value) {
                    themeProvider
                        .toggleTheme(); // Altera o tema usando o ThemeProvider
                    _appServices.setDarkMode(
                        value); // Salva o estado nas preferências compartilhadas
                  },
                )
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
