import 'package:flutter/material.dart';
import 'package:pim/src/controller/services/app_services.dart';
import 'package:pim/src/page/cadastrorio_page.dart';
import 'package:pim/src/page/funcionario_list_page.dart';
import 'package:pim/src/page/home_page.dart';
import 'package:pim/src/repositories/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      Provider<UserRepository>(create: (_) => UserRepository()),
      Provider<AppServices>(create: (_) => AppServices())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto PIM',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
