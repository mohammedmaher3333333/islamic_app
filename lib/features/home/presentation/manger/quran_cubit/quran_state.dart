import '../../../data/models/surah_model/glyph_model.dart';
import '../../../data/models/surah_model/juz_model.dart';
import '../../../data/models/surah_model/surah_model.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<SuraModel> suras;
  final List<JuzModel> juz;
  final List<GlyphModel> glyphs;

  QuranLoaded({
    required this.suras,
    required this.juz,
    required this.glyphs,
  });
}

class QuranError extends QuranState {
  final String message;

  QuranError({required this.message});
}
