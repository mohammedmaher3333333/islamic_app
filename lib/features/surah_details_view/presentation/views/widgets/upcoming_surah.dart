import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/font_manager.dart';
import 'package:islamic_app/core/utils/strings_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/core/utils/values_manager.dart';

import '../../../../home/data/models/surah_model/surah_model.dart';

class UpcomingSurah extends StatelessWidget {
  final List<SuraModel> allSurahs;
  final SuraModel currentSurah;

  const UpcomingSurah({
    super.key,
    required this.allSurahs,
    required this.currentSurah,
  });

  @override
  Widget build(BuildContext context) {
    // تحديد السور القادمة
    final upcomingSurahs = allSurahs
        .skipWhile((sura) => sura.index <= currentSurah.index)
        .take(4)
        .toList(); // اختيار أول 4 سور

    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.upcomingSurah,
                style: getBoldStyle(
                    fontSize: FontSize.s20, color: ColorManager.black),
              ),
              ...upcomingSurahs.map((sura) =>
                  upcomingSurah(surahName: sura.titleAr)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Padding upcomingSurah({required String surahName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.lightBlueGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_right,
              color: ColorManager.white,
              size: 30,
            ),
          ),
          Text(
            surahName,
            style: getSemiBoldStyle(fontSize: FontSize.s20),
          ),
        ],
      ),
    );
  }
}
