import 'package:flutter/material.dart';
import 'package:pim/src/components/expanded_holerite_component.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/model/adicional_model.dart';

class FolhaPagamentoPage extends StatelessWidget {
  final FuncionarioModel funcionario;
  final AdicionalModel? adicional;

  const FolhaPagamentoPage({
    super.key,
    required this.funcionario,
    this.adicional,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Folha de pagamento'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (int mes = 1; mes <= 12; mes++)
            ExpandableHoleriteComponent(
              mes: mes,
              funcionario: funcionario,
              adicional: adicional ??
                  AdicionalModel(horasExtra: 0.0, decimoTerceiro: 0.0),
            ),
        ],
      ),
    );
  }
}
