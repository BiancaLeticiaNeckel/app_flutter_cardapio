import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_cardapio.dart';
import '../providers/cardapio_provider.dart';

class EditarItemPage extends StatelessWidget {
  final ItemCardapio item;

  EditarItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final nomeCtrl = TextEditingController(text: item.nome);
    final precoCtrl = TextEditingController(text: item.preco.toString());
    final descCtrl = TextEditingController(text: item.descricao);

    return Scaffold(
      appBar: AppBar(title: const Text("Editar Item")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeCtrl,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: precoCtrl,
              decoration: const InputDecoration(labelText: "Preço"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Descrição"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final messenger = ScaffoldMessenger.of(context);

                try {
                  // Atualiza os valores do item
                  item.nome = nomeCtrl.text;
                  item.preco = double.parse(precoCtrl.text);
                  item.descricao = descCtrl.text;

                  // Usa o provider para atualizar
                  final provider = Provider.of<CardapioProvider>(context, listen: false);
                  await provider.atualizar(item);

                  // Feedback visual
                  messenger.showSnackBar(
                    const SnackBar(content: Text("Item atualizado com sucesso")),
                  );

                  navigator.pop(true);
                } catch (e) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("Erro ao atualizar: $e")),
                  );
                }
              },
              child: const Text("Salvar alterações"),
            ),
          ],
        ),
      ),
    );
  }
}
