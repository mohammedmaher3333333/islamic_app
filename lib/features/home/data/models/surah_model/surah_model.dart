class SuraModel {
  final String place;
  final String type;
  final int count;
  final String title;
  final String titleAr;
  final int index;
  final int pages;
  final List<JuzDetails> juz;
  List<String> audioFiles; // قائمة الملفات الصوتية الخاصة بالسورة

  SuraModel({
    required this.place,
    required this.type,
    required this.count,
    required this.title,
    required this.titleAr,
    required this.index,
    required this.pages,
    required this.juz,
    required this.audioFiles,
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
      audioFiles: [], // يتم ملء القائمة لاحقًا
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
void assignAudioFilesToSurahs(List<SuraModel> surahs, List<String> audioFiles) {
  final groupedFiles = groupAudioFilesBySura(audioFiles);

  for (SuraModel surah in surahs) {
    if (groupedFiles.containsKey(surah.index)) {
      surah.audioFiles.addAll(groupedFiles[surah.index]!);
    }
  }
}

Map<int, List<String>> groupAudioFilesBySura(List<String> audioFiles) {
  final Map<int, List<String>> suraAudioMap = {};

  for (String file in audioFiles) {
    final int suraNumber = int.parse(file.substring(0, 3)); // استخراج رقم السورة
    if (!suraAudioMap.containsKey(suraNumber)) {
      suraAudioMap[suraNumber] = [];
    }
    suraAudioMap[suraNumber]!.add(file);
  }

  return suraAudioMap;
}
