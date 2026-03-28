import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/novo_item_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {
      "/novo": (_) => NovoItemPage(),
    },
  theme: ThemeData(
      primarySwatch: Colors.red, // cor principal do app
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red, // cor da AppBar
        foregroundColor: Colors.green, // cor do texto/ícones da AppBar
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green, // cor do botão flutuante
      ),
    ),
  ));
}