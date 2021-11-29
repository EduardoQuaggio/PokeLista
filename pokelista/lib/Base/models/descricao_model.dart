class Descricao {
  String? descricao;
  Descricao({
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'flavor_text': descricao,
    };
  }

  factory Descricao.fromMap(Map<String, dynamic> map) {
    return Descricao(
      descricao: map['flavor_text'],
    );
  }
}
