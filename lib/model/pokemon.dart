class Pokemon {
  final int? id;
  final String? name;
  final String? url;
  final PokemonSprites? sprites;

  Pokemon({
    this.id,
    this.name,
    this.url,
    this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      sprites: json['sprites'] != null
          ? PokemonSprites.fromJson(json['sprites'])
          : null,
    );
  }
}

class PokemonSprites {
  final String? backDefault;
  final String? frontDefault;

  PokemonSprites({
    this.backDefault,
    this.frontDefault,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      backDefault: json['back_default'],
      frontDefault: json['front_default'],
    );
  }
}
