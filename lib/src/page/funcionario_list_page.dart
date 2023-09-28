import 'package:flutter/material.dart';
import 'package:pim/src/repositories/user_repository.dart';

class FuncionarioListPage extends StatelessWidget {
  FuncionarioListPage({super.key});

  final UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de funcionários'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: repository.userList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(repository.userList[index].nome),
          );
        },
      ),
    );
  }
}
