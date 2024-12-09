import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/surah_audio_details_view_body.dart';

import '../../../home/data/models/surah_model/surah_model.dart';

class SurahAudioDetailsView extends StatelessWidget {
  const SurahAudioDetailsView(
      {super.key, required this.surah, required this.allSurahs});

  final SuraModel surah;
  final List<SuraModel> allSurahs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SurahAudioDetailsViewBody(
          surah: surah,
          allSurahs: allSurahs,
        ),
      ),
    );
  }
}
