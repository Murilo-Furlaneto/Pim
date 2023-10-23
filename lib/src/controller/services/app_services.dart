import 'package:pim/src/model/funcionario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  chaveEmail,
  chaveSenha,
  chaveID,
  chaveDarkMode,
}

class AppServices {
  void setDarkMode(bool darkMode) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(STORAGE_CHAVES.chaveDarkMode.toString(), darkMode);
  }

  Future<bool> getTheme() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(STORAGE_CHAVES.chaveDarkMode.toString()) ??
        false;
  }

  void setDadosEmail(String email) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(STORAGE_CHAVES.chaveEmail.toString(), email);
  }

  void setDadosSenha(String senha) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(STORAGE_CHAVES.chaveSenha.toString(), senha);
  }

  void setId(String id) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(STORAGE_CHAVES.chaveID.toString(), id);
  }

  
  verificaUsurario(FuncionarioModel user) async {
    var preferences = await SharedPreferences.getInstance();

    user.email ==
        preferences.getString(
          STORAGE_CHAVES.chaveEmail.toString(),
        );

    user.senha ==
        preferences.getString(
          STORAGE_CHAVES.chaveSenha.toString(),
        );
  }
}
