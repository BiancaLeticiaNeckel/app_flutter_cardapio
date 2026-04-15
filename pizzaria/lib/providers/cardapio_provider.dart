import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/item_cardapio.dart';
import '../services/cardapio_service.dart';

class CardapioProvider extends ChangeNotifier {
final CardapioService service = CardapioService(Dio());

  List<ItemCardapio> itens = [];
  bool carregando = false;

  String mensagem = "";

  Future<void> carregarItens() async {
    carregando = true;
    notifyListeners();

    itens = await service.listar();

    carregando = false;
    notifyListeners();
  }

  void limparMensagem() {
    mensagem = "";
  }

  Future<bool> adicionar({
    required String nome,
    required String precoTexto,
    required String descricao,
  }) async {
    if (nome.isEmpty || precoTexto.isEmpty || descricao.isEmpty) {
      mensagem = "Preencha todos os campos";
      notifyListeners();
      return false;
    }

    final preco = double.tryParse(precoTexto.replaceAll(",", "."));
    if (preco == null) {
      mensagem = "Digite um preço válido";
      notifyListeners();
      return false;
    }

    await service.adicionar(
      ItemCardapio(
        nome: nome,
        preco: preco,
        descricao: descricao,
      ),
    );

    await carregarItens();

    mensagem = "Item salvo com sucesso";
    notifyListeners();
    return true;
  }

  Future<bool> atualizar({
    required ItemCardapio item,
    required String nome,
    required String precoTexto,
    required String descricao,
  }) async {
    if (nome.isEmpty || precoTexto.isEmpty || descricao.isEmpty) {
      mensagem = "Preencha todos os campos";
      notifyListeners();
      return false;
    }

    final preco = double.tryParse(precoTexto.replaceAll(",", "."));
    if (preco == null) {
      mensagem = "Digite um preço válido";
      notifyListeners();
      return false;
    }

    item.nome = nome;
    item.preco = preco;
    item.descricao = descricao;

    await service.atualizar(item);
    await carregarItens();

    mensagem = "Item atualizado com sucesso";
    notifyListeners();
    return true;
  }

  Future<String> deletar(int id) async {
    await service.deletar(id);
    await carregarItens();
    return "Item deletado com sucesso";
  }

}