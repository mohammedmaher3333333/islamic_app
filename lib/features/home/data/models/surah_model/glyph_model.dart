class GlyphModel {
  final int? ayahNumber;
  final int? glyphId;
  final int? lineNumber;
  final int? maxX;
  final int? maxY;
  final int? minX;
  final int? minY;
  final int? pageNumber;
  final int? position;
  final int? suraNumber;

  GlyphModel({
     this.ayahNumber,
     this.glyphId,
     this.lineNumber,
     this.maxX,
     this.maxY,
     this.minX,
     this.minY,
     this.pageNumber,
     this.position,
     this.suraNumber,
  });

  factory GlyphModel.fromJson(Map<String, dynamic> json) {
    return GlyphModel(
      ayahNumber: json['ayah_number'],
      glyphId: json['glyph_id'],
      lineNumber: json['line_number'],
      maxX: json['max_x'],
      maxY: json['max_y'],
      minX: json['min_x'],
      minY: json['min_y'],
      pageNumber: json['page_number'],
      position: json['position'],
      suraNumber: json['sura_number'],
    );
  }
}
