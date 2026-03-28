import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/item_cardapio.dart';
import '../services/cardapio_service.dart';

class NovoItemPage extends StatelessWidget {
  NovoItemPage({super.key});

  final nomeCtrl = TextEditingController();
  final precoCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final service = CardapioService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Item")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeCtrl,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: precoCtrl,
              decoration: InputDecoration(labelText: "Preço"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descCtrl,
              decoration: InputDecoration(labelText: "Descrição"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
  onPressed: () async {
    final navigator = Navigator.of(context); // captura antes
    final messenger = ScaffoldMessenger.of(context); // captura antes

    try {
      await service.adicionar(
        ItemCardapio(
          nome: nomeCtrl.text,
          preco: double.parse(precoCtrl.text),
          descricao: descCtrl.text,
        ),
      );

      navigator.pop(true); // usa o navigator já capturado
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text("Erro ao salvar: $e")),
      );
    }
  },
  child: Text("Salvar"),
)

          ],
        ),
      ),
    );
  }
}