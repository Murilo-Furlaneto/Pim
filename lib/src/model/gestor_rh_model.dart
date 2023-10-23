import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/config/repositories/user_repository.dart';

class GestorRhModel extends FuncionarioModel {
  GestorRhModel({required super.codF, required super.nome, required super.cpf, required super.email, required super.senha, required super.cargo, required super.salario, required super.horasTrabalhadas, required super.comissao, required super.pis, required super.cnh, required super.rg, required super.certidaoNascimento, required super.copiaEndereco, required super.isGestor});

  
  void cadastrarFuncionario(FuncionarioModel funcionarioModel) {
    var repository = UserRepository();
    repository.adicionarUsuario(funcionarioModel);
  }
}
