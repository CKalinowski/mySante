class Symptom {
  Symptom({
    required this.id,
    required this.nomFr,
    required this.nomEn,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'] as int,
      nomFr: json['nomFr'] as String,
      nomEn: json['nomEn'] as String,
    );
  }
  final int id;
  final String nomFr;
  final String nomEn;
}
