import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pim/src/config/app_config.dart';
import 'package:pim/src/controller/provider/user_provider.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:provider/provider.dart';

class CadastroFuncionarioPage extends StatefulWidget {
  const CadastroFuncionarioPage({Key? key}) : super(key: key);

  @override
  State<CadastroFuncionarioPage> createState() =>
      _CadastroFuncionarioPageState();
}

class _CadastroFuncionarioPageState extends State<CadastroFuncionarioPage> {
  final _form = GlobalKey<FormState>();
  bool _isGestor = false;
  final TextEditingController _codFController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _salarioController = TextEditingController();
  final TextEditingController _horasTrabalhadasController =
      TextEditingController();
  final TextEditingController _comissaoController = TextEditingController();
  final TextEditingController _pisController = TextEditingController();
  final TextEditingController _cnhController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController(text: "");
  final TextEditingController _copiaEnderecoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar funcionário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  controller: _codFController,
                  decoration: InputDecoration(
                    labelText: 'Código',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um código';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o CPF';
                    }
                    if (value.length != 11) {
                      return 'CPF deve conter 11 dígitos';
                    }
                    return null;
                  },
                  maxLength: 11,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email inválido';
                    }
                    if (!value.contains('@')) {
                      return 'O caractere @ é necessário';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _cargoController,
                  decoration: InputDecoration(
                    labelText: 'Cargo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um cargo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _salarioController,
                  decoration: InputDecoration(
                    labelText: 'Salário',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um salário';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _horasTrabalhadasController,
                  decoration: InputDecoration(
                    labelText: 'Horas Trabalhadas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira as horas trabalhadas';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _comissaoController,
                  decoration: InputDecoration(
                    labelText: 'Comissão',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a comissão';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _pisController,
                  decoration: InputDecoration(
                    labelText: 'PIS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número do PIS';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _cnhController,
                  decoration: InputDecoration(
                    labelText: 'CNH',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número da CNH';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _rgController,
                  decoration: InputDecoration(
                    labelText: 'RG',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número do RG';
                    }
                    if (value.trim().length != 9) {
                      return 'O RG deve conter 9 dígitos';
                    }
                    return null;
                  },
                  maxLength: 9,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _dataNascimentoController,
                  onTap: () async {
                    var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 15),
                      firstDate: DateTime(1900, 12, 30),
                      lastDate: DateTime(2030, 5, 12),
                    );

                    if (data != null) {
                      _dataNascimentoController.text =
                          AppConfig.formatarData(data);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _copiaEnderecoController,
                  decoration: InputDecoration(
                    labelText: 'Cópia do Endereço',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a cópia do endereço';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'É Gestor?',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                      value: _isGestor,
                      onChanged: (value) {
                        setState(() {
                          _isGestor = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _salvarFormulario,
                    child: const Text(
                      "Salvar",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _salvarFormulario() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();

      final user = FuncionarioModel(
        codF: int.tryParse(_codFController.text) ?? Random().nextInt(1000),
        nome: _nomeController.text,
        email: _emailController.text,
        cpf: _cpfController.text,
        senha: _senhaController.text,
        cargo: _cargoController.text,
        salario: double.tryParse(_salarioController.text) ?? 1320.00,
        horasTrabalhadas: int.tryParse(_horasTrabalhadasController.text) ?? 44,
        comissao: double.tryParse(_comissaoController.text) ?? 0.0,
        pis: (_pisController.text),
        cnh: _cnhController.text,
        rg: _rgController.text,
        certidaoNascimento: _dataNascimentoController.text,
        copiaEndereco: _copiaEnderecoController.text,
        isGestor: _isGestor,
      );

      final userProvider = Provider.of<UserProvider>(context, listen: false);

      try {
        userProvider.adicionarUsuario(user);
        print('Deu certo');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Funcionário Cadastrado'),
              content: const Text(
                'O funcionário foi cadastrado com sucesso.',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o dialog
                    Navigator.of(context).pop(); // Fecha a tela de cadastro
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (error) {
        print(error);
      }
    }
  }
}
