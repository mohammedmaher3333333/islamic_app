import 'package:flutter/material.dart';
import 'package:islamic_app/features/home/data/models/surah_model/surah_model.dart';

class SurahImage extends StatelessWidget {
  final SuraModel surah;
  final List<SuraModel> allSurahs;

  const SurahImage({
    super.key,
    required this.surah,
    required this.allSurahs,
  });

  @override
  Widget build(BuildContext context) {

    final List<int> pageNumbers = calculatePageRange(surah, allSurahs);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          surah.titleAr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: pageNumbers.length,
        itemBuilder: (context, index) {
          final int currentPage = pageNumbers[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              'assets/images/surahs/$currentPage.png',
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'Image not found',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<int> calculatePageRange(SuraModel surah, List<SuraModel> allSurahs) {
    final int surahIndex = allSurahs.indexOf(surah);
    final int startPage = surah.pages;

    final int endPage = (surahIndex < allSurahs.length - 1)
        ? allSurahs[surahIndex + 1].pages - 1
        : startPage + 20;
    return List<int>.generate(endPage - startPage + 1, (i) => startPage + i);
  }
}
