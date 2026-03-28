import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/item_cardapio.dart';
import '../services/cardapio_service.dart';

class EditarItemPage extends StatelessWidget {
  final ItemCardapio item;

  EditarItemPage({super.key, required this.item});

  final service = CardapioService(Dio());

  @override
  Widget build(BuildContext context) {
    final nomeCtrl = TextEditingController(text: item.nome);
    final precoCtrl = TextEditingController(text: item.preco.toString());
    final descCtrl = TextEditingController(text: item.descricao);

    return Scaffold(
      appBar: AppBar(title: Text("Editar Item")),
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
                item.nome = nomeCtrl.text;
                item.preco = double.parse(precoCtrl.text);
                item.descricao = descCtrl.text;

                await service.atualizar(item);

                  if (context.mounted) {
    Navigator.pop(context);
  }
              },
              child: Text("Salvar alterações"),
)
          ],
        ),
      ),
    );
  }
}