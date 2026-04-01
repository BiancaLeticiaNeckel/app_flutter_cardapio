import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/novo_item_page.dart';
import 'providers/cardapio_provider.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CardapioProvider()..carregarItens(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          "/novo": (_) => NovoItemPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.red, // cor principal do app
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red, // cor da AppBar
            foregroundColor: Colors.green, // cor do texto/ícones da AppBar
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green, // cor do botão flutuante
          ),
        ),
      );
  }
}
