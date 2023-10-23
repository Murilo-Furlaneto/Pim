import 'package:flutter/material.dart';
import 'package:pim/src/model/adicional_model.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/model/holerite_model.dart';

class HoleriteMonthComponent extends StatelessWidget {
  final int mes;
  final FuncionarioModel funcionario;
  final AdicionalModel adicional;

  const HoleriteMonthComponent({
    Key? key,
    required this.mes,
    required this.funcionario,
    required this.adicional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final holerite = HoleriteModel(
      dataReferencia: DateTime(DateTime.now().year, mes),
      taxaInss: 0.0, // Defina os valores corretos
      irrf: 0.0, // Defina os valores corretos
      faltas: 0.0, // Defina os valores corretos
      fgts: 0.0, // Defina os valores corretos
      vt: 0.0, // Defina os valores corretos
      horasExtra: adicional
          .horasExtra, // Use o valor de horasExtra do adicional do funcionário
      decimoTerceiro: (mes == 12)
          ? adicional.decimoTerceiro
          : 0.0, // Use o valor de decimoTerceiro do adicional do funcionário apenas em dezembro
    );

    // Calcule os descontos com base em 20% do salário
    final descontos = funcionario.salario * 0.20;

    // calcula o salario liquido
    final salarioLiquido = funcionario.salario - descontos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mês: $mes'),
        Text('Salário Bruto: ${funcionario.salario}'),
        Text('Descontos: $descontos'),
        Text('Férias: ${funcionario.temFeriasNoMes(mes) ? 'Sim' : 'Não'}'),
        Text('Salário Líquido: $salarioLiquido'),
      ],
    );
  }
}
