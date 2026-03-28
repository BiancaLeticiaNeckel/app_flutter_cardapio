import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/item_cardapio.dart';
import '../services/cardapio_service.dart';
import 'editar_item_page.dart'; // certifique-se de importar a tela de edição

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final CardapioService service;
  late Future<List<ItemCardapio>> futureItens;

  @override
  void initState() {
    super.initState();
    service = CardapioService(Dio());
    futureItens = service.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cardápio da Pizzaria"), centerTitle: true,),
      body: FutureBuilder<List<ItemCardapio>>(
        future: futureItens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar dados"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum item encontrado"));
          }

          List<ItemCardapio> itens = snapshot.data!;

          return ListView.builder(
            itemCount: itens.length,
            itemBuilder: (context, index) {
              final item = itens[index];

              return ListTile(
                  title: Text(item.nome),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("R\$ ${item.preco.toStringAsFixed(2)}"),
      Text(item.descricao), // agora mostra a descrição
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
                        ).then((_) {
                          setState(() => futureItens = service.listar());
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await service.deletar(item.id!);
                        setState(() => futureItens = service.listar());
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/novo").then((_) {
            setState(() => futureItens = service.listar());
          });
        },
        backgroundColor: Colors.green,     // cor do círculo
  foregroundColor: Colors.white,     // cor do ícone "+"
  child: const Icon(Icons.add),
      ),
    );
  }
}
