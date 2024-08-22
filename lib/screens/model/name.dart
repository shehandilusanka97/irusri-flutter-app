
class Name {
  String? common;
  String? official;

  Name({this.common, this.official});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
  }
static List<Name> listFromJson(
    List<dynamic> json,
  ) {
    return json == null
        ? []
        : json.map((value) => Name.fromJson(value)).toList();
  }
}
