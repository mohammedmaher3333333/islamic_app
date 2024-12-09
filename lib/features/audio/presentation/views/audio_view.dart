import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/audio/presentation/views/widgets/surah_list_view_audio.dart';
import 'package:islamic_app/features/home/presentation/manger/quran_cubit/quran_cubit.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..loadQuranData(),
      child: const Scaffold(
        body: SurahListViewAudio(),
      ),
    );
  }
}
