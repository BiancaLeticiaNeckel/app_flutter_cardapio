import 'package:dio/dio.dart';
import '../models/item_cardapio.dart';

class CardapioService {
  final Dio _dio;
    CardapioService(this._dio){
    _dio.options.baseUrl =
        "https://cardapio-production-3462.up.railway.app/cardapio";
    _dio.options.headers = {"Content-Type": "application/json"};
    }

  Future<List<ItemCardapio>> listar() async {
    final response = await _dio.get('');
    return (response.data as List)
        .map((e) => ItemCardapio.fromJson(e))
        .toList();
  }

  Future<ItemCardapio> adicionar(ItemCardapio item) async {
    final response = await _dio.post(
      '',
      data: item.toJson(),
    );
    return ItemCardapio.fromJson(response.data);
  }

  Future<ItemCardapio> atualizar(ItemCardapio item) async {
    final response = await _dio.put(
      '${item.id}',
      data: item.toJson(),
    );
    return ItemCardapio.fromJson(response.data);
  }

  Future<void> deletar(int id) async {
    await _dio.delete('$id');
  }
}
