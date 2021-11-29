class Categoria {
  String? nomeCategoria;
  Categoria({
    this.nomeCategoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nomeCategoria,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      nomeCategoria: map['name'],
    );
  }
}
