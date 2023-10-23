import 'package:flutter/material.dart';
import 'package:pim/src/components/holerite_month_component.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/model/adicional_model.dart';

class ExpandableHoleriteComponent extends StatefulWidget {
  final FuncionarioModel funcionario;
  final AdicionalModel adicional;
  final int mes;

  const ExpandableHoleriteComponent({
    Key? key,
    required this.funcionario,
    required this.adicional,
    required this.mes,
  }) : super(key: key);

  @override
  _ExpandableHoleriteComponentState createState() =>
      _ExpandableHoleriteComponentState();
}

class _ExpandableHoleriteComponentState
    extends State<ExpandableHoleriteComponent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Holerite do Mês: ${widget.mes}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: [
        if (isExpanded)
          HoleriteMonthComponent(
            mes: widget.mes, // Passe o mês atual para HoleriteMonthComponent
            funcionario: widget.funcionario,
            adicional: widget.adicional,
          ),
      ],
    );
  }
}
