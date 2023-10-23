import 'package:flutter/material.dart';
import 'package:pim/src/config/repositories/user_repository.dart';
import 'package:pim/src/model/funcionario_model.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _repository = UserRepository();

  List<FuncionarioModel> get usuarios => _repository.userList;

  Future<void> adicionarUsuario(FuncionarioModel user) async {
    usuarios.add(user);
    notifyListeners();
  }

  void excluirUsuario(FuncionarioModel funcionario) {
    usuarios.removeWhere((user) => user.codF == funcionario.codF);
    notifyListeners();
  }
}
