import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cardapio_provider.dart';
import 'editar_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardapioProvider>();

    if (provider.carregando) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.itens.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Nenhum item encontrado")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Cardápio da Pizzaria"), centerTitle: true),
      body: ListView.builder(
        itemCount: provider.itens.length,
        itemBuilder: (context, index) {
          final item = provider.itens[index];
          return ListTile(
            title: Text(item.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("R\$ ${item.preco.toStringAsFixed(2)}"),
                Text(item.descricao),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditarItemPage(item: item),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    provider.deletar(item.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Item deletado com sucesso")),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/novo");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
