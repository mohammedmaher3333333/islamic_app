import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/surah_model/glyph_model.dart';
import '../../../data/models/surah_model/juz_model.dart';
import '../../../data/models/surah_model/surah_model.dart';
import 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  /// تحميل بيانات القرآن من ملفات JSON
  Future<void> loadQuranData() async {
    emit(QuranLoading());

    try {
      // تحميل ملفات JSON وتحويلها إلى قوائم
      final suras = await _loadJsonData<SuraModel>(
        'assets/json/surah.json',
            (json) => SuraModel.fromJson(json),
      );
      final juz = await _loadJsonData<JuzModel>(
        'assets/json/juz.json',
            (json) => JuzModel.fromJson(json),
      );
      final glyphs = await _loadJsonData<GlyphModel>(
        'assets/json/glyph.json',
            (json) => GlyphModel.fromJson(json),
      );

      // إرسال الحالة المحملة بالبيانات
      emit(QuranLoaded(suras: suras, juz: juz, glyphs: glyphs));
    } catch (e) {
      // معالجة الخطأ وإرسال حالة الخطأ
      emit(QuranError(message: "Failed to load Quran data: ${e.toString()}"));
    }
  }

  /// تحميل وتحويل ملف JSON إلى قائمة من الكائنات
  Future<List<T>> _loadJsonData<T>(
      String path,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData.map((item) => fromJson(item as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Error loading $path: $e");
    }
  }
}
