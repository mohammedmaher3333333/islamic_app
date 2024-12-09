class JuzModel {
  final int id;
  final SuraVerse start;
  final SuraVerse end;

  JuzModel({required this.id, required this.start, required this.end});

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    return JuzModel(
      id: json['id'],
      start: SuraVerse.fromJson(json['start']),
      end: SuraVerse.fromJson(json['end']),
    );
  }
}

class SuraVerse {
  final int sura;
  final String verse;
  final String name;

  SuraVerse({required this.sura, required this.verse, required this.name});

  factory SuraVerse.fromJson(Map<String, dynamic> json) {
    return SuraVerse(
      sura: json['sura'],
      verse: json['verse'],
      name: json['name'],
    );
  }
}
