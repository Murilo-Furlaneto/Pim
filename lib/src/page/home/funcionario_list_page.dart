import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/user_provider.dart';

class FuncionarioListPage extends StatefulWidget {
  const FuncionarioListPage({super.key});

  @override
  State<FuncionarioListPage> createState() => _FuncionarioListPageState();
}

class _FuncionarioListPageState extends State<FuncionarioListPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de funcionários'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userProvider.usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          int count = userProvider.usuarios[index].codF;
          return ListTile(
            leading: Text(count.toString()),
            title: Text(userProvider.usuarios[index].nome),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (index >= 0 && index < userProvider.usuarios.length) {
                        userProvider
                            .excluirUsuario(userProvider.usuarios[index]);
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
