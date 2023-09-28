import 'package:flutter/material.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  UserRepository repository = UserRepository();
  List<FuncionarioModel> usuarios = [];

  List<FuncionarioModel> userList() {
    return usuarios = repository.userList;
  }

  void adicionarUsuario(FuncionarioModel user) {
    repository.adicionarUsuario(user);
    notifyListeners();
  }
}
