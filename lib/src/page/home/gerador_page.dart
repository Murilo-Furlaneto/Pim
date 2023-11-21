import 'package:flutter/material.dart';
import 'package:pim/src/components/expanded_holerite_component.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/model/adicional_model.dart';
import 'package:pim/src/model/funcionario_model.dart';

class GeradorPage extends StatefulWidget {
  const GeradorPage({super.key});

  @override
  State<GeradorPage> createState() => _GeradorPageState();
}

class _GeradorPageState extends State<GeradorPage> {
  int? selectedFuncionarioId;
  final UserRepository _userRepository = UserRepository();
  bool showHolerite = false; // Novo estado para controlar a visibilidade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerar Folha de Pagamento'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: selectedFuncionarioId,
                items: _userRepository.userList
                    .map<DropdownMenuItem<int>>((FuncionarioModel user) {
                  return DropdownMenuItem<int>(
                    value: user.codF,
                    child: Text(user.nome),
                  );
                }).toList(),
                onChanged: (int? userId) {
                  setState(() {
                    selectedFuncionarioId = userId;
                    showHolerite = false;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedFuncionarioId != null) {
                    _gerarFolha(selectedFuncionarioId!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecione um funcionário')),
                    );
                  }
                },
                child: const Text('Gerar Folha'),
              ),
              const SizedBox(height: 15),
              if (showHolerite)
                ExpandableHoleriteComponent(
                  funcionario: _userRepository.userList
                      .firstWhere((user) => user.codF == selectedFuncionarioId),
                  adicional: AdicionalModel(
                      horasExtra: 0,
                      decimoTerceiro: 0), // Adicione os valores apropriados
                  mes: DateTime.now().month,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _gerarFolha(int userId) {
    setState(() {
      showHolerite = true;
    });
  }
}
