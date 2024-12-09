class SuraModel {
  final String place;
  final String type;
  final int count;
  final String title;
  final String titleAr;
  final int index;
  final int pages;
  final List<JuzDetails> juz;

  SuraModel({
    required this.place,
    required this.type,
    required this.count,
    required this.title,
    required this.titleAr,
    required this.index,
    required this.pages,
    required this.juz,
  });

  factory SuraModel.fromJson(Map<String, dynamic> json) {
    return SuraModel(
      place: json['place'],
      type: json['type'],
      count: json['count'],
      title: json['title'],
      titleAr: json['titleAr'],
      index: json['index'],
      pages: json['pages'],
      juz: (json['juz'] as List)
          .map((item) => JuzDetails.fromJson(item))
          .toList(),
    );
  }
}

class JuzDetails {
  final int index;
  final Verse verse;

  JuzDetails({required this.index, required this.verse});

  factory JuzDetails.fromJson(Map<String, dynamic> json) {
    return JuzDetails(
      index: json['index'],
      verse: Verse.fromJson(json['verse']),
    );
  }
}

class Verse {
  final String start;
  final String end;

  Verse({required this.start, required this.end});

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      start: json['start'],
      end: json['end'],
    );
  }
}
