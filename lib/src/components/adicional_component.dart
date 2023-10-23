import 'package:flutter/material.dart';
import 'package:pim/src/model/adicional_model.dart';
import 'package:pim/src/model/funcionario_model.dart';

class AdicionalComponent extends StatelessWidget {
  final AdicionalModel adicional;

  const AdicionalComponent({Key? key, required this.adicional, required FuncionarioModel funcionario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Mês: 12 (Dezembro)'),
        Text('Adicional: ${adicional.calcularAdicionalDezembro()}'),
      ],
    );
  }
}
