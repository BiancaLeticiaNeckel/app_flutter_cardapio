class ItemCardapio {
  int? id;
  String nome;
  double preco;
  String descricao;

  ItemCardapio({
    this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
  });

  factory ItemCardapio.fromJson(Map<String, dynamic> json) {
    return ItemCardapio(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'].toDouble(),
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'descricao': descricao,
    };
  }
}