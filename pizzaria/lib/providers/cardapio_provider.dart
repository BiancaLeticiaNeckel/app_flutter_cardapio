import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/item_cardapio.dart';
import '../services/cardapio_service.dart';

class CardapioProvider extends ChangeNotifier {
  final CardapioService service = CardapioService(Dio());
  List<ItemCardapio> itens = [];
  bool carregando = false;

  Future<void> carregarItens() async {
    carregando = true;
    notifyListeners();
    itens = await service.listar();
    carregando = false;
    notifyListeners();
  }

  Future<void> adicionar(ItemCardapio item) async {
    await service.adicionar(item);
    await carregarItens();
  }

  Future<void> atualizar(ItemCardapio item) async {
    await service.atualizar(item);
    await carregarItens();
  }

  Future<void> deletar(int id) async {
    await service.deletar(id);
    await carregarItens();
  }
}