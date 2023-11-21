import 'package:flutter/material.dart';
import 'package:pim/src/page/home/home_page.dart';
import 'package:pim/src/page/auth/password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffE0E2DB),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          width: 520,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            onSaved: (_) {
                            _email.text;
                            },
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            validator: (value) {
                              if (value == null && value!.trim().isEmpty) {
                                return "Preencher o campo email";
                              }
                              if (value.trim().length < 4) {
                                return "O email deve conter  mais de 4 letras";
                              }
                              if (!value.contains('@')) {
                                return "O campo email deve conter o caractere @ ";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onSaved: (_) {
                              _password.text;
                            },
                            obscureText: isObscure,
                            controller: _password,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    icon: Icon(isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Senha",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            validator: (value) {
                              if (value == null && value!.trim().isEmpty) {
                                return "Preencher o campo senha";
                              }
                              if (value.trim().length < 4) {
                                return "A senha deve conter  mais de 4 letras";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  var isValid =
                                      _formKey.currentState!.validate();

                                  try {
                                    if (isValid) {
                                 

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   HomePage(email: _email.text, senha: _password.text,)));
                                    }
                                  } catch (e) {
                                    debugPrint("Error: $e");
                                  }
                                },
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                          const SizedBox(height: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PasswordPage()));
                            },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Esqueceu a senha?",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
