class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

static List<Flags> listFromJson(
    List<dynamic> json,
  ) {
    return json == null
        ? []
        : json.map((value) => Flags.fromJson(value)).toList();
  }
}