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
  ));
}