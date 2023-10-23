import 'package:flutter/material.dart';
import 'package:pim/src/components/adicional_component.dart';
import 'package:pim/src/components/holerite_month_component.dart';
import 'package:pim/src/model/adicional_model.dart';
import 'package:pim/src/model/funcionario_model.dart';

class HoleriteComponent extends StatelessWidget {
  final FuncionarioModel funcionario;
  final AdicionalModel adicional;

  const HoleriteComponent({
    Key? key,
    required this.funcionario,
    required this.adicional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Holerite de ${funcionario.nome}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (int mes = 1; mes <= 12; mes++) ...[
            if (mes == 12)
              AdicionalComponent(
                funcionario: funcionario,
                adicional: adicional,
              ),
            HoleriteMonthComponent(
              mes: mes,
              funcionario: funcionario,
              adicional: (mes == 12)
                  ? adicional
                  : adicional, // Passe o adicional somente no mês 12
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}
