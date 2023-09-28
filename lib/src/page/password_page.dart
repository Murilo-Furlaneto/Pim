import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de Senha'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: const Text(
            "Sua solicitação de senha já foi enviada ao RH. Em breve enviarão uma nova senha",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
