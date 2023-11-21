import 'package:flutter/material.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/auth/login_page.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({
    super.key,
    required this.funcionarioModel
  });

 final  FuncionarioModel funcionarioModel;

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  bool darkMode = false;
  final UserRepository repository = UserRepository();
   
  @override
  Widget build(BuildContext context) {
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
                  title: Text(widget.funcionarioModel.nome),
                  subtitle: Text(widget.funcionarioModel.email),
                ),
              ),
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
