class Pokemon {
  final int? id;
  final String? name;
  final String? url;
  final PokemonSprites? sprites;
  final List<PokemonType>? types;
  final int? height;
  final int? weight;
  final List<PokemonAbility>? abilities;
  final List<PokemonStat>? stats;

  Pokemon({
    this.id,
    this.name,
    this.url,
    this.sprites,
    this.types,
    this.height,
    this.weight,
    this.abilities,
    this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      sprites: json['sprites'] != null
          ? PokemonSprites.fromJson(json['sprites'])
          : null,
      types: json['types'] != null
          ? List<PokemonType>.from(
              json['types'].map((x) => PokemonType.fromJson(x)))
          : null,
      height: json['height'],
      weight: json['weight'],
      abilities: json['abilities'] != null
          ? List<PokemonAbility>.from(
              json['abilities'].map((x) => PokemonAbility.fromJson(x)))
          : null,
      stats: json['stats'] != null
          ? List<PokemonStat>.from(
              json['stats'].map((x) => PokemonStat.fromJson(x)))
          : null,
    );
  }
}

class PokemonStat {
  final int? baseStat;
  final int? effort;
  final PokemonSpecies? stat;

  PokemonStat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat:
            json["stat"] == null ? null : PokemonSpecies.fromJson(json["stat"]),
      );
}

class PokemonAbility {
  final PokemonSpecies? ability;
  final bool? isHidden;
  final int? slot;

  PokemonAbility({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => PokemonAbility(
        ability: json["ability"] == null
            ? null
            : PokemonSpecies.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
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

class PokemonType {
  final int? slot;
  final PokemonSpecies? type;

  PokemonType({
    this.slot,
    this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type:
            json["type"] == null ? null : PokemonSpecies.fromJson(json["type"]),
      );
}

class PokemonSpecies {
  final String? name;
  final String? url;

  PokemonSpecies({
    this.name,
    this.url,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        name: json["name"],
        url: json["url"],
      );
}
