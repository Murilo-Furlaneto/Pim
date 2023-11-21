import 'package:pim/src/model/funcionario_model.dart';

class FolhaPagamentoModel {
  final FuncionarioModel funcionario;

  FolhaPagamentoModel(this.funcionario);

  // Adicione métodos para calcular os diferentes componentes da folha de pagamento
  double calcularSalarioLiquido() {
    double salario = funcionario.salario ?? 0.0;
    // Adicione aqui a lógica para calcular descontos, adicionais, etc.
    // Exemplo:
    // double descontos = DescontosModel().calcularDescontos(...);
    // salario -= descontos;
    return salario;
  }

  // Adicione outros métodos conforme necessário
}
