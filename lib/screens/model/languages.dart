class Languages {
  String? nno;
  String? nob;
  String? smi;

  Languages({this.nno, this.nob, this.smi});

  Languages.fromJson(Map<String, dynamic> json) {
    nno = json['nno'];
    nob = json['nob'];
    smi = json['smi'];
  }

 static List<Languages> listFromJson(
    List<dynamic> json,
  ) {
    return json == null
        ? []
        : json.map((value) => Languages.fromJson(value)).toList();
  }
}
