import 'package:flutter/material.dart';
import 'package:pim/src/controller/services/app_services.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/home_page.dart';
import 'package:pim/src/page/password_page.dart';
import 'package:pim/src/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  final services = AppServices();

  final respository = UserRepository();

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
                              services.setDadosEmail(_email.text);
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
                              services.setDadosSenha(_password.text);
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
                                      setState(() {
                                        services.setDadosEmail(_email.text);
                                        services.setDadosSenha(_password.text);
                                      });

                                      respository.vericaUsuarioLista(_name.text,
                                          _email.text, _password.text, context);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  } catch (e) {
                                    print("Error: $e");
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

/** codigo original
 * import 'package:flutter/material.dart';
import 'package:pim/src/controller/services/app_services.dart';
import 'package:pim/src/model/funcionario_model.dart';
import 'package:pim/src/page/home_page.dart';
import 'package:pim/src/page/password_page.dart';
import 'package:pim/src/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  final services = AppServices();

  final respository = UserRepository();

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
                          TextFormField(
                            onSaved: (_) {
                              services.setDadosNome(_name.text);
                            },
                            controller: _name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "Nome",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17))),
                            validator: (value) {
                              if (value == null && value!.trim().isEmpty) {
                                return "Preencher o campo nome";
                              }
                              if (value.trim().length < 4) {
                                return "O nome deve conter  mais de 4 letras";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onSaved: (_) {
                              services.setDadosEmail(_email.text);
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
                              services.setDadosSenha(_password.text);
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
                                      setState(() {
                                        respository.adicionarUsuario(FuncionarioModel(
                                            nome: _name.text,
                                            email: _email.text,
                                            senha: _password.text));

                                        services.setDadosNome(_name.text);
                                        services.setDadosEmail(_email.text);
                                        services.setDadosSenha(_password.text);
                                      });

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   HomePage()));
                                    }
                                  } catch (e) {
                                    print("Error: $e");
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

 */