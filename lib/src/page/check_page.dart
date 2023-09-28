import 'package:flutter/material.dart';
import 'package:pim/src/page/home_page.dart';
import 'package:pim/src/page/login_page.dart';
import 'package:pim/src/repositories/user_repository.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final repository = UserRepository();

  @override
  void initState() {
    super.initState();
    verificarUsuarioExistente();
  }

  void verificarUsuarioExistente() async {
    final existeUsuario = repository.existeUsuario();

    if (existeUsuario) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else {
      // Adiar a navegação para a próxima frame
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
