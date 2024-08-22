import 'package:european_countries/screens/model/flags.dart';
import 'package:european_countries/screens/model/languages.dart';
import 'package:european_countries/screens/model/name.dart';

class Contries {
  Flags? flags;
  Name? name;
  List<String>? capital;
  String? region;
  Languages? languages;
  int? population;

  Contries(
      {this.flags,
      this.name,
      this.capital,
      this.region,
      this.languages,
      this.population});

  Contries.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ?  Name.fromJson(json['name']) : null;
    capital = json['capital'].cast<String>();
    region = json['region'];
    languages = json['languages'] != null
        ?  Languages.fromJson(json['languages'])
        : null;
    population = json['population'];
  }

  static List<Contries> listFromJson(
    List<dynamic> json,
  ) {
    return json == null
        ? []
        : json.map((value) => Contries.fromJson(value)).toList();
  }
}